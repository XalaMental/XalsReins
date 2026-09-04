-- SettingsPanel.lua
-- Xal's Reins - settings.
--
-- Two ways in, per the standard: a standalone floating window (the PRIMARY
-- one, opened by /xro options) and an entry in Blizzard's own AddOns list
-- (secondary, so it's findable where people expect it).
--
-- Deliberately thin for now - the real toggles land alongside the mount list
-- window. What's here is the frame, the brand styling, and the Discord link.

local addonName, addonTable = ...
local SettingsPanel = addonTable.SettingsPanel
local Brand         = addonTable.BrandStyle

local PANEL_NAME = "Xal's Reins"
-- No fixed height - every element below is chained TOP-to-previous-BOTTOM
-- (a real relative stack), then the total height is added up directly from
-- each piece's own real size (GetStringHeight() works immediately after
-- SetText(), no need to wait for the frame to be shown/laid out first).
local WIN_W = 420
local INITIAL_H = 500

local window, rootPanel

local function BuildWindow()
    if window then return window end

    local f = CreateFrame("Frame", "XalsReinsOptionsWindow", UIParent)
    f:SetSize(WIN_W, INITIAL_H)
    f:SetFrameStrata("HIGH")
    f:SetToplevel(true)
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        if type(XalsReinsDB) == "table" then
            local point, _, relPoint, x, y = self:GetPoint()
            XalsReinsDB.optionsPos = { point = point, relPoint = relPoint, x = x, y = y }
        end
    end)
    f:SetClampedToScreen(true)

    -- Distinct default offset so this can't land on top of another Xal's
    -- addon's window; (300, 60) isn't used by any existing one.
    local pos = type(XalsReinsDB) == "table" and XalsReinsDB.optionsPos or nil
    if pos and pos.point then
        f:SetPoint(pos.point, UIParent, pos.relPoint, pos.x, pos.y)
    else
        f:SetPoint("CENTER", UIParent, "CENTER", 300, 60)
    end

    Brand.ApplyBackground(f)
    Brand.DrawBorder(f)

    Brand.Title(f, "Xal's Reins", 24, "TOP", f, "TOP", 0, -Brand.SAFE_MARGIN - 6)

    local discord = Brand.MakeDiscordLink(f)
    discord:SetPoint("TOPRIGHT", f, "TOPRIGHT", -Brand.SAFE_MARGIN, -Brand.SAFE_MARGIN)

    Brand.DrawDivider(f, Brand.SAFE_MARGIN, 66, WIN_W - (Brand.SAFE_MARGIN * 2))

    local NOTE_TOP = 84 -- fixed - clears the title/discord-link/divider chrome above it
    local note = Brand.FS(f, "Settings arrive with the mount list window. For now, "
        .. "/xro shows your collection summary, /xro sources breaks it down by how "
        .. "mounts are obtained, and /xro find <name> looks one up.",
        Brand.BODY_FONT_PATH, 13, nil, Brand.GOLD[1], Brand.GOLD[2], Brand.GOLD[3])
    note:SetPoint("TOPLEFT", f, "TOPLEFT", Brand.SAFE_MARGIN + 6, -NOTE_TOP)
    note:SetPoint("RIGHT", f, "RIGHT", -Brand.SAFE_MARGIN - 6, 0)
    note:SetJustifyH("LEFT")
    note:SetWordWrap(true)

    -- Minimap button toggle. Brand checkbox, not UICheckButtonTemplate, and
    -- driven by cb.OnToggle rather than an OnClick script - the brand
    -- checkbox uses OnClick internally to flip its own state first. Anchored
    -- off note's own bottom (a real relative chain) instead of a fixed
    -- frame position.
    local CHECK_SIZE = 22
    local mmCheck = Brand.MakeCheckbox(f, CHECK_SIZE)
    mmCheck:SetPoint("TOPLEFT", note, "BOTTOMLEFT", 0, -20)

    local mmLabel = Brand.FS(f, "Show the minimap button", Brand.BODY_FONT_PATH, 14, nil,
        Brand.GOLD[1], Brand.GOLD[2], Brand.GOLD[3])
    mmLabel:SetPoint("LEFT", mmCheck, "RIGHT", 8, 0)
    mmLabel:SetPoint("RIGHT", f, "RIGHT", -Brand.SAFE_MARGIN, 0)
    mmLabel:SetJustifyH("LEFT")
    mmLabel:SetWordWrap(true)

    local hidden = type(XalsReinsDB) == "table" and XalsReinsDB.minimap and XalsReinsDB.minimap.hide
    mmCheck:SetChecked(not hidden)
    mmCheck.OnToggle = function(self)
        addonTable.MinimapButton:SetShown(self:GetChecked() and true or false)
    end

    local close = Brand.MakeCloseButton(f, function() f:Hide() end)
    close:SetPoint("TOP", mmCheck, "BOTTOM", 0, -Brand.SAFE_MARGIN)

    -- Total height, added up directly from each piece's own real size - not
    -- measured back off the frame after the fact. This panel's text is all
    -- static (never varies at runtime), so this only ever needs computing
    -- once at build time.
    f:SetHeight(NOTE_TOP + note:GetStringHeight() + 20 + CHECK_SIZE
        + Brand.SAFE_MARGIN + 20 + Brand.SAFE_MARGIN)

    f:Hide()
    window = f
    return f
end

-- The AddOns-list entry. Points people at the standalone window rather than
-- duplicating controls in two places.
local function BuildCanvasPanel()
    if rootPanel then return rootPanel end

    local panel = CreateFrame("Frame")
    panel.name = PANEL_NAME

    local title = Brand.FS(panel, PANEL_NAME, Brand.TITLE_FONT_PATH, 22, nil,
        Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3])
    title:SetPoint("TOPLEFT", panel, "TOPLEFT", 16, -16)

    local blurb = Brand.FS(panel, "A mount tracker that shows every mount in the game "
        .. "and how to get it.", Brand.BODY_FONT_PATH, 13, nil,
        Brand.GOLD[1], Brand.GOLD[2], Brand.GOLD[3])
    blurb:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -10)

    local open = Brand.MakeButton(panel, "Open Xal's Reins options", 220, 28, function()
        SettingsPanel:Open()
    end)
    open:SetPoint("TOPLEFT", blurb, "BOTTOMLEFT", 0, -20)

    rootPanel = panel
    return panel
end

function SettingsPanel:Init()
    BuildCanvasPanel()

    if Settings and Settings.RegisterCanvasLayoutCategory then
        local category = Settings.RegisterCanvasLayoutCategory(rootPanel, rootPanel.name)
        category.ID = rootPanel.name
        Settings.RegisterAddOnCategory(category)
        SettingsPanel.category = category
    elseif InterfaceOptions_AddCategory then
        InterfaceOptions_AddCategory(rootPanel)
    end
end

-- The primary entry point: the standalone window.
function SettingsPanel:Open()
    local f = BuildWindow()
    if f:IsShown() then f:Hide() else f:Show() end
end
