-- StepReminder.lua
-- Xal's Reins - tracks whichever mount's step chain this character most
-- recently made progress on, for the floating zone-alert icon
-- (ZoneAlertIcon.lua) to read on left-click.
--
-- No longer shows its own popup (that was the intrusive login reminder -
-- removed 2026-09-13 in favour of the quiet icon-based version). This file
-- now does exactly one job: keep XalsReinsCharDB.lastCompletedStepMount
-- pointed at the right mount.
--
-- Deliberately narrow by design: NOT every mount that's one step from done
-- (could still be a wall of mounts at once) and NOT every mount with any
-- progress at all (same fatigue problem, worse). Only the single mount whose
-- step was completed most recently - that's always exactly one match, or
-- zero, never a pile.
--
-- Per-character, not account-wide: quest, reputation and currency progress
-- are all tracked per character, so "what did I last work on" only makes
-- sense scoped to whichever character actually did the work.

local addonName, addonTable = ...
addonTable.StepReminder = addonTable.StepReminder or {}
local Reminder  = addonTable.StepReminder
local MountData = addonTable.MountData

-- ── Live tracking ────────────────────────────────────────────
-- mount name -> steps done, as of the last check THIS SESSION. Session-only
-- on purpose: rebuilding fresh at login is what stops the very first scan
-- from being misread as "just finished everything".
local seenDone = {}
local baselineSet = false

local function InProgressEntries()
    local roster = MountData.roster
    local all = addonTable.MountSteps
    if not roster or not all then return {} end

    local list = {}
    for i = 1, #roster do
        local entry = roster[i]
        if not entry.isCollected and all[entry.name] then
            list[#list + 1] = entry
        end
    end
    return list
end

-- Re-checks every in-progress mount's step count. The first call each
-- session only establishes the baseline - nothing can be "just finished"
-- before the addon has looked at it once. Every call after that compares
-- against the baseline and records whichever mount's count went up, stamped
-- with the current time, so the icon's tooltip always names the freshest one.
local function Rescan()
    local entries = InProgressEntries()
    for i = 1, #entries do
        local entry = entries[i]
        local _, done = MountData:GetStepLines(entry)
        local prior = seenDone[entry.name]
        if baselineSet and prior and done and done > prior
            and type(XalsReinsCharDB) == "table" then
            XalsReinsCharDB.lastCompletedStepMount = entry.name
            XalsReinsCharDB.lastCompletedStepTime = time()
        end
        seenDone[entry.name] = done
    end
    baselineSet = true
end

-- Several different systems can finish a step (a quest, an achievement, a
-- currency, a reputation, an item pickup) and some of those events fire in
-- quick bursts. Coalesce into one rescan rather than checking on every
-- single event.
local rescanPending = false
local function QueueRescan()
    if rescanPending then return end
    rescanPending = true
    C_Timer.After(1, function()
        rescanPending = false
        Rescan()
    end)
end

-- Returns the mount entry this character most recently made progress on,
-- plus how many steps remain - only if it's still relevant (still exists,
-- still uncollected, still has steps left). Returns nil otherwise, so the
-- icon can treat "nothing tracked" and "tracked mount is done/gone" the
-- same way.
function Reminder:GetLastMountEntry()
    if type(XalsReinsCharDB) ~= "table" then return nil end
    local name = XalsReinsCharDB.lastCompletedStepMount
    if not name then return nil end

    local entry
    for _, e in ipairs(MountData.roster or {}) do
        if e.name == name then entry = e break end
    end
    if not entry or entry.isCollected then return nil end

    local _, done, total = MountData:GetStepLines(entry)
    if not done or not total or total == 0 or done >= total then return nil end

    return entry, total - done
end

-- Call once from Engine's Init, after the roster has been built.
function Reminder:Start()
    Rescan() -- establishes this session's baseline
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("QUEST_TURNED_IN")
frame:RegisterEvent("ACHIEVEMENT_EARNED")
frame:RegisterEvent("CURRENCY_DISPLAY_UPDATE")
frame:RegisterEvent("UPDATE_FACTION")
frame:RegisterEvent("BAG_UPDATE")
frame:SetScript("OnEvent", QueueRescan)
