-- ZoneAlertIcon.lua
-- Xal's Reins - a floating saddle icon, separate from the fixed minimap
-- button, that flashes when the zone you're standing in has a mount you can
-- actually go and get right now.
--
-- Deliberately NOT hidden by default: left-click always jumps to whichever
-- mount you most recently made progress on (StepReminder.lua), regardless of
-- what's in your current zone, so the icon needs to be there to click even
-- when this zone has nothing. The "Show reminder for last mount worked on"
-- setting controls that - turn it off and the icon only appears when this
-- zone genuinely has something, since there's no other reason to keep it on
-- screen.
--
-- Right-click opens the tracker with the zone-only filter forced on.
--
-- The glow is copied exactly from Quest Compass's own floating alert icon
-- (same file, its "CreateCompactIcon" - Interface\Cooldown\star4, ADD blend,
-- 1.875x the icon, Brand.ACCENT, 0.35-0.85 alpha bounce over 1.1s) rather
-- than reinvented, so it reads as the same visual language across addons.

local addonName, addonTable = ...
addonTable.ZoneAlertIcon = addonTable.ZoneAlertIcon or {}
local Alert     = addonTable.ZoneAlertIcon
local Brand     = addonTable.BrandStyle
local MountData = addonTable.MountData

local ICON_SIZE = 40
local ICON_PATH = "Interface\\AddOns\\XalsReins\\Textures\\MinimapIcon_v1.png"

local icon

local function ShowReminderEnabled()
    return type(XalsReinsDB) == "table" and XalsReinsDB.showLastMountReminder ~= false
end

-- The one mount (if any) in the to-do list that matches the zone you're
-- standing in right now. Reuses the exact same to-do/zone-matching MainTracker
-- itself filters on, so the icon can never disagree with what the tracker
-- would show for "this zone only".
local function ZoneMountEntry()
    local todo = MountData:GetTodoList()
    local zoneNames = MountData:CurrentZoneNames()
    for i = 1, #todo do
        if MountData:MatchesCurrentZone(todo[i], zoneNames) then
            return todo[i]
        end
    end
    return nil
end

local function BuildIcon()
    if icon then return icon end

    local f = CreateFrame("Button", "XalsReinsZoneAlertIcon", UIParent)
    f:SetSize(ICON_SIZE, ICON_SIZE)
    f:SetFrameStrata("MEDIUM")
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:RegisterForClicks("LeftButtonUp", "RightButtonUp")

    local pos = type(XalsReinsDB) == "table" and XalsReinsDB.zoneIconPos or nil
    if pos and pos.x then
        f:SetPoint("CENTER", UIParent, "CENTER", pos.x, pos.y)
    else
        f:SetPoint("CENTER", UIParent, "CENTER", 250, 260)
    end

    -- No circular backing/border - just the bare saddle art, per the locked
    -- design. Glow sits behind it, additive-blended so it reads as light
    -- rather than a flat colored shape - copied from Quest Compass exactly.
    local glow = f:CreateTexture(nil, "BACKGROUND")
    glow:SetTexture("Interface\\Cooldown\\star4")
    glow:SetBlendMode("ADD")
    glow:SetSize(ICON_SIZE * 1.875, ICON_SIZE * 1.875)
    glow:SetPoint("CENTER")
    glow:SetVertexColor(Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3])
    glow:Hide()
    f.glow = glow

    local glowAnim = glow:CreateAnimationGroup()
    glowAnim:SetLooping("BOUNCE")
    local glowAlpha = glowAnim:CreateAnimation("Alpha")
    glowAlpha:SetFromAlpha(0.35)
    glowAlpha:SetToAlpha(0.85)
    glowAlpha:SetDuration(1.1)
    glowAlpha:SetSmoothing("IN_OUT")
    f.glowAnim = glowAnim

    local tex = f:CreateTexture(nil, "ARTWORK")
    tex:SetAllPoints()
    tex:SetTexCoord(0.07, 0.93, 0.07, 0.93)
    tex:SetTexture(ICON_PATH)

    f:SetScript("OnDragStart", function(self) self:StartMoving() end)
    f:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local cx, cy = self:GetCenter()
        local ux, uy = UIParent:GetCenter()
        if type(XalsReinsDB) == "table" then
            XalsReinsDB.zoneIconPos = { x = cx - ux, y = cy - uy }
        end
    end)

    f:SetScript("OnClick", function(self, button)
        if button == "RightButton" then
            addonTable.MainTracker:ShowZoneOnly()
        else
            local entry = addonTable.StepReminder:GetLastMountEntry()
            if entry then addonTable.MountDetail:Show(entry) end
        end
    end)

    f:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("Xal's Reins", Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3])

        local lastEntry, remaining = addonTable.StepReminder:GetLastMountEntry()
        if lastEntry then
            GameTooltip:AddLine("|cff999999Left-click:|r " .. lastEntry.name ..
                " - " .. remaining .. " step" .. (remaining == 1 and "" or "s") .. " left")
        else
            GameTooltip:AddLine("|cff999999Left-click:|r nothing tracked yet")
        end

        if ZoneMountEntry() then
            GameTooltip:AddLine("|cff999999Right-click:|r mounts you can get in this zone")
        else
            GameTooltip:AddLine("|cff999999Right-click:|r nothing to get in this zone")
        end

        GameTooltip:Show()
    end)
    f:SetScript("OnLeave", function() GameTooltip:Hide() end)

    icon = f
    return f
end

-- Decides whether the icon itself shows, and whether the glow plays -
-- these are two separate questions. The icon shows either because the
-- setting keeps it up always, or because this zone genuinely has something;
-- the glow ONLY ever plays for the second reason.
function Alert:UpdateVisibility()
    local f = BuildIcon()
    local hasZoneMount = ZoneMountEntry() ~= nil

    if hasZoneMount or ShowReminderEnabled() then
        f:Show()
    else
        f:Hide()
    end

    if hasZoneMount then
        f.glow:Show()
        if not f.glowAnim:IsPlaying() then f.glowAnim:Play() end
    else
        f.glow:Hide()
        f.glowAnim:Stop()
    end
end

-- Call once from Engine's Init, after the roster has been built.
function Alert:Init()
    self:UpdateVisibility()
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:RegisterEvent("NEW_MOUNT_ADDED")
frame:SetScript("OnEvent", function()
    if icon then Alert:UpdateVisibility() end
end)
