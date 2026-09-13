-- MainTracker.lua
-- Xal's Reins - the main tracker window.
--
-- This is the to-do list, NOT the full roster: only mounts this account
-- doesn't own yet AND the character currently logged in could actually go and
-- get. It's the window that stays up while you're out collecting, and it
-- shrinks as you collect. The complete roster lives in its own separate
-- window (Collection), reached deliberately rather than by default.
--
-- Clicking any row opens the "how to get it" detail popup.

local addonName, addonTable = ...
local Tracker   = addonTable.MainTracker
local Brand     = addonTable.BrandStyle
local MountData = addonTable.MountData

local WIN_W, WIN_H = 400, 520
local ROW_H        = 30
local ROW_INSET    = 10

local frame, scrollFrame, scrollChild, content, countText, searchBox
local rows = {}

-- What the user actually TYPED, which is what drives the list. Deliberately
-- not "whatever is in the box": autocomplete puts a full mount name in there,
-- and filtering on that would collapse the list to the single suggestion
-- before the user has agreed to it.
local typedText = ""
local zoneOnly = false
local activeTab = "all"   -- "all" | "raids" | "dungeons"
local tabButtons = {}

-- Section collapse state. Zone sections start collapsed so the window opens as
-- a compact column of zone names rather than hundreds of rows; the four named
-- category sections start expanded, since there are few of them and they're
-- always relevant. Any explicit choice the player makes is remembered.
local NAMED_SECTIONS = {
    ["Limited Time"]  = true,
    ["Crafting"]      = true,
    ["Reputation"]    = true,
    ["Achievements"]  = true,
    ["This Zone"]     = true,
    ["Uncategorised"] = true,
}

local function IsCollapsed(name)
    local db = type(XalsReinsDB) == "table" and XalsReinsDB.collapsedSections
    if db and db[name] ~= nil then return db[name] end
    -- On the Raids/Dungeons tabs every section is an instance and the list is
    -- already narrow, so start them open rather than making the player expand
    -- each one.
    if activeTab ~= "all" then return false end
    return not NAMED_SECTIONS[name]
end

local function SetCollapsed(name, state)
    if type(XalsReinsDB) ~= "table" then return end
    XalsReinsDB.collapsedSections = XalsReinsDB.collapsedSections or {}
    XalsReinsDB.collapsedSections[name] = state and true or false
end

-- ── Row construction ─────────────────────────────────────────────
-- Rows are built once and reused across refreshes; only their contents and
-- visibility change, so collecting a mount doesn't churn frames.
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

    local tag = Brand.FS(row, "", Brand.BODY_FONT_PATH, 11, nil, 1, 1, 1)
    tag:SetPoint("RIGHT", source, "LEFT", -8, 0)
    tag:SetJustifyH("RIGHT")
    row.tagText = tag

    local name = Brand.FS(row, "", Brand.BODY_FONT_PATH, 13, nil, 1, 1, 1)
    name:SetPoint("LEFT", icon, "RIGHT", 8, 0)
    -- Name takes whatever room the tag and source labels leave, so a long
    -- mount name truncates instead of running underneath them.
    name:SetPoint("RIGHT", tag, "LEFT", -6, 0)
    name:SetJustifyH("LEFT")
    name:SetWordWrap(false)
    row.nameText = name

    row:SetScript("OnEnter", function(self) self.highlight:Show() end)
    row:SetScript("OnLeave", function(self) self.highlight:Hide() end)
    row:SetScript("OnClick", function(self)
        if self.sectionName then
            SetCollapsed(self.sectionName, not IsCollapsed(self.sectionName))
            Tracker:Refresh()
        elseif self.entry then
            addonTable.MountDetail:Show(self.entry)
        end
    end)

    rows[index] = row
    return row
end

-- ── Filtering ────────────────────────────────────────────────────
-- Substring match, so typing "proto" finds "Time-Lost Proto-Drake" and not
-- just names that start with it.
local function FilteredTodo()
    -- A search is a direct question about a specific mount, so it reaches the
    -- WHOLE roster and ignores the zone filter entirely. Being in the wrong
    -- zone, already owning it, or being unable to get it on this character
    -- must never make a mount you searched for simply vanish - the row is
    -- tagged instead.
    if typedText ~= "" then
        local roster = MountData:Ensure() or {}
        local needle = typedText:lower()
        local hits = {}
        for i = 1, #roster do
            -- Placeholders are excluded even from search - they aren't real
            -- content, so surfacing them would only be confusing.
            if roster[i].name:lower():find(needle, 1, true)
                and not MountData:IsPlaceholder(roster[i]) then
                hits[#hits + 1] = roster[i]
            end
        end
        return hits
    end

    local todo = MountData:GetTodoList()

    if zoneOnly then
        -- Resolved once per refresh rather than per mount.
        local zoneNames = MountData:CurrentZoneNames()
        local zoned = {}
        for i = 1, #todo do
            if MountData:MatchesCurrentZone(todo[i], zoneNames) then
                zoned[#zoned + 1] = todo[i]
            end
        end
        todo = zoned
    end

    return todo
end

-- Flattens sections into the row list, skipping the contents of anything
-- collapsed. A search bypasses sections entirely.
local function BuildDisplayList(todo)
    if typedText ~= "" then
        local flat = {}
        for i = 1, #todo do flat[#flat + 1] = { entry = todo[i] } end
        return flat
    end

    local sections
    if activeTab == "raids" then
        sections = MountData:GroupByInstance(todo, "raid")
    elseif activeTab == "dungeons" then
        sections = MountData:GroupByInstance(todo, "dungeon")
    else
        sections = MountData:GroupIntoSections(todo, not zoneOnly)
    end
    local display = {}
    for i = 1, #sections do
        local section = sections[i]
        local collapsed = IsCollapsed(section.name)
        display[#display + 1] = {
            sectionName = section.name,
            count = #section.entries,
            collapsed = collapsed,
        }
        if not collapsed then
            for j = 1, #section.entries do
                display[#display + 1] = { entry = section.entries[j] }
            end
        end
    end
    return display
end

-- ── Refresh ──────────────────────────────────────────────────────
function Tracker:Refresh()
    if not frame then return end

    local todo = FilteredTodo()
    local display = BuildDisplayList(todo)

    -- On the Raids/Dungeons tabs the grouping itself does the filtering, so
    -- the count has to come from the actual sections, not #todo (that
    -- reported the whole to-do list, e.g. "1166 still to get from dungeons").
    -- Every section starts collapsed, so counting `display[i].entry` rows
    -- (confirmed 2026-09-02: it only counts rows from EXPANDED sections,
    -- which is why the header number never matched the sum of the section
    -- badges below it - those badges show each section's real total via
    -- item.count regardless of collapse state, so summing item.count instead
    -- gives the true total.
    local shown = 0
    for i = 1, #display do
        if display[i].sectionName then shown = shown + display[i].count end
    end

    for i = 1, #display do
        local item = display[i]
        local row = AcquireRow(i)
        row.entry = item.entry
        row.sectionName = item.sectionName

        if item.sectionName then
            row.icon:SetTexture(nil)
            row.tagText:SetText("")
            row.sourceText:SetText("|cff999999" .. item.count .. "|r")
            row.nameText:SetText((item.collapsed and "+  " or "-  ") .. item.sectionName)
            row.nameText:SetTextColor(Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3])
            row:Show()
        else
            local entry = item.entry
            row.icon:SetTexture(entry.icon)
            row.nameText:SetText(entry.name)
            row.sourceText:SetText(entry.sourceLabel)

            -- Tags only carry information while searching. In the plain to-do
            -- list every row is by definition still needed, so a "Needed" tag on
            -- all 700 would be pure noise.
            if typedText == "" then
                row.tagText:SetText("")
                row.nameText:SetTextColor(1, 1, 1)
            elseif entry.isCollected then
                row.tagText:SetText("|cff44dd66Collected|r")
                row.nameText:SetTextColor(0.65, 0.65, 0.65)
            elseif not entry.canAcquire or entry.refinedBlocked then
                row.tagText:SetText("|cffdd5555Can't get|r")
                row.nameText:SetTextColor(0.65, 0.65, 0.65)
            elseif MountData:IsUnobtainable(entry) then
                -- Closed events. Nobody can get these any more, so "Needed"
                -- would be actively misleading.
                row.tagText:SetText("|cff888888Gone|r")
                row.nameText:SetTextColor(0.55, 0.55, 0.55)
            elseif MountData:IsTradingPost(entry)
                and MountData:IsOfferedThisMonth(entry) == false then
                -- Out of rotation rather than gone for good; it'll come back.
                row.tagText:SetText("|cff888888Not this month|r")
                row.nameText:SetTextColor(0.55, 0.55, 0.55)
            else
                row.tagText:SetText("|cffb88c38Needed|r")
                row.nameText:SetTextColor(1, 1, 1)
            end

            row:Show()
        end
    end

    for i = #display + 1, #rows do
        rows[i]:Hide()
        rows[i].entry = nil
        rows[i].sectionName = nil
    end

    local stats = MountData.stats
    if zoneOnly and typedText == "" then
        countText:SetText(#todo .. " here  |cff999999in " .. (GetRealZoneText() or "?") .. "|r")
    elseif typedText ~= "" then
        countText:SetText(#todo .. " match" .. (#todo == 1 and "" or "es") ..
            "  |cff999999across all mounts|r")
    elseif activeTab == "raids" then
        countText:SetText(shown .. " still to get from raids")
    elseif activeTab == "dungeons" then
        countText:SetText(shown .. " still to get from dungeons")
    elseif stats then
        countText:SetText(#todo .. " to collect  |cff999999(" ..
            stats.collected .. " of " .. stats.total .. " owned)|r")
    else
        countText:SetText(#todo .. " to collect")
    end

    local height = math.max(1, #display * ROW_H)
    content:SetHeight(height)
    scrollChild:SetHeight(height)
    if frame.UpdateScrollRange then frame.UpdateScrollRange() end
end

-- ── The window ───────────────────────────────────────────────────
local function BuildWindow()
    if frame then return frame end

    local f = CreateFrame("Frame", "XalsReinsTracker", UIParent)
    tinsert(UISpecialFrames, "XalsReinsTracker") -- Escape closes it
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
            XalsReinsDB.trackerPos = { point = point, relPoint = relPoint, x = x, y = y }
        end
    end)
    f:SetClampedToScreen(true)

    -- Distinct default offset, checked against every other Xal's window.
    local pos = type(XalsReinsDB) == "table" and XalsReinsDB.trackerPos or nil
    if pos and pos.point then
        f:SetPoint(pos.point, UIParent, pos.relPoint, pos.x, pos.y)
    else
        f:SetPoint("CENTER", UIParent, "CENTER", -80, 180)
    end

    if type(XalsReinsDB) == "table" then
        zoneOnly = XalsReinsDB.zoneOnly and true or false
        activeTab = XalsReinsDB.activeTab or "all"
    end

    Brand.ApplyBackground(f)
    Brand.DrawBorder(f)

    Brand.Title(f, "Mounts to Collect", 22, "TOP", f, "TOP", 0, -Brand.SAFE_MARGIN - 4)

    countText = Brand.FS(f, "", Brand.BODY_FONT_PATH, 12, nil,
        Brand.GOLD[1], Brand.GOLD[2], Brand.GOLD[3])
    countText:SetPoint("TOP", f, "TOP", 0, -44)

    -- Tabs. Text links rather than boxed tabs, matching the rest of the suite;
    -- the active one is white, the others accent gold.
    local TABS = {
        { key = "all",      label = "All" },
        { key = "raids",    label = "Raids" },
        { key = "dungeons", label = "Dungeons" },
    }

    local function UpdateTabLook()
        for key, btn in pairs(tabButtons) do
            if key == activeTab then
                btn.label:SetTextColor(1, 1, 1, 1)
            else
                btn.label:SetTextColor(Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3], 1)
            end
        end
    end

    local previous
    for i = 1, #TABS do
        local tab = TABS[i]
        local btn = Brand.MakeTextLink(f, tab.label, function()
            activeTab = tab.key
            if type(XalsReinsDB) == "table" then XalsReinsDB.activeTab = activeTab end
            UpdateTabLook()
            Tracker:Refresh()
        end)
        -- The hover handlers would otherwise fight the active-tab colouring.
        btn:SetScript("OnLeave", function() UpdateTabLook() end)

        if previous then
            btn:SetPoint("LEFT", previous, "RIGHT", 14, 0)
        else
            btn:SetPoint("TOPLEFT", f, "TOPLEFT", Brand.SAFE_MARGIN + 14, -62)
        end
        previous = btn
        tabButtons[tab.key] = btn
    end
    UpdateTabLook()

    -- Search box, directly above the list. Native EditBox per the widget rule,
    -- with a greyed placeholder. Typing sorts the list underneath and nothing
    -- else - no suggestion overlay, which would cover the mounts it is meant
    -- to be helping you find.
    searchBox = CreateFrame("EditBox", nil, f, "InputBoxTemplate")
    searchBox:SetHeight(20)
    searchBox:SetPoint("TOPLEFT", f, "TOPLEFT", Brand.SAFE_MARGIN + 14, -88)
    searchBox:SetPoint("TOPRIGHT", f, "TOPRIGHT", -Brand.SAFE_MARGIN - 4, -88)
    searchBox:SetAutoFocus(false)
    searchBox:SetFontObject("GameFontHighlightSmall")

    local placeholder = searchBox:CreateFontString(nil, "OVERLAY")
    placeholder:SetFont(Brand.BODY_FONT_PATH, 12, "")
    placeholder:SetTextColor(0.5, 0.5, 0.5)
    placeholder:SetPoint("LEFT", searchBox, "LEFT", 4, 0)
    placeholder:SetText("Search mounts...")

    -- ── Spelling helper ──────────────────────────────────────────
    -- Suggestion list, hung OUTSIDE the tracker's right edge and top-aligned
    -- with the search box, so it sits beside the window rather than over the
    -- mount list. An earlier version rendered on top of the list and hid the
    -- very mounts it was meant to help find.
    --
    -- Purpose is spelling: if you know it's roughly "Alu-something", the
    -- candidates are visible and clickable.
    local listFrame = CreateFrame("Frame", nil, f)
    listFrame:SetPoint("TOPLEFT", f, "TOPRIGHT", 8, -88)
    listFrame:SetWidth(220)
    listFrame:SetFrameStrata("DIALOG")
    Brand.ApplyBackground(listFrame)
    Brand.DrawBorder(listFrame)
    listFrame:Hide()

    local rowBtns = {}
    local SUGGEST_H, MAX_SUGGEST = 20, 12

    local function UpdateSuggestions()
        local text = searchBox:GetText() or ""
        for _, b in ipairs(rowBtns) do b:Hide() end

        if text == "" then
            listFrame:Hide()
            return
        end

        -- Same set the search itself covers: the whole roster, not just the
        -- to-do list, so a suggestion can never point at nothing.
        local needle = text:lower()
        local candidates = {}
        local roster = MountData:Ensure() or {}
        for i = 1, #roster do
            if roster[i].name:lower():find(needle, 1, true)
                and not MountData:IsPlaceholder(roster[i]) then
                candidates[#candidates + 1] = roster[i].name
                if #candidates >= MAX_SUGGEST then break end
            end
        end

        -- Nothing to suggest when there's no match, or when the one match is
        -- already exactly what's typed.
        if #candidates == 0 or (#candidates == 1 and candidates[1]:lower() == needle) then
            listFrame:Hide()
            return
        end

        for i = 1, #candidates do
            local name = candidates[i]
            local btn = rowBtns[i]
            if not btn then
                btn = CreateFrame("Button", nil, listFrame)
                btn:SetHeight(SUGGEST_H)
                btn:SetPoint("TOPLEFT", listFrame, "TOPLEFT", 4, -(i - 1) * SUGGEST_H - 4)
                btn:SetPoint("TOPRIGHT", listFrame, "TOPRIGHT", -4, -(i - 1) * SUGGEST_H - 4)
                local fs = btn:CreateFontString(nil, "OVERLAY")
                fs:SetFont(Brand.BODY_FONT_PATH, 12, "")
                fs:SetPoint("LEFT", btn, "LEFT", 4, 0)
                fs:SetJustifyH("LEFT")
                fs:SetTextColor(0.9, 0.9, 0.9)
                btn.text = fs
                local hl = btn:CreateTexture(nil, "HIGHLIGHT")
                hl:SetAllPoints()
                hl:SetColorTexture(1, 1, 1, 0.15)
                rowBtns[i] = btn
            end
            btn.text:SetText(name)
            -- OnMouseDown rather than OnClick, paired with the deferred hide
            -- below - otherwise focus-loss races the click and the selection
            -- never registers.
            btn:SetScript("OnMouseDown", function()
                searchBox:SetText(name)
                searchBox:ClearFocus()
                listFrame:Hide()
                placeholder:Hide()
                typedText = name
                Tracker:Refresh()
            end)
            btn:Show()
        end

        listFrame:SetHeight(#candidates * SUGGEST_H + 8)
        listFrame:Show()
    end

    searchBox:SetScript("OnTextChanged", function(self, userInput)
        placeholder:SetShown((self:GetText() or "") == "")
        typedText = self:GetText() or ""
        Tracker:Refresh()
        if userInput then UpdateSuggestions() end
    end)

    searchBox:SetScript("OnEnterPressed", function(self)
        listFrame:Hide()
        self:ClearFocus()
    end)

    searchBox:SetScript("OnEscapePressed", function(self)
        self:SetText("")
        listFrame:Hide()
        self:ClearFocus()
    end)

    -- Hiding on OnEditFocusLost directly is unreliable: clicking a suggestion
    -- takes focus off the box, and the ordering against the row's own handler
    -- isn't guaranteed, so the list can vanish before the click lands. Defer a
    -- frame and skip entirely while the mouse is over the list.
    searchBox:HookScript("OnEditFocusLost", function()
        C_Timer.After(0, function()
            if not listFrame:IsMouseOver() then
                listFrame:Hide()
            end
        end)
    end)

    -- Never leave it floating beside a closed window.
    f:HookScript("OnHide", function() listFrame:Hide() end)

    -- Current-zone toggle. Brand checkbox, driven by OnToggle.
    local zoneCheck = Brand.MakeCheckbox(f, 18)
    zoneCheck:SetPoint("TOPLEFT", f, "TOPLEFT", Brand.SAFE_MARGIN + 14, -114)

    local zoneLabel = Brand.FS(f, "Only show mounts from this zone", Brand.BODY_FONT_PATH, 12,
        nil, Brand.GOLD[1], Brand.GOLD[2], Brand.GOLD[3])
    zoneLabel:SetPoint("LEFT", zoneCheck, "RIGHT", 8, 0)
    zoneLabel:SetPoint("RIGHT", f, "RIGHT", -Brand.SAFE_MARGIN - 4, 0)
    zoneLabel:SetJustifyH("LEFT")
    zoneLabel:SetWordWrap(false)

    zoneCheck:SetChecked(zoneOnly)
    zoneCheck.OnToggle = function(self)
        zoneOnly = self:GetChecked() and true or false
        if type(XalsReinsDB) == "table" then XalsReinsDB.zoneOnly = zoneOnly end
        Tracker:Refresh()
    end
    f.zoneCheck = zoneCheck

    Brand.DrawDivider(f, Brand.SAFE_MARGIN, 140, WIN_W - (Brand.SAFE_MARGIN * 2))

    -- Plain ScrollFrame with the thin custom accent scrollbar, NOT
    -- UIPanelScrollFrameTemplate - Blizzard's arrow-button scrollbar was
    -- explicitly rejected in Quest Compass and the thin bar ported to
    -- Compendium instead. Same treatment here for consistency.
    scrollFrame = CreateFrame("ScrollFrame", "XalsReinsTrackerScroll", f)
    scrollFrame:SetPoint("TOPLEFT", f, "TOPLEFT", Brand.SAFE_MARGIN + ROW_INSET, -150)
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

    -- SetScrollChild silently overrides any position anchor on the child, so
    -- the real child stays flush at (0,0) full width and an inner content
    -- frame carries the margin instead.
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

    -- Wheel scrolling isn't automatic for a ScrollFrame built in Lua.
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

    -- Text links, not boxed buttons - the boxed style was dropped across the
    -- suite for being a visual blemish.
    local collection = Brand.MakeTextLink(f, "My Collection", function()
        addonTable.CollectionWindow:Toggle()
    end)
    collection:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", Brand.SAFE_MARGIN + 4, Brand.SAFE_MARGIN)

    local close = Brand.MakeCloseButton(f, function() f:Hide() end)
    close:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -Brand.SAFE_MARGIN - 4, Brand.SAFE_MARGIN)

    f:Hide()
    frame = f
    return f
end

function Tracker:Toggle()
    local f = BuildWindow()
    if f:IsShown() then
        f:Hide()
    else
        self:Refresh()
        f:Show()
    end
end

function Tracker:Show()
    BuildWindow()
    self:Refresh()
    frame:Show()
end

function Tracker:IsShown()
    return frame and frame:IsShown()
end

-- Opens the tracker with the zone-only filter forced on, for the zone-alert
-- icon's right-click. Only flips the checkbox if it isn't already on, so
-- this never fights a player who already had it set.
function Tracker:ShowZoneOnly()
    local f = BuildWindow()
    if not zoneOnly then
        zoneOnly = true
        if type(XalsReinsDB) == "table" then XalsReinsDB.zoneOnly = true end
        if f.zoneCheck then f.zoneCheck:SetChecked(true) end
    end
    self:Refresh()
    f:Show()
end
