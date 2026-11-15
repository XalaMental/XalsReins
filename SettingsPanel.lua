-- SettingsPanel.lua
-- Xal's Reins - settings.
--
-- Two ways in, per the standard: a standalone floating window (the PRIMARY
-- one, opened by /xro options) and an entry in Blizzard's own AddOns list
-- (secondary, so it's findable where people expect it).
--
-- The family settings layout, same as Xal's Welcome Wagon / Warchest: a header
-- with a centered title and divider, a left sidebar of sections with the
-- Discord link pinned to its bottom, and one small page per section. Every
-- setting sits in its own bordered card. The window's height fits whichever
-- page is open.

local addonName, addonTable = ...
local SettingsPanel = addonTable.SettingsPanel
local Brand         = addonTable.BrandStyle

local PANEL_NAME = "Xal's Reins"

local SIDEBAR_W = 132
local CONTENT_W = 340
local WIN_W = 14 + SIDEBAR_W + 10 + 2 + 26 + CONTENT_W + 14
-- Height is dynamic: the window fits whichever page is open (FitWindow),
-- never shorter than the sidebar needs.
local MIN_H = 400

local RIGHT_MARGIN = 16
local PANEL_LABEL_FONT_SIZE = 14
local PANEL_DESC_FONT_SIZE  = 13

local window, rootPanel
local sidebar, content
local FitWindow -- defined below
local sectionButtons = {}
local activeSection = "Home"

local function DB()
    return type(XalsReinsDB) == "table" and XalsReinsDB or {}
end

-- ── Cards ────────────────────────────────────────────────────────
-- Every setting lives in its own card - a mini panel with the lighter card
-- fill and thin border (Brand.ApplyCardBackground + Brand.DrawBorder(card, 0)),
-- a title, a short divider under it, then the setting's controls. Cards stack
-- down the page.
--
-- Everything inside a card chains off `card.anchor` (the last element added),
-- so FitCard can size the card from that element's real bottom once the page
-- has drawn - no GetStringHeight guessing.
local CARD_PAD = 10
local CARD_GAP = 12
local pageCards = {}

local function NewCard(parent, title)
    local card = CreateFrame("Frame", nil, parent)
    local prev = pageCards[#pageCards]
    if prev then
        card:SetPoint("TOPLEFT", prev, "BOTTOMLEFT", 0, -CARD_GAP)
    else
        card:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, 0)
    end
    card:SetPoint("RIGHT", parent, "RIGHT", 0, 0)
    card:SetHeight(60) -- placeholder; FitCard sets the real height
    Brand.ApplyCardBackground(card)
    Brand.DrawBorder(card, 0)

    if title then
        local t = Brand.FS(card, title, Brand.BODY_FONT_PATH_SEMIBOLD, 14, nil,
            Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3])
        t:SetPoint("TOPLEFT", card, "TOPLEFT", CARD_PAD, -8)

        local div = card:CreateTexture(nil, "ARTWORK")
        div:SetColorTexture(Brand.DIVIDER_COLOR[1], Brand.DIVIDER_COLOR[2], Brand.DIVIDER_COLOR[3], 1)
        div:SetHeight(Brand.LINE_THICKNESS)
        div:SetPoint("TOPLEFT", card, "TOPLEFT", CARD_PAD, -30)
        div:SetPoint("TOPRIGHT", card, "TOPRIGHT", -CARD_PAD, -30)
        card.anchor = div
    else
        -- Untitled card (Home): content starts from an invisible top edge.
        local top = card:CreateTexture(nil, "ARTWORK")
        top:SetColorTexture(0, 0, 0, 0)
        top:SetHeight(1)
        top:SetPoint("TOPLEFT", card, "TOPLEFT", CARD_PAD, -2)
        top:SetPoint("TOPRIGHT", card, "TOPRIGHT", -CARD_PAD, -2)
        card.anchor = top
    end
    pageCards[#pageCards + 1] = card
    return card
end

-- Places `elem` under the card's last element, flush with the card's left
-- padding (xNudge shifts it).
local function Place(card, elem, gap, xNudge)
    elem:SetPoint("TOPLEFT", card.anchor, "BOTTOMLEFT", xNudge or 0, -gap)
    card.anchor = elem
end

local function FitCard(card)
    local top, bottom = card:GetTop(), card.anchor and card.anchor:GetBottom()
    if top and bottom then
        card:SetHeight(math.max(40, (top - bottom) + CARD_PAD + 2))
    end
end

-- Wrapped description text.
local function CardDesc(card, text, gap)
    local desc = Brand.FS(card, "", Brand.BODY_FONT_PATH, PANEL_DESC_FONT_SIZE, nil,
        Brand.DESC_COLOR[1], Brand.DESC_COLOR[2], Brand.DESC_COLOR[3])
    desc:SetPoint("RIGHT", card, "RIGHT", -CARD_PAD, 0)
    desc:SetJustifyH("LEFT")
    desc:SetWordWrap(true)
    desc:SetText(text)
    Place(card, desc, gap)
    return desc
end

-- Checkbox + label + description. `onChange(newValue)` is called when it's
-- clicked.
local function CardCheck(card, label, description, isChecked, onChange)
    local cb = Brand.MakeCheckbox(card, 20)
    cb:SetChecked(isChecked and true or false)
    cb.OnToggle = function(self)
        onChange(self:GetChecked() and true or false)
    end
    Place(card, cb, 10)

    local text = Brand.FS(card, label, Brand.BODY_FONT_PATH, PANEL_LABEL_FONT_SIZE, nil,
        Brand.TEXT_COLOR[1], Brand.TEXT_COLOR[2], Brand.TEXT_COLOR[3])
    text:SetPoint("LEFT", cb, "RIGHT", 8, 0)
    text:SetPoint("RIGHT", card, "RIGHT", -CARD_PAD, 0)
    text:SetJustifyH("LEFT")
    text:SetWordWrap(true)

    CardDesc(card, description, 4)
end

local function CardLink(card, label, onClick)
    local link = Brand.MakeTextLink(card, label, onClick)
    Place(card, link, 6, -4)
    -- Next element lines back up with the card padding, not the link's nudge.
    local spacer = card:CreateTexture(nil, "ARTWORK")
    spacer:SetSize(1, 1)
    spacer:SetColorTexture(0, 0, 0, 0)
    spacer:SetPoint("TOPLEFT", link, "BOTTOMLEFT", 4, 0)
    card.anchor = spacer
end

-- OptionsSliderTemplate's Low/High/Text sub-regions are only reachable via
-- the old global-name convention (_G[name.."Low"] etc) - needs a real frame
-- name.
local sliderNameCounter = 0
local function CardSlider(card, label, min, max, step, value, formatFn, onChange)
    local lbl = Brand.FS(card, label, Brand.BODY_FONT_PATH, PANEL_LABEL_FONT_SIZE, nil,
        Brand.TEXT_COLOR[1], Brand.TEXT_COLOR[2], Brand.TEXT_COLOR[3])
    Place(card, lbl, 12)

    sliderNameCounter = sliderNameCounter + 1
    local sliderName = "XalsReinsSlider" .. sliderNameCounter
    local slider = CreateFrame("Slider", sliderName, card, "OptionsSliderTemplate")
    slider:SetWidth(CONTENT_W - CARD_PAD * 2 - 16)
    slider:SetMinMaxValues(min, max)
    slider:SetValueStep(step)
    slider:SetObeyStepOnDrag(true)
    Place(card, slider, 22, 4)
    slider:SetValue(value)

    _G[sliderName .. "Low"]:SetText("")
    _G[sliderName .. "High"]:SetText("")
    _G[sliderName .. "Text"]:SetText(formatFn(value))
    -- Blizzard's template hardcodes these gold.
    for _, suffix in ipairs({ "Low", "High", "Text" }) do
        _G[sliderName .. suffix]:SetTextColor(Brand.TEXT_COLOR[1], Brand.TEXT_COLOR[2], Brand.TEXT_COLOR[3])
    end

    slider:SetScript("OnValueChanged", function(_, val)
        val = math.floor(val / step + 0.5) * step
        _G[sliderName .. "Text"]:SetText(formatFn(val))
        onChange(val)
    end)
end

-- ── Sidebar link selection ───────────────────────────────────────
-- Only the open section reads as "on" (the skin's selected-tab color); every
-- other link sits in the skin's muted tab color.
local function SetLinkSelected(btn, selected)
    local c = selected and Brand.TAB_SELECTED_COLOR or Brand.TAB_COLOR
    btn.label:SetTextColor(c[1], c[2], c[3], 1)
    btn.selected = selected
    btn:SetScript("OnLeave", function()
        local cc = btn.selected and Brand.TAB_SELECTED_COLOR or Brand.TAB_COLOR
        btn.label:SetTextColor(cc[1], cc[2], cc[3], 1)
    end)
end

-- ── Home ─────────────────────────────────────────────────────────
-- One untitled card holding the icon, lead line, rule and body text, all
-- centered inside it.
local function BuildHome(parent)
    local card = NewCard(parent, nil)

    local icon = card:CreateTexture(nil, "ARTWORK")
    icon:SetSize(100, 100)
    icon:SetPoint("TOP", card, "TOP", 0, -14)
    icon:SetTexture("Interface\\AddOns\\XalsReins\\Icon.png")

    local lead = Brand.FS(card, "Every mount you're missing, and how to get it.",
        Brand.TITLE_FONT_PATH, 16, nil,
        Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3])
    lead:SetPoint("TOP", icon, "BOTTOM", 0, -14)
    lead:SetWidth(CONTENT_W - 40)
    lead:SetJustifyH("CENTER")
    lead:SetWordWrap(true)

    local rule = card:CreateTexture(nil, "ARTWORK")
    rule:SetColorTexture(Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3], 1)
    rule:SetSize(50, Brand.LINE_THICKNESS)
    rule:SetPoint("TOP", lead, "BOTTOM", 0, -14)

    local body = Brand.FS(card, "A to-do list of the mounts you don't own yet that this "
        .. "character can really go and get, with the in-game source for each one and "
        .. "every step in between, ticking itself off as you go.",
        Brand.BODY_FONT_PATH, 12, nil,
        Brand.BODY_COLOR[1], Brand.BODY_COLOR[2], Brand.BODY_COLOR[3])
    body:SetPoint("TOP", rule, "BOTTOM", 0, -14)
    body:SetWidth(CONTENT_W - 40)
    body:SetJustifyH("CENTER")
    body:SetWordWrap(true)
    card.anchor = body

    -- With Xal's Keep installed, the Keep's single icon is the minimap button and
    -- the zone alert for the whole collection suite, so those two settings
    -- would do nothing here. Say where they live instead of showing dead controls.
    if XalsKeep then
        local keep = NewCard(parent, "Xal's Keep")
        CardDesc(keep, "Xal's Keep is installed, so the minimap button and the zone "
            .. "alert now live in the Keep. Change them in the Keep's settings.", 10)
    end
end

-- ── Zone alert ───────────────────────────────────────────────────
local function BuildZoneAlert(parent)
    local Alert = addonTable.ZoneAlertIcon

    local show = NewCard(parent, "Zone alert icon")
    CardCheck(show, "Show the zone alert icon",
        "A small floating icon that appears, glows and counts while you're standing in a "
        .. "zone with a mount you can still get. Click it to open the Zone tab.",
        not DB().zoneIconHide,
        function(value) Alert:SetShown(value) end)

    local size = NewCard(parent, "Icon size")
    CardSlider(size, "Size", 0.5, 2.0, 0.1, tonumber(DB().zoneIconScale) or 1.0,
        function(v) return math.floor(v * 100 + 0.5) .. "%" end,
        function(v)
            if type(XalsReinsDB) == "table" then XalsReinsDB.zoneIconScale = v end
            Alert:ApplyScale()
        end)

    local pos = NewCard(parent, "Icon position")
    CardDesc(pos, "Drag the icon anywhere on your screen. If it ends up somewhere you "
        .. "can't find, put it back.", 10)
    CardLink(pos, "Reset icon position", function() Alert:ResetPosition() end)
end

-- ── Minimap ──────────────────────────────────────────────────────
local function BuildMinimap(parent)
    local card = NewCard(parent, "Minimap button")
    local hidden = DB().minimap and DB().minimap.hide
    CardCheck(card, "Show the minimap button",
        "Left-click opens the tracker, right-click opens these settings.",
        not hidden,
        function(value) addonTable.MinimapButton:SetShown(value) end)
end

-- ── Skin ─────────────────────────────────────────────────────────
-- Just colors (XalsSkins.lua, shared by every Xal's addon). Picking one
-- re-colors every Reins window right away (SettingsPanel:ApplySkinLive).
local function BuildSkin(parent)
    local Skins = addonTable.Skins
    local card = NewCard(parent, "Skin")
    CardDesc(card, "The colors every Reins window uses. The layout never changes.", 10)
    if not Skins then return end

    local COLS, GAP, BTN_H = 2, 8, 26
    local btnW = math.floor((CONTENT_W - CARD_PAD * 2 - GAP * (COLS - 1)) / COLS)
    local first, last
    for i, key in ipairs(Skins.ORDER) do
        local col, row = (i - 1) % COLS, math.floor((i - 1) / COLS)
        local btn = Brand.MakeButton(card, Skins.LABELS[key], btnW, BTN_H, function()
            if key == Brand.skinKey then return end
            -- The window this button lives in is about to be rebuilt, so wait
            -- until the click has finished before doing it.
            C_Timer.After(0, function() SettingsPanel:ApplySkinLive(key) end)
        end)
        if not first then
            Place(card, btn, 10)
            first = btn
        else
            btn:SetPoint("TOPLEFT", first, "TOPLEFT", col * (btnW + GAP), -row * BTN_H)
        end
        btn:SetSelected(key == Brand.skinKey)
        last = btn
    end
    -- Size the card to the bottom row, not the first button.
    card.anchor = last

    if XalsKeep then
        local note = NewCard(parent, "Inside Xal's Keep")
        CardDesc(note, "The tracker belongs to the Keep, so it takes the new colors the "
            .. "next time the game loads. Everything else changes right away.", 10)
    end
end

-- The sections shown in the sidebar. Inside Xal's Keep the minimap button and
-- zone alert are the Keep's, so those two pages are left out.
local function GetSections()
    local list = { { name = "Home", build = BuildHome } }
    if not XalsKeep then
        list[#list + 1] = { name = "Zone alert", build = BuildZoneAlert }
        list[#list + 1] = { name = "Minimap", build = BuildMinimap }
    end
    list[#list + 1] = { name = "Skin", build = BuildSkin }
    return list
end

local function ClearContent()
    wipe(pageCards)
    for _, child in ipairs({ content:GetChildren() }) do
        child:Hide()
        child:SetParent(nil)
    end
    for _, region in ipairs({ content:GetRegions() }) do
        region:Hide()
    end
end

-- Fits the window to the open page: sizes each card to its contents, then
-- (one frame later, once those new heights have laid out) finds the lowest
-- visible element in the content area and sizes the window to clear it.
local function MeasureWindow()
    if not window or not content then return end
    local top = window:GetTop()
    if not top then return end
    local lowest
    for _, child in ipairs({ content:GetChildren() }) do
        if child:IsShown() and child:GetBottom() then
            lowest = math.min(lowest or child:GetBottom(), child:GetBottom())
        end
    end
    for _, region in ipairs({ content:GetRegions() }) do
        if region:IsShown() and region:GetAlpha() > 0 and region:GetBottom() then
            lowest = math.min(lowest or region:GetBottom(), region:GetBottom())
        end
    end
    if not lowest then return end
    window:SetHeight(math.max(MIN_H, (top - lowest) + 24 + Brand.SAFE_MARGIN))
end

FitWindow = function()
    if not window or not content then return end
    for _, card in ipairs(pageCards) do FitCard(card) end
    C_Timer.After(0, MeasureWindow)
end

local function ShowSection(name)
    local sections = GetSections()
    local found
    for _, section in ipairs(sections) do
        if section.name == name then found = section break end
    end
    if not found then found = sections[1] end
    activeSection = found.name

    for key, btn in pairs(sectionButtons) do
        SetLinkSelected(btn, key == activeSection)
    end
    ClearContent()
    found.build(content)
    C_Timer.After(0, FitWindow)
end

local function BuildWindow()
    if window then return window end

    local f = CreateFrame("Frame", "XalsReinsOptionsWindow", UIParent)
    tinsert(UISpecialFrames, "XalsReinsOptionsWindow")
    f:SetSize(WIN_W, MIN_H)
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
    local pos = DB().optionsPos
    if pos and pos.point then
        f:SetPoint(pos.point, UIParent, pos.relPoint, pos.x, pos.y)
    else
        f:SetPoint("CENTER", UIParent, "CENTER", 300, 60)
    end

    Brand.ApplyBackground(f)
    Brand.DrawBorder(f, 1)

    Brand.Title(f, PANEL_NAME, 28, "TOP", f, "TOP", 0, -20)

    local headerDivider = f:CreateTexture(nil, "ARTWORK")
    headerDivider:SetColorTexture(Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3], 1)
    headerDivider:SetHeight(Brand.LINE_THICKNESS)
    headerDivider:SetPoint("TOPLEFT", f, "TOPLEFT", Brand.SAFE_MARGIN, -70)
    headerDivider:SetPoint("TOPRIGHT", f, "TOPRIGHT", -Brand.SAFE_MARGIN, -70)

    local close = Brand.MakeCloseButton(f, function() f:Hide() end)
    close:SetPoint("TOPRIGHT", f, "TOPRIGHT", -Brand.SAFE_MARGIN, -Brand.SAFE_MARGIN)

    -- Sidebar
    sidebar = CreateFrame("Frame", nil, f)
    sidebar:SetPoint("TOPLEFT", f, "TOPLEFT", Brand.SAFE_MARGIN, -88)
    sidebar:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", Brand.SAFE_MARGIN, Brand.SAFE_MARGIN)
    sidebar:SetWidth(SIDEBAR_W)

    local vDivider = f:CreateTexture(nil, "ARTWORK")
    vDivider:SetColorTexture(Brand.DIVIDER_COLOR[1], Brand.DIVIDER_COLOR[2], Brand.DIVIDER_COLOR[3], 1)
    vDivider:SetWidth(Brand.LINE_THICKNESS)
    vDivider:SetPoint("TOPLEFT", sidebar, "TOPRIGHT", 10, 0)
    vDivider:SetPoint("BOTTOMLEFT", sidebar, "BOTTOMRIGHT", 10, 0)

    content = CreateFrame("Frame", nil, f)
    content:SetPoint("TOPLEFT", vDivider, "TOPRIGHT", 26, -32)
    content:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -Brand.SAFE_MARGIN, Brand.SAFE_MARGIN)
    content:SetWidth(CONTENT_W)

    wipe(sectionButtons)
    local y = -32
    for _, section in ipairs(GetSections()) do
        local btn = Brand.MakeTextLink(sidebar, section.name, function()
            ShowSection(section.name)
        end)
        -- Left-justified in a fixed-width button so every entry starts at the
        -- same x instead of centering on its own text width; Inter SemiBold 15.
        btn.label:SetFont(Brand.BODY_FONT_PATH_SEMIBOLD, 15, "")
        btn.label:ClearAllPoints()
        btn.label:SetPoint("LEFT", btn, "LEFT", 0, 0)
        btn.label:SetJustifyH("LEFT")
        btn:SetWidth(SIDEBAR_W - 8)
        btn:SetPoint("TOPLEFT", sidebar, "TOPLEFT", 8, y)
        sectionButtons[section.name] = btn
        y = y - 28
    end

    -- The Discord link, pinned to the sidebar's own bottom edge so it stays put
    -- however many sections there are.
    local discord = Brand.MakeDiscordLink(sidebar)
    discord:SetPoint("BOTTOMLEFT", sidebar, "BOTTOMLEFT", 8, 0)

    f:Hide()
    window = f
    ShowSection(activeSection)
    return f
end

-- The AddOns-list entry. Points people at the standalone window rather than
-- duplicating controls in two places.
local function BuildCanvasPanel()
    if rootPanel then return rootPanel end

    local panel = CreateFrame("Frame")
    panel.name = PANEL_NAME

    local title = Brand.FS(panel, PANEL_NAME, Brand.TITLE_FONT_PATH, 22, nil,
        Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3])
    title:SetPoint("TOPLEFT", panel, "TOPLEFT", 16, -16)

    local blurb = Brand.FS(panel, "A mount tracker that shows every mount in the game "
        .. "and how to get it.", Brand.BODY_FONT_PATH, 13, nil,
        Brand.BODY_COLOR[1], Brand.BODY_COLOR[2], Brand.BODY_COLOR[3])
    blurb:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -10)
    blurb:SetPoint("RIGHT", panel, "RIGHT", -RIGHT_MARGIN, 0)
    blurb:SetJustifyH("LEFT")
    blurb:SetWordWrap(true)

    local open = Brand.MakeButton(panel, "Open Xal's Reins options", 220, 28, function()
        SettingsPanel:Open()
    end)
    open:SetPoint("TOPLEFT", blurb, "BOTTOMLEFT", 0, -20)

    panel.title, panel.blurb, panel.open = title, blurb, open
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

-- Switches skin without a reload. Windows keep the colors they were built with,
-- so each one is dropped and rebuilt from scratch in the new colors; whichever
-- were open open again. (Inside Xal's Keep the tracker belongs to the Keep, so
-- it is left as it is.)
function SettingsPanel:ApplySkinLive(key)
    if type(XalsReinsDB) ~= "table" then return end
    XalsReinsDB.skin = Brand.ApplySkin(key)

    local settingsWasOpen = window and window:IsShown()
    if window then window:Hide() end
    window = nil
    Brand.ResetSkinCaches()

    local trackerWasOpen = addonTable.MainTracker:ResetSkin()
    local collectionWasOpen = addonTable.CollectionWindow:ResetSkin()
    local detailEntry = addonTable.MountDetail:ResetSkin()
    if addonTable.ZoneAlertIcon.ApplySkin then addonTable.ZoneAlertIcon:ApplySkin() end

    -- The game's own Esc > Options page (just a title and a button).
    if rootPanel and rootPanel.title then
        rootPanel.title:SetTextColor(Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3], 1)
        rootPanel.blurb:SetTextColor(Brand.BODY_COLOR[1], Brand.BODY_COLOR[2], Brand.BODY_COLOR[3], 1)
        rootPanel.open.label:SetTextColor(Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3], 1)
    end

    local f = BuildWindow()
    if settingsWasOpen then f:Show() end
    if trackerWasOpen then addonTable.MainTracker:Show() end
    if collectionWasOpen then addonTable.CollectionWindow:Toggle() end
    if detailEntry then addonTable.MountDetail:Show(detailEntry) end
end

-- The primary entry point: the standalone window.
function SettingsPanel:Open()
    local f = BuildWindow()
    if f:IsShown() then f:Hide() else f:Show() end
end
