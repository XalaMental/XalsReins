-- StepReminder.lua
-- Xal's Reins - reminds the player, on login, about whichever mount's step
-- chain they most recently made progress on.
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
local Brand     = addonTable.BrandStyle
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
-- with the current time, so the NEXT login can show it.
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

-- ── The popup ────────────────────────────────────────────────
-- No fixed height, and no placeholder-then-shrink trick either - a
-- hardcoded 150 was too short for the actual content, so the buttons sat on
-- top of the text instead of below it (confirmed 2026-09-02). Every element
-- below is chained TOP-to-previous-BOTTOM (a real relative stack, not fixed
-- offsets from the frame's own top), then the total height is added up
-- directly from each piece's own real size right after it's built -
-- GetStringHeight() on a FontString works immediately after SetText(), no
-- need to wait for the frame to actually be shown/laid out first.
local FW = 380
local ICON_SIZE = 36
local GAP_TITLE_ICON = 12
local GAP_ICON_NAME = 8
local GAP_NAME_SUB = 4
local BTN_W, BTN_H = 110, 26

local function BuildPopup(entry, remaining)
    local f = CreateFrame("Frame", "XalsReinsStepReminder", UIParent)
    f:SetWidth(FW)
    f:SetFrameStrata("DIALOG")
    f:SetToplevel(true)
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
    f:SetClampedToScreen(true)
    f:SetPoint("CENTER", UIParent, "CENTER", 0, 220)

    Brand.ApplyBackground(f)
    Brand.DrawBorder(f)

    local title = Brand.Title(f, "Pick up where you left off", 16, "TOP", f, "TOP", 0, -Brand.SAFE_MARGIN)

    local icon = f:CreateTexture(nil, "ARTWORK")
    icon:SetSize(ICON_SIZE, ICON_SIZE)
    icon:SetPoint("TOP", title, "BOTTOM", 0, -GAP_TITLE_ICON)
    icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
    icon:SetTexture(entry.icon)

    local name = Brand.FS(f, entry.name, Brand.BODY_FONT_PATH, 14, nil, 1, 1, 1)
    name:SetPoint("TOP", icon, "BOTTOM", 0, -GAP_ICON_NAME)
    name:SetJustifyH("CENTER")

    local sub = Brand.FS(f, remaining .. " step" .. (remaining == 1 and "" or "s") .. " left to go.",
        Brand.BODY_FONT_PATH, 12, nil, Brand.GOLD[1], Brand.GOLD[2], Brand.GOLD[3])
    sub:SetPoint("TOP", name, "BOTTOM", 0, -GAP_NAME_SUB)
    sub:SetJustifyH("CENTER")

    local viewBtn = Brand.MakeButton(f, "Show me", BTN_W, BTN_H, function()
        f:Hide()
        addonTable.MountDetail:Show(entry)
    end)
    viewBtn:SetPoint("TOP", sub, "BOTTOM", -60, -Brand.SAFE_MARGIN)

    local dismiss = Brand.MakeButton(f, "Dismiss", BTN_W, BTN_H, function()
        f:Hide()
    end)
    dismiss:SetPoint("TOP", sub, "BOTTOM", 60, -Brand.SAFE_MARGIN)

    -- Total height = every piece's own real size, added up directly - not
    -- measured back off the frame after the fact.
    f:SetHeight(Brand.SAFE_MARGIN + title:GetStringHeight() + GAP_TITLE_ICON
        + ICON_SIZE + GAP_ICON_NAME + name:GetStringHeight() + GAP_NAME_SUB
        + sub:GetStringHeight() + Brand.SAFE_MARGIN + BTN_H + Brand.SAFE_MARGIN)

    return f
end

-- Reads whichever mount this character most recently finished a step on
-- (from a PREVIOUS session - this runs before this session's own baseline
-- overwrites anything) and shows the popup if it's still relevant: the
-- mount still exists, still isn't collected, and still has steps left.
function Reminder:CheckAndShow()
    if type(XalsReinsCharDB) ~= "table" then return end
    local name = XalsReinsCharDB.lastCompletedStepMount
    if not name then return end

    local entry
    for _, e in ipairs(MountData.roster or {}) do
        if e.name == name then entry = e break end
    end

    -- Gone, already learned, or no longer has steps written - nothing to
    -- remind about. Leave the saved name in place rather than clearing it;
    -- it just won't match anything and this becomes a silent no-op.
    if not entry or entry.isCollected then return end

    local _, done, total = MountData:GetStepLines(entry)
    if not done or not total or total == 0 or done >= total then return end

    local ok, frame = pcall(BuildPopup, entry, total - done)
    if ok and frame then frame:Show() end
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
