-- Engine.lua
-- Xal's Reins - startup, saved variables, and the events that keep the
-- cached mount roster honest while you play.

local addonName, addonTable = ...
local Engine    = addonTable.Engine
local MountData = addonTable.MountData

local ACCENT = "|cffb88c38"
local WHITE  = "|cffffffff"
local RESET  = "|r"

local frame = CreateFrame("Frame")

local function EnsureDB()
    if type(XalsReinsDB) ~= "table" then XalsReinsDB = {} end
    if type(XalsReinsCharDB) ~= "table" then XalsReinsCharDB = {} end
end

function Engine:Init()
    EnsureDB()

    -- Registered before the roster build, so a journal that isn't ready yet
    -- can't cost the player their minimap button or settings entry.
    addonTable.SettingsPanel:Init()
    addonTable.MinimapButton:Register()

    -- The journal occasionally isn't populated the instant PLAYER_LOGIN fires.
    -- MountData:Ensure() rebuilds on first real use, so this is a soft failure
    -- rather than something to error on.
    MountData:Build()

    -- Starts this session's own live tracking of which mount's step chain
    -- was most recently touched, so the zone-alert icon's left-click always
    -- has somewhere fresh to point.
    addonTable.StepReminder:Start()

    -- The floating zone-alert icon - flashes when this zone has an
    -- acquirable mount, always visible otherwise unless that's turned off
    -- in settings. Needs the roster built first, same as the tracker itself.
    addonTable.ZoneAlertIcon:Init()

    -- Trading Post offerings often aren't loaded at PLAYER_LOGIN; retry a few
    -- times rather than permanently treating every Trading Post mount as
    -- unknown for the session.
    if not MountData:RefreshTradingPost() then
        local attempts = 0
        C_Timer.NewTicker(3, function(ticker)
            attempts = attempts + 1
            if MountData:RefreshTradingPost() or attempts >= 5 then
                ticker:Cancel()
                if addonTable.MainTracker:IsShown() then
                    addonTable.MainTracker:Refresh()
                end
            end
        end)
    end

    -- Faction locks are already resolved for every mount by now. Class, race
    -- and profession locks need a tooltip scan each, so they run progressively
    -- in the background and the tracker refreshes itself as they land.
    MountData:RefineTodo(function(done, total)
        if done == total and addonTable.MainTracker:IsShown() then
            addonTable.MainTracker:Refresh()
        end
    end)

    -- Tell the player what a patch added, rather than relying on them
    -- remembering to check. Flags anything with no prerequisite chain written,
    -- since that's the part that doesn't update itself.
    local newMounts = MountData:DetectNewMounts()
    if #newMounts > 0 then
        print(ACCENT .. "Xal's Reins:" .. RESET .. " " .. WHITE .. #newMounts ..
            RESET .. " mount(s) new to the journal since your last login:")
        for i = 1, #newMounts do
            local entry = newMounts[i]
            local note = ""
            if not MountData:GetSteps(entry) then
                note = " |cff999999(no steps written yet)|r"
            end
            print("  " .. WHITE .. entry.name .. RESET ..
                " |cff999999- " .. (entry.sourceLabel or "?") .. "|r" .. note)
        end
    end

    addonTable.WhatsNew:CheckAndShow()
end

frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("NEW_MOUNT_ADDED")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:RegisterEvent("QUEST_DATA_LOAD_RESULT")

frame:SetScript("OnEvent", function(_, event, arg1)
    if event == "PLAYER_LOGIN" then
        Engine:Init()

    elseif event == "QUEST_DATA_LOAD_RESULT" then
        -- A quest name we asked for has arrived; redraw so it appears.
        if addonTable.MountDetail:IsShown() then
            addonTable.MountDetail:Refresh()
        end

    elseif event == "ZONE_CHANGED_NEW_AREA" then
        -- Keeps the "this zone only" filter honest as the player moves.
        if addonTable.MainTracker:IsShown() then
            addonTable.MainTracker:Refresh()
        end

    elseif event == "NEW_MOUNT_ADDED" then
        -- arg1 is the mountID of whatever was just learned.
        local entry = MountData:MarkCollected(arg1)
        if entry and addonTable.MainTracker:IsShown() then
            addonTable.MainTracker:Refresh()
        end
        if entry and addonTable.CollectionWindow:IsShown() then
            addonTable.CollectionWindow:Refresh()
        end
        if entry and MountData.stats then
            print(ACCENT .. "Xal's Reins:" .. RESET .. " learned " .. WHITE .. entry.name ..
                  RESET .. " - " .. MountData.stats.collected .. " of " ..
                  MountData.stats.total .. " collected.")
        end
    end
end)
