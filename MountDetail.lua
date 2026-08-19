-- MountDetail.lua
-- Xal's Reins - the "how do I get it" popup.
--
-- Opens when a mount is clicked in the tracker. Shows the game's own sourcing
-- text for that mount plus reference links.
--
-- Lua can't open a browser, so the link buttons pop the standard WoW
-- copy-a-URL dialog (auto-selected read-only edit box) instead - same
-- mechanism as the Discord link.

local addonName, addonTable = ...
local Detail    = addonTable.MountDetail
local Brand     = addonTable.BrandStyle
local MountData = addonTable.MountData

local WIN_W, WIN_H = 430, 470

local frame

-- The popup's own OnShow data plumbing left the edit box empty in game, so
-- the text is set directly on the dialog StaticPopup_Show hands back.
local function ShowCopyDialog(caption, url)
    Brand.ShowCopyBox(caption, url)
end

local function BuildFrame()
    if frame then return frame end

    local f = CreateFrame("Frame", "XalsReinsMountDetail", UIParent)
    tinsert(UISpecialFrames, "XalsReinsMountDetail")
    f:SetSize(WIN_W, WIN_H)
    f:SetFrameStrata("DIALOG")
    f:SetToplevel(true)
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        if type(XalsReinsDB) == "table" then
            local point, _, relPoint, x, y = self:GetPoint()
            XalsReinsDB.detailPos = { point = point, relPoint = relPoint, x = x, y = y }
        end
    end)
    f:SetClampedToScreen(true)

    local pos = type(XalsReinsDB) == "table" and XalsReinsDB.detailPos or nil
    if pos and pos.point then
        f:SetPoint(pos.point, UIParent, pos.relPoint, pos.x, pos.y)
    else
        f:SetPoint("CENTER", UIParent, "CENTER", 140, 140)
    end

    Brand.ApplyBackground(f)
    Brand.ApplyBackgroundImage(f)
    Brand.DrawBorder(f)

    -- Step links use a custom link type, so the frame has to opt in and handle
    -- clicks itself. Lua can't open a browser, so a click hands over the
    -- Wowhead URL through the same copy box the mount links use.
    f:SetHyperlinksEnabled(true)
    f:SetScript("OnHyperlinkClick", function(_, link)
        local kind, id = link:match("^xalsreins:(%a+):(%d+)$")
        if not kind or not id then return end
        local url = MountData:StepURL(kind, tonumber(id))
        if url then
            Brand.ShowCopyBox("Step link - copy this", url)
        end
    end)

    local icon = f:CreateTexture(nil, "ARTWORK")
    icon:SetSize(44, 44)
    icon:SetPoint("TOPLEFT", f, "TOPLEFT", Brand.SAFE_MARGIN + 4, -Brand.SAFE_MARGIN - 4)
    icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
    f.icon = icon

    local title = Brand.FS(f, "", Brand.TITLE_FONT_PATH, 20, nil,
        Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3])
    title:SetPoint("TOPLEFT", icon, "TOPRIGHT", 12, -4)
    title:SetPoint("RIGHT", f, "RIGHT", -Brand.SAFE_MARGIN, 0)
    title:SetJustifyH("LEFT")
    title:SetWordWrap(true)
    f.titleText = title

    local category = Brand.FS(f, "", Brand.BODY_FONT_PATH, 12, nil,
        Brand.GOLD[1], Brand.GOLD[2], Brand.GOLD[3])
    category:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -4)
    category:SetJustifyH("LEFT")
    f.categoryText = category

    Brand.DrawDivider(f, 0, 72, WIN_W - (Brand.SAFE_MARGIN * 2))

    local heading = Brand.FS(f, "How to get it", Brand.TITLE_FONT_PATH, 15, nil,
        Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3])
    heading:SetPoint("TOPLEFT", f, "TOPLEFT", Brand.SAFE_MARGIN + 4, -84)

    local source = Brand.FS(f, "", Brand.BODY_FONT_PATH, 13, nil, 1, 1, 1)
    source:SetPoint("TOPLEFT", heading, "BOTTOMLEFT", 0, -6)
    source:SetPoint("RIGHT", f, "RIGHT", -Brand.SAFE_MARGIN - 4, 0)
    source:SetJustifyH("LEFT")
    source:SetWordWrap(true)
    f.sourceText = source

    local blocked = Brand.FS(f, "", Brand.BODY_FONT_PATH, 12, nil, 0.87, 0.33, 0.33)
    blocked:SetPoint("TOPLEFT", source, "BOTTOMLEFT", 0, -10)
    blocked:SetPoint("RIGHT", f, "RIGHT", -Brand.SAFE_MARGIN - 4, 0)
    blocked:SetJustifyH("LEFT")
    blocked:SetWordWrap(true)
    f.blockedText = blocked

    local availability = Brand.FS(f, "", Brand.BODY_FONT_PATH, 12, nil, 1, 1, 1)
    availability:SetPoint("TOPLEFT", blocked, "BOTTOMLEFT", 0, -10)
    availability:SetPoint("RIGHT", f, "RIGHT", -Brand.SAFE_MARGIN - 4, 0)
    availability:SetJustifyH("LEFT")
    availability:SetWordWrap(true)
    f.availabilityText = availability

    local stepsHeading = Brand.FS(f, "", Brand.TITLE_FONT_PATH, 15, nil,
        Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3])
    stepsHeading:SetPoint("TOPLEFT", availability, "BOTTOMLEFT", 0, -12)
    f.stepsHeading = stepsHeading

    local steps = Brand.FS(f, "", Brand.BODY_FONT_PATH, 12, nil, 1, 1, 1)
    steps:SetPoint("TOPLEFT", stepsHeading, "BOTTOMLEFT", 0, -6)
    steps:SetPoint("RIGHT", f, "RIGHT", -Brand.SAFE_MARGIN - 4, 0)
    steps:SetJustifyH("LEFT")
    steps:SetWordWrap(true)
    steps:SetSpacing(3)
    f.stepsText = steps

    local flavor = Brand.FS(f, "", Brand.BODY_FONT_PATH, 12, nil, 0.62, 0.62, 0.62)
    flavor:SetPoint("TOPLEFT", steps, "BOTTOMLEFT", 0, -12)
    flavor:SetPoint("RIGHT", f, "RIGHT", -Brand.SAFE_MARGIN - 4, 0)
    flavor:SetJustifyH("LEFT")
    flavor:SetWordWrap(true)
    f.flavorText = flavor

    -- Link buttons. Both pop the copy dialog rather than pretending to open a
    -- browser, which Lua can't do.
    local wowhead = Brand.MakeTextLink(f, "Wowhead link", function()
        local url = f.wowheadURL
        if url then ShowCopyDialog("Wowhead - copy this link", url) end
    end)
    wowhead:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", Brand.SAFE_MARGIN + 4, Brand.SAFE_MARGIN + 34)

    local video = Brand.MakeTextLink(f, "Video guide", function()
        local url = f.videoURL
        if url then ShowCopyDialog("Video guide - copy this link", url) end
    end)
    f.wowheadButton = wowhead
    f.videoButton = video

    local close = Brand.MakeCloseButton(f, function() f:Hide() end)
    close:SetPoint("BOTTOM", f, "BOTTOM", 0, Brand.SAFE_MARGIN)

    f:Hide()
    frame = f
    return f
end

-- Re-renders whatever is currently open. Used when quest titles arrive from
-- the server after the popup was already drawn.
function Detail:Refresh()
    if frame and frame:IsShown() and frame.entry then
        self:Show(frame.entry)
    end
end

function Detail:IsShown()
    return frame and frame:IsShown()
end

function Detail:Show(entry)
    if not entry then return end

    local f = BuildFrame()
    f.entry = entry
    local extra = MountData:GetExtra(entry.mountID)

    f.icon:SetTexture(entry.icon)
    f.titleText:SetText(entry.name)

    local category = entry.sourceLabel or "Unknown source"
    if entry.factionLabel then
        category = category .. "  |cff999999(" .. entry.factionLabel .. ")|r"
    end
    f.categoryText:SetText(category)

    local sourceLine = extra and extra.source
    if sourceLine and sourceLine ~= "" then
        f.sourceText:SetText(sourceLine)
    else
        f.sourceText:SetText("The game doesn't provide sourcing text for this one.")
    end

    local why = MountData:WhyBlocked(entry.mountID)
    local missingProf = MountData:MissingProfession(entry)
    if why then
        f.blockedText:SetText("This character can't get it: " .. why)
        f.blockedText:SetTextColor(0.87, 0.33, 0.33)
    elseif missingProf then
        -- A note, not a block: someone else can craft it, or it can be bought.
        f.blockedText:SetText("You don't have " .. missingProf ..
            " - buy it, or have someone craft it for you.")
        f.blockedText:SetTextColor(Brand.GOLD[1], Brand.GOLD[2], Brand.GOLD[3])
    else
        f.blockedText:SetText("")
    end

    -- Only available while an event is running. nil from IsHolidayActive means
    -- the calendar couldn't be read - say so rather than claiming it's off.
    local event = MountData:GetAvailability(entry)
    if event then
        local live = MountData:IsHolidayActive(event)
        if live == true then
            f.availabilityText:SetText("Only during |cffffffff" .. event ..
                "|r - |cff44dd66running now|r")
        elseif live == false then
            f.availabilityText:SetText("Only during |cffffffff" .. event ..
                "|r - |cff888888not running right now|r")
        else
            f.availabilityText:SetText("Only during |cffffffff" .. event .. "|r")
        end
    else
        f.availabilityText:SetText("")
    end

    -- Prerequisite chain, if this mount has one written. Mounts without an
    -- entry show nothing at all rather than an empty heading.
    local stepLines, doneCount, totalSteps, untracked = MountData:GetStepLines(entry)
    if stepLines then
        local header = "Steps  |cff999999(" .. doneCount .. " of " .. totalSteps .. " done"
        -- Say plainly when some steps can't be verified, so an unticked step
        -- doesn't look like the addon getting it wrong.
        if untracked > 0 then
            header = header .. ", " .. untracked .. " can't be checked"
        end
        header = header .. ")|r"
        f.stepsHeading:SetText(header)
        f.stepsText:SetText(stepLines)
    else
        f.stepsHeading:SetText("")
        f.stepsText:SetText("")
    end

    if extra and extra.description and extra.description ~= "" then
        f.flavorText:SetText(extra.description)
    else
        f.flavorText:SetText("")
    end

    -- A button only exists if there is a real link behind it. Laid out left to
    -- right over whichever ones survive, so there is never a dead gap.
    f.wowheadURL = MountData:GetWowheadURL(entry)
    f.videoURL   = MountData:GetVideoURL(entry)

    local anchor = nil
    for _, pair in ipairs({ { f.wowheadURL, f.wowheadButton }, { f.videoURL, f.videoButton } }) do
        local url, button = pair[1], pair[2]
        button:ClearAllPoints()
        if url then
            if anchor then
                button:SetPoint("LEFT", anchor, "RIGHT", 10, 0)
            else
                button:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT",
                    Brand.SAFE_MARGIN + 4, Brand.SAFE_MARGIN + 34)
            end
            button:Show()
            anchor = button
        else
            button:Hide()
        end
    end

    f:Show()
end
