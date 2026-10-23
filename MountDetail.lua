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

-- No fixed height - the description/steps text varies a lot per mount, and
-- a hardcoded 470 risked the exact same overlap StepReminder.lua had (link
-- buttons anchored to a fixed frame-bottom position instead of the actual
-- content). The real height is added up directly from each element's own
-- size every time a mount is shown (see Detail:Show below) - this initial
-- size is just a throwaway starting value, always overwritten before the
-- frame is ever actually shown.
local WIN_W = 430
local INITIAL_H = 900

local frame

-- The popup's own OnShow data plumbing left the edit box empty in game, so
-- the text is set directly on the dialog StaticPopup_Show hands back.
local function ShowCopyDialog(caption, url)
    Brand.ShowCopyBox(caption, url)
end

-- TomTom is preferred when it's installed (a real arrow, distance readout,
-- the works) since it's almost always present; Blizzard's own native
-- waypoint pin is the fallback otherwise, so this still works with nothing
-- else installed. Verbatim from Xal's Armoire's own AppearanceDetail.lua.
local function SetWaypoint(loc)
    if not loc then return end
    if TomTom and TomTom.AddMFWaypoint then
        TomTom:AddMFWaypoint(loc.mapID, nil, loc.x, loc.y, { title = "Xal's Reins vendor" })
        print("|cffb88c38Xal's Reins:|r waypoint set via TomTom.")
    elseif C_Map and C_Map.SetUserWaypoint and UiMapPoint and UiMapPoint.CreateFromCoordinates then
        local point = UiMapPoint.CreateFromCoordinates(loc.mapID, loc.x, loc.y)
        C_Map.SetUserWaypoint(point)
        if C_SuperTrack then C_SuperTrack.SetSuperTrackedUserWaypoint(true) end
        print("|cffb88c38Xal's Reins:|r waypoint set.")
    end
end

-- Sizes the popup to where its content actually ends: the distance from the
-- frame's top edge down to the close button's bottom edge is fixed by the
-- real anchored layout (everything hangs off a chain rooted at TOPLEFT), so
-- it's correct no matter how tall any card turned out to be. Safe to call
-- repeatedly.
local function ResizeToContent()
    local f = frame
    if not f or not f.closeButton then return end
    local top, bottom = f:GetTop(), f.closeButton:GetBottom()
    if top and bottom then
        f:SetHeight((top - bottom) + Brand.SAFE_MARGIN)
    end
end

-- Cards fit themselves to their text, continuously. A one-time measurement
-- isn't reliable - GetStringHeight() reports the real wrapped height only
-- once the text's width has actually resolved, which isn't guaranteed on
-- the same frame the text is set (a two-line step measured as one and
-- spilled over its own border). Re-checking every frame the card is on
-- screen means it always lands on the true height within a frame, and
-- tracks any later change (a font finishing loading, a link resolving).
-- Anything anchored below a card follows it automatically; the popup
-- resizes to match.
local function FitCard(card)
    local h = math.max(card.text:GetStringHeight() or 16, 16) + 16
    if math.abs(h - (card:GetHeight() or 0)) > 0.5 then
        card:SetHeight(h)
        ResizeToContent()
    end
end

-- Step links use a custom link type, so each card has to opt in and handle
-- clicks itself. Lua can't open a browser, so a click hands over the
-- Wowhead URL through the same copy box the mount links use.
local function OnStepLink(_, link)
    local kind, id = link:match("^xalsreins:(%a+):(%d+)$")
    if not kind or not id then return end
    local url = MountData:StepURL(kind, tonumber(id))
    if url then
        Brand.ShowCopyBox("Step link - copy this", url)
    end
end

-- ── Step cards ───────────────────────────────────────────────────
-- One bordered card per step in the prerequisite chain, same technique as
-- Xal's Armoire's source cards (AppearanceDetail.lua's AcquireCard): a pool,
-- not a fixed set, since step COUNT varies per mount - grown on demand,
-- hidden when unused. Border only, no fill.
local stepCardPool = {}

local function AcquireStepCard(parent, index)
    local card = stepCardPool[index]
    if card then return card end

    card = CreateFrame("Frame", nil, parent)
    Brand.ApplyCardBackground(card)
    Brand.DrawBorder(card, 0)

    local marker = Brand.FS(card, "", Brand.BODY_FONT_PATH, 12, nil, 1, 1, 1)
    marker:SetPoint("TOPLEFT", card, "TOPLEFT", 8, -8)
    marker:SetWidth(12)
    marker:SetJustifyH("LEFT")
    card.marker = marker

    local text = Brand.FS(card, "", Brand.BODY_FONT_PATH, 12, nil, 1, 1, 1)
    text:SetPoint("TOPLEFT", card, "TOPLEFT", 26, -8)
    text:SetPoint("RIGHT", card, "RIGHT", -8, 0)
    text:SetJustifyH("LEFT")
    text:SetWordWrap(true)
    text:SetSpacing(3)
    card.text = text

    card:SetHyperlinksEnabled(true)
    card:SetScript("OnHyperlinkClick", OnStepLink)
    card:SetScript("OnUpdate", FitCard)

    stepCardPool[index] = card
    return card
end

local function BuildFrame()
    if frame then return frame end

    local f = CreateFrame("Frame", "XalsReinsMountDetail", UIParent)
    tinsert(UISpecialFrames, "XalsReinsMountDetail")
    f:SetSize(WIN_W, INITIAL_H)
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
    Brand.DrawBorder(f, 1)

    local icon = f:CreateTexture(nil, "ARTWORK")
    icon:SetSize(44, 44)
    icon:SetPoint("TOPLEFT", f, "TOPLEFT", Brand.SAFE_MARGIN + 4, -Brand.SAFE_MARGIN - 4)
    icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
    f.icon = icon

    local title = Brand.FS(f, "", Brand.TITLE_FONT_PATH, 20, nil,
        Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3])
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

    -- Anchored to the category line instead of parked at a fixed y. A long
    -- mount name wraps the title to two lines, which pushes the category
    -- down - a fixed divider then cuts straight through it (confirmed via
    -- screenshot, "Silvermoon's Arcane Defender"). Same fix Xal's Armoire's
    -- own detail popup needed. Starts at the window's safe margin like
    -- before, not at the category's own left edge: the category sits right
    -- of the icon, so the x offset walks back across the icon (4 inset + 44
    -- icon + 12 gap) to land on the margin; width stays fixed.
    local divider = Brand.DrawHeaderDivider(f, Brand.SAFE_MARGIN, 72, WIN_W - (Brand.SAFE_MARGIN * 2))
    divider:ClearAllPoints()
    PixelUtil.SetPoint(divider, "TOPLEFT", category, "BOTTOMLEFT", -(4 + 44 + 12), -10)

    local heading = Brand.FS(f, "How to get it", Brand.TITLE_FONT_PATH, 15, nil,
        Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3])
    heading:SetPoint("TOPLEFT", divider, "BOTTOMLEFT", 4, -10)
    f.headingText = heading

    -- Bordered card around the sourcing text, same technique as Xal's
    -- Armoire's own source cards - border only (Brand.DrawBorder(card, 0)),
    -- no separate fill, matching Armoire's real implementation exactly
    -- rather than the heavier filled-card look from the discussion mockup.
    -- A "Set Waypoint" button shows in the corner when this mount's vendor
    -- resolves to exactly one real spot in VendorLocations.lua (see
    -- MountData:VendorLocationFor) - stays off for anything ambiguous or
    -- unrecorded, never a guess.
    local card = CreateFrame("Frame", nil, f)
    card:SetPoint("TOPLEFT", heading, "BOTTOMLEFT", 0, -8)
    card:SetPoint("RIGHT", f, "RIGHT", -Brand.SAFE_MARGIN - 4, 0)
    Brand.ApplyCardBackground(card)
    Brand.DrawBorder(card, 0)
    f.sourceCard = card

    local source = Brand.FS(card, "", Brand.BODY_FONT_PATH, 13, nil, 1, 1, 1)
    source:SetPoint("TOPLEFT", card, "TOPLEFT", 8, -8)
    source:SetPoint("RIGHT", card, "RIGHT", -8, 0)
    source:SetJustifyH("LEFT")
    source:SetWordWrap(true)
    f.sourceText = source
    card.text = source
    card:SetScript("OnUpdate", FitCard)

    local waypointBtn = Brand.MakeTextLink(card, "Set Waypoint", function()
        SetWaypoint(card.waypointLoc)
    end)
    waypointBtn:SetPoint("TOPRIGHT", card, "TOPRIGHT", -8, -8)
    f.waypointBtn = waypointBtn

    local blocked = Brand.FS(f, "", Brand.BODY_FONT_PATH, 12, nil, 0.87, 0.33, 0.33)
    blocked:SetPoint("TOPLEFT", card, "BOTTOMLEFT", 0, -10)
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
        Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3])
    stepsHeading:SetPoint("TOPLEFT", availability, "BOTTOMLEFT", 0, -12)
    f.stepsHeading = stepsHeading

    -- Steps render as cards (see AcquireStepCard), built per mount in
    -- Detail:Show - flavor text is re-anchored below whichever card ends up
    -- last, so its starting anchor here is only a placeholder.
    local flavor = Brand.FS(f, "", Brand.BODY_FONT_PATH, 12, nil, 0.62, 0.62, 0.62)
    flavor:SetPoint("TOPLEFT", stepsHeading, "BOTTOMLEFT", 0, -12)
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

    -- Re-anchored per mount in Detail:Show (below flavor or the link
    -- buttons, whichever ends up lowest) instead of a fixed frame position -
    -- content length varies too much per mount for a fixed spot to work.
    local close = Brand.MakeCloseButton(f, function() f:Hide() end)
    f.closeButton = close

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
    -- How common the mount is among players, when the rarity data has a
    -- figure for it - small values show as "<0.1%" rather than a bare 0.
    local rarity = MountData:GetRarity(entry)
    if rarity then
        category = category .. "  |cff999999(owned by " ..
            (rarity < 0.1 and "<0.1" or string.format("%.1f", rarity)) .. "% of players)|r"
    end
    f.categoryText:SetText(category)

    local sourceLine = extra and extra.source
    if sourceLine and sourceLine ~= "" then
        f.sourceText:SetText(sourceLine)
    else
        f.sourceText:SetText("The game doesn't provide sourcing text for this one.")
    end

    -- Best-effort cross-reference against the shared vendor-location data -
    -- a name VendorLocations.lua never recorded, or one that's genuinely
    -- ambiguous (more than one real candidate NPC), just leaves the button
    -- off rather than guessing. Reserve room on the right for the button
    -- with a fixed inset (not computed from the button's own width) so the
    -- source text can never run underneath it, regardless of how long
    -- "Set Waypoint" ends up being.
    local vendorName = MountData:GetSourceVendor(entry)
    local locs = MountData:VendorLocationFor(vendorName, MountData:GetSourceZone(entry))
    f.sourceCard.waypointLoc = (#locs == 1) and locs[1] or nil
    if f.sourceCard.waypointLoc then
        f.waypointBtn:Show()
        f.sourceText:SetPoint("RIGHT", f.sourceCard, "RIGHT", -90, 0)
    else
        f.waypointBtn:Hide()
        f.sourceText:SetPoint("RIGHT", f.sourceCard, "RIGHT", -8, 0)
    end

    -- Best-effort fit now; the card's own per-frame check (FitCard) settles
    -- the true height as soon as the text's width has resolved.
    FitCard(f.sourceCard)

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
    local stepCards, doneCount, totalSteps, untracked = MountData:GetStepCards(entry)

    -- lastAnchor is whatever the true bottom edge of the steps section ends up
    -- being this time - the last real card, or the heading itself when there
    -- are no steps - so the flavor text (and everything chained below it)
    -- always re-anchors to the right place regardless of how many cards there
    -- were.
    local lastAnchor = f.stepsHeading
    if stepCards then
        local header = "Steps  |cff999999(" .. doneCount .. " of " .. totalSteps .. " done"
        -- Say plainly when some steps can't be verified, so an unticked step
        -- doesn't look like the addon getting it wrong.
        if untracked > 0 then
            header = header .. ", " .. untracked .. " can't be checked"
        end
        header = header .. ")|r"
        f.stepsHeading:SetText(header)

        for i = 1, #stepCards do
            local info = stepCards[i]
            local card = AcquireStepCard(f, i)
            card:ClearAllPoints()
            card:SetPoint("TOPLEFT", lastAnchor, "BOTTOMLEFT", 0, -8)
            card:SetPoint("RIGHT", f, "RIGHT", -Brand.SAFE_MARGIN - 4, 0)

            card.marker:SetText(MountData.StepMarker(info.status))
            local body = info.text
            if info.start then
                body = body .. "\n|cff999999" .. info.start .. "|r"
            end
            card.text:SetText(body)

            -- Best-effort fit now; FitCard (per-frame, see above) settles it.
            FitCard(card)
            card:Show()
            lastAnchor = card
        end
        for i = #stepCards + 1, #stepCardPool do stepCardPool[i]:Hide() end
    else
        f.stepsHeading:SetText("")
        for i = 1, #stepCardPool do stepCardPool[i]:Hide() end
    end

    f.flavorText:ClearAllPoints()
    f.flavorText:SetPoint("TOPLEFT", lastAnchor, "BOTTOMLEFT", 0, -12)
    f.flavorText:SetPoint("RIGHT", f, "RIGHT", -Brand.SAFE_MARGIN - 4, 0)

    if extra and extra.description and extra.description ~= "" then
        f.flavorText:SetText(extra.description)
    else
        f.flavorText:SetText("")
    end

    -- A button only exists if there is a real link behind it. Laid out left to
    -- right over whichever ones survive, so there is never a dead gap.
    f.wowheadURL = MountData:GetWowheadURL(entry)
    f.videoURL   = MountData:GetVideoURL(entry)

    -- Anchored off flavor (the actual last content element) instead of a
    -- fixed frame-bottom position - flavor's length varies a lot per mount,
    -- so a fixed offset here risked the exact same overlap StepReminder.lua
    -- had.
    local anchor = nil
    for _, pair in ipairs({ { f.wowheadURL, f.wowheadButton }, { f.videoURL, f.videoButton } }) do
        local url, button = pair[1], pair[2]
        button:ClearAllPoints()
        if url then
            if anchor then
                button:SetPoint("LEFT", anchor, "RIGHT", 10, 0)
            else
                button:SetPoint("TOPLEFT", f.flavorText, "BOTTOMLEFT", 0, -Brand.SAFE_MARGIN)
            end
            button:Show()
            anchor = button
        else
            button:Hide()
        end
    end

    -- Close sits below whichever ended up lowest - the link-button row if
    -- either link exists, otherwise flavor directly.
    local lowestContent = (f.wowheadButton:IsShown() and f.wowheadButton)
        or (f.videoButton:IsShown() and f.videoButton)
        or f.flavorText
    f.closeButton:ClearAllPoints()
    f.closeButton:SetPoint("TOP", lowestContent, "BOTTOM", 0, -Brand.SAFE_MARGIN)

    -- Size the popup to where the content actually ends (see ResizeToContent).
    ResizeToContent()

    f:Show()
end
