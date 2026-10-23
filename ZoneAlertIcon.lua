-- ZoneAlertIcon.lua
-- Xal's Reins - a floating saddle icon, separate from the fixed minimap
-- button, that flashes when the zone you're standing in has a mount you can
-- actually go and get right now. A small badge shows how many.
--
-- Deliberately NOT hidden by default: left-click always jumps to whichever
-- mount you most recently made progress on (StepReminder.lua), regardless of
-- what's in your current zone, so the icon needs to be there to click even
-- when this zone has nothing. The "Show reminder for last mount worked on"
-- setting controls that - turn it off and the icon only appears when this
-- zone genuinely has something, since there's no other reason to keep it on
-- screen.
--
-- Right-click opens the tracker on its Zone tab (2026-09-29 - was a "this
-- zone only" checkbox layered onto the other tabs; now Zone is a real 4th
-- tab of its own, same pattern as Xal's Compendium's Zone/Daily/Weekly/
-- Legacy tabs).
--
-- The glow technique is copied exactly from Quest Compass's own floating
-- alert icon (same file, its "CreateCompactIcon" - Interface\Cooldown\star4,
-- ADD blend, 1.875x the icon, this addon's own accent color, 0.35-0.85 alpha
-- bounce over 1.1s) rather than reinvented, so it reads as the same visual
-- language across addons. Colored with Brand.HEADER_COLOR (this addon's one
-- accent color, no exceptions), the same way Compass colors its own glow off
-- its own accent constant - not a hardcoded color independent of the brand.

local addonName, addonTable = ...
addonTable.ZoneAlertIcon = addonTable.ZoneAlertIcon or {}
local Alert     = addonTable.ZoneAlertIcon
local Brand     = addonTable.BrandStyle
local MountData = addonTable.MountData

local ICON_SIZE = 40
local ICON_PATH = "Interface\\AddOns\\XalsReins\\Textures\\MinimapIcon_v1.png"
-- Badge stays proportional to the icon, not a fixed size - same ratio Xal's
-- Compendium uses for its own floating-icon badge.
local BADGE_RATIO = 22 / 64

local icon

local function ShowReminderEnabled()
    return type(XalsReinsDB) == "table" and XalsReinsDB.showLastMountReminder ~= false
end

-- Every mount in the to-do list that matches the zone you're standing in
-- right now - not just the first one. Reuses the exact same to-do/zone-
-- matching MainTracker itself filters on (its Zone tab), so the icon can
-- never disagree with what the tracker would show. Both the glow condition
-- and the badge count come from this one list, so they can't disagree with
-- each other either.
local function ZoneMounts()
    local todo = MountData:GetTodoList()
    local zoneNames = MountData:CurrentZoneNames()
    local matches = {}
    for i = 1, #todo do
        if MountData:MatchesCurrentZone(todo[i], zoneNames) then
            matches[#matches + 1] = todo[i]
        end
    end
    return matches
end

-- Xal's Keep installed: the Keep's rook is the one zone alert for the whole
-- collection suite. This icon never shows; the rook asks this count instead.
if XalsKeep and XalsKeep.RegisterZoneCount then
    XalsKeep:RegisterZoneCount("reins", function() return #ZoneMounts() end)
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
    glow:SetVertexColor(Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3])
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

    -- Zone mount count badge, same technique as Xal's Compendium's floating-
    -- icon badge: a real circle (Blizzard's own round indicator asset,
    -- recolored via SetVertexColor), not a backdrop-textured square - a
    -- plain square backdrop was a confirmed real bug there. A slightly
    -- larger dark copy sits behind it as a thin ring (colored to match this
    -- addon's own background) so the badge doesn't blend into the saddle
    -- art underneath.
    local badgeSize = math.floor(ICON_SIZE * BADGE_RATIO + 0.5)
    local badgeRing = f:CreateTexture(nil, "OVERLAY", nil, 1)
    badgeRing:SetTexture("Interface\\COMMON\\Indicator-Gray")
    badgeRing:SetSize(badgeSize + 4, badgeSize + 4)
    badgeRing:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", 4, -4)
    badgeRing:SetVertexColor(Brand.BG[1], Brand.BG[2], Brand.BG[3])
    f.badgeRing = badgeRing

    local badge = f:CreateTexture(nil, "OVERLAY", nil, 2)
    badge:SetTexture("Interface\\COMMON\\Indicator-Gray")
    badge:SetSize(badgeSize, badgeSize)
    badge:SetPoint("CENTER", badgeRing, "CENTER", 0, 0)
    badge:SetVertexColor(Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3])
    f.badge = badge

    local badgeText = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    badgeText:SetPoint("CENTER", badge, "CENTER", 0, 0)
    badgeText:SetTextColor(1, 1, 1, 1)
    badge.text = badgeText

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
        GameTooltip:SetText("Xal's Reins", Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3])

        local lastEntry, remaining = addonTable.StepReminder:GetLastMountEntry()
        if lastEntry then
            GameTooltip:AddLine("|cff999999Left-click:|r " .. lastEntry.name ..
                " - " .. remaining .. " step" .. (remaining == 1 and "" or "s") .. " left")
        else
            GameTooltip:AddLine("|cff999999Left-click:|r nothing tracked yet")
        end

        if #ZoneMounts() > 0 then
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

-- Decides whether the icon itself shows, whether the glow plays, and what
-- the badge reads - three separate questions, all driven off one shared
-- ZoneMounts() list so they can't disagree with each other. The icon shows
-- either because the setting keeps it up always, or because this zone
-- genuinely has something; the glow and the badge number ONLY ever reflect
-- the second reason - the badge stays hidden at 0 rather than showing a
-- bare "0" when the icon's only up for the last-mount-reminder setting.
function Alert:UpdateVisibility()
    if XalsKeep then
        if icon then icon:Hide() end
        XalsKeep:ZoneUpdated()
        return
    end

    local f = BuildIcon()
    local zoneMounts = ZoneMounts()
    local hasZoneMount = #zoneMounts > 0

    if hasZoneMount or ShowReminderEnabled() then
        f:Show()
    else
        f:Hide()
    end

    if hasZoneMount then
        f.glow:Show()
        if not f.glowAnim:IsPlaying() then f.glowAnim:Play() end
        f.badge:Show()
        f.badgeRing:Show()
        f.badge.text:SetText(tostring(#zoneMounts))
    else
        f.glow:Hide()
        f.glowAnim:Stop()
        f.badge:Hide()
        f.badgeRing:Hide()
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
    if icon or XalsKeep then Alert:UpdateVisibility() end
end)
