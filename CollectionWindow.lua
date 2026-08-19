-- CollectionWindow.lua
-- Xal's Reins - the collection window.
--
-- The other half of the pair: this one shows what you HAVE collected, the
-- whole account-wide collection, newest concerns aside - browsing and
-- completionism rather than the working to-do list.
--
-- Opened deliberately (button on the tracker, or /xro collection). It is NOT
-- a second always-up tracker - only the main tracker is meant to stay on
-- screen while playing.
--
-- Same row/scroll construction as MainTracker: plain ScrollFrame with the thin
-- custom accent scrollbar, rows built once and reused, click a row for the
-- detail popup.

local addonName, addonTable = ...
local Collection = addonTable.CollectionWindow
local Brand      = addonTable.BrandStyle
local MountData  = addonTable.MountData

local WIN_W, WIN_H = 400, 520
local ROW_H        = 30
local ROW_INSET    = 10

local frame, scrollFrame, scrollChild, content, countText, searchBox
local rows = {}
local filterText = ""

local function AcquireRow(index)
    local row = rows[index]
    if row then return row end

    row = CreateFrame("Button", nil, content)
    row:SetHeight(ROW_H)
    row:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -((index - 1) * ROW_H))
    row:SetPoint("TOPRIGHT", content, "TOPRIGHT", 0, -((index - 1) * ROW_H))

    local hl = row:CreateTexture(nil, "BACKGROUND")
    hl:SetAllPoints()
    hl:SetColorTexture(Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3], 0.16)
    hl:Hide()
    row.highlight = hl

    local icon = row:CreateTexture(nil, "ARTWORK")
    icon:SetSize(ROW_H - 8, ROW_H - 8)
    icon:SetPoint("LEFT", row, "LEFT", 0, 0)
    icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
    row.icon = icon

    local source = Brand.FS(row, "", Brand.BODY_FONT_PATH, 11, nil,
        Brand.GOLD[1], Brand.GOLD[2], Brand.GOLD[3])
    source:SetPoint("RIGHT", row, "RIGHT", -6, 0)
    source:SetJustifyH("RIGHT")
    row.sourceText = source

    local name = Brand.FS(row, "", Brand.BODY_FONT_PATH, 13, nil, 1, 1, 1)
    name:SetPoint("LEFT", icon, "RIGHT", 8, 0)
    name:SetPoint("RIGHT", source, "LEFT", -8, 0)
    name:SetJustifyH("LEFT")
    name:SetWordWrap(false)
    row.nameText = name

    row:SetScript("OnEnter", function(self) self.highlight:Show() end)
    row:SetScript("OnLeave", function(self) self.highlight:Hide() end)
    row:SetScript("OnClick", function(self)
        if self.entry then addonTable.MountDetail:Show(self.entry) end
    end)

    rows[index] = row
    return row
end

-- Collected mounts only, optionally narrowed by the search box.
local function BuildList()
    local roster = MountData:Ensure()
    if not roster then return {} end

    local needle = filterText ~= "" and filterText:lower() or nil
    local list = {}
    for i = 1, #roster do
        local entry = roster[i]
        if entry.isCollected and not MountData:IsPlaceholder(entry) then
            if not needle or entry.name:lower():find(needle, 1, true) then
                list[#list + 1] = entry
            end
        end
    end
    return list
end

function Collection:Refresh()
    if not frame then return end

    local list = BuildList()

    for i = 1, #list do
        local entry = list[i]
        local row = AcquireRow(i)
        row.entry = entry
        row.icon:SetTexture(entry.icon)
        row.nameText:SetText(entry.name)
        row.sourceText:SetText(entry.sourceLabel)
        row:Show()
    end

    for i = #list + 1, #rows do
        rows[i]:Hide()
        rows[i].entry = nil
    end

    local stats = MountData.stats
    if stats then
        if filterText ~= "" then
            countText:SetText(#list .. " of " .. stats.collected .. " collected match")
        else
            countText:SetText(stats.collected .. " collected  |cff999999of " ..
                stats.total .. " in the game|r")
        end
    else
        countText:SetText(#list .. " collected")
    end

    local height = math.max(1, #list * ROW_H)
    content:SetHeight(height)
    scrollChild:SetHeight(height)
    if frame.UpdateScrollRange then frame.UpdateScrollRange() end
end

local function BuildWindow()
    if frame then return frame end

    local f = CreateFrame("Frame", "XalsReinsCollection", UIParent)
    tinsert(UISpecialFrames, "XalsReinsCollection")
    f:SetSize(WIN_W, WIN_H)
    f:SetFrameStrata("MEDIUM")
    f:SetToplevel(true)
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        if type(XalsReinsDB) == "table" then
            local point, _, relPoint, x, y = self:GetPoint()
            XalsReinsDB.collectionPos = { point = point, relPoint = relPoint, x = x, y = y }
        end
    end)
    f:SetClampedToScreen(true)

    -- Distinct default offset, checked against the registry and against this
    -- addon's own other windows.
    local pos = type(XalsReinsDB) == "table" and XalsReinsDB.collectionPos or nil
    if pos and pos.point then
        f:SetPoint(pos.point, UIParent, pos.relPoint, pos.x, pos.y)
    else
        f:SetPoint("CENTER", UIParent, "CENTER", 340, -140)
    end

    Brand.ApplyBackground(f)
    Brand.ApplyBackgroundImage(f)
    Brand.DrawBorder(f)

    Brand.Title(f, "My Collection", 22, "TOP", f, "TOP", 0, -Brand.SAFE_MARGIN - 4)

    countText = Brand.FS(f, "", Brand.BODY_FONT_PATH, 12, nil,
        Brand.GOLD[1], Brand.GOLD[2], Brand.GOLD[3])
    countText:SetPoint("TOP", f, "TOP", 0, -48)

    -- Native edit box per the widget rule - only buttons/checkboxes/borders are
    -- custom brand art.
    searchBox = CreateFrame("EditBox", nil, f, "InputBoxTemplate")
    searchBox:SetHeight(20)
    searchBox:SetPoint("TOPLEFT", f, "TOPLEFT", Brand.SAFE_MARGIN + 14, -70)
    searchBox:SetPoint("TOPRIGHT", f, "TOPRIGHT", -Brand.SAFE_MARGIN - 4, -70)
    searchBox:SetAutoFocus(false)
    searchBox:SetFontObject("GameFontHighlightSmall")
    searchBox:SetScript("OnTextChanged", function(self)
        filterText = self:GetText() or ""
        Collection:Refresh()
    end)
    searchBox:SetScript("OnEscapePressed", function(self)
        self:SetText("")
        self:ClearFocus()
    end)

    Brand.DrawDivider(f, 0, 98, WIN_W - (Brand.SAFE_MARGIN * 2))

    scrollFrame = CreateFrame("ScrollFrame", "XalsReinsCollectionScroll", f)
    scrollFrame:SetPoint("TOPLEFT", f, "TOPLEFT", Brand.SAFE_MARGIN + ROW_INSET, -108)
    scrollFrame:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -Brand.SAFE_MARGIN - 12, 48)

    local scrollTrack = CreateFrame("Frame", nil, f, "BackdropTemplate")
    scrollTrack:SetPoint("TOPRIGHT", scrollFrame, "TOPRIGHT", 10, 0)
    scrollTrack:SetPoint("BOTTOMRIGHT", scrollFrame, "BOTTOMRIGHT", 10, 0)
    scrollTrack:SetWidth(8)
    scrollTrack:SetBackdrop({ bgFile = "Interface\\Buttons\\WHITE8x8" })
    scrollTrack:SetBackdropColor(1, 1, 1, 0.08)
    scrollTrack:Hide()

    local scrollThumb = CreateFrame("Slider", nil, scrollTrack)
    scrollThumb:SetOrientation("VERTICAL")
    scrollThumb:SetPoint("TOP", scrollTrack, "TOP", 0, 0)
    scrollThumb:SetPoint("BOTTOM", scrollTrack, "BOTTOM", 0, 0)
    scrollThumb:SetWidth(8)
    scrollThumb:SetThumbTexture("Interface\\Buttons\\WHITE8x8")
    local scrollThumbTex = scrollThumb:GetThumbTexture()
    scrollThumbTex:SetVertexColor(Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3], 1)
    scrollThumbTex:SetWidth(8)

    local suppressScrollCallback = false
    scrollThumb:SetScript("OnValueChanged", function(_, value)
        if suppressScrollCallback then return end
        scrollFrame:SetVerticalScroll(value)
    end)

    scrollChild = CreateFrame("Frame", nil, scrollFrame)
    scrollChild:SetPoint("TOPLEFT", scrollFrame, "TOPLEFT", 0, 0)
    scrollChild:SetWidth(scrollFrame:GetWidth())
    scrollChild:SetHeight(1)
    scrollFrame:SetScrollChild(scrollChild)
    scrollFrame:SetScript("OnSizeChanged", function(_, width) scrollChild:SetWidth(width) end)

    content = CreateFrame("Frame", nil, scrollChild)
    content:SetPoint("TOPLEFT", scrollChild, "TOPLEFT", 0, 0)
    content:SetPoint("TOPRIGHT", scrollChild, "TOPRIGHT", 0, 0)
    content:SetHeight(1)

    scrollFrame:EnableMouseWheel(true)
    scrollFrame:SetScript("OnMouseWheel", function(_, delta)
        scrollThumb:SetValue(scrollThumb:GetValue() - delta * 40)
    end)

    function f.UpdateScrollRange()
        local visibleHeight = scrollFrame:GetHeight()
        local contentHeight = scrollChild:GetHeight()
        local maxScroll = math.max(0, contentHeight - visibleHeight)
        suppressScrollCallback = true
        scrollThumb:SetMinMaxValues(0, maxScroll)
        suppressScrollCallback = false
        if maxScroll > 0 then
            scrollTrack:Show()
            local ratio = math.min(1, visibleHeight / contentHeight)
            scrollThumbTex:SetHeight(math.max(20, visibleHeight * ratio))
        else
            scrollTrack:Hide()
            scrollFrame:SetVerticalScroll(0)
        end
    end

    local close = Brand.MakeCloseButton(f, function() f:Hide() end)
    close:SetPoint("BOTTOM", f, "BOTTOM", 0, Brand.SAFE_MARGIN)

    f:Hide()
    frame = f
    return f
end

function Collection:Toggle()
    local f = BuildWindow()
    if f:IsShown() then
        f:Hide()
    else
        self:Refresh()
        f:Show()
    end
end

function Collection:IsShown()
    return frame and frame:IsShown()
end
