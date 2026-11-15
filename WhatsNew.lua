-- WhatsNew.lua
-- Xal's Reins
--
-- Shows a "what's new" splash automatically the FIRST time a player logs in
-- after the addon has been updated to a new version - never during normal,
-- unchanged play. Compares the addon's real installed version (read from the
-- .toc at runtime) against the last version this player actually saw, and
-- only pops up when they differ.
--
-- CHANGELOG.md already gets written by hand before every release, in Dev,
-- before Jason ever commits/pushes anything - same moment, update WHATS_NEW
-- below (the "date" field and the intro/sections content) to match. It's
-- one more file touched during normal release prep, nothing extra for Jason
-- to remember or do - same as Routes Changelog.md / routes_changelog_dev.md
-- already get updated every release. A WoW addon can't read the external
-- CHANGELOG.md file live at runtime (Blizzard's addon sandbox has no file
-- access) - which is exactly why this gets written by hand at prep time
-- instead, not because it's some separate manual chore layered on top.
-- The version NUMBER shown on the splash does NOT need updating here - it's
-- read live from the real installed .toc version, same value used for the
-- update-check itself, so there's only ever one place that can go stale.
local addonName, addonTable = ...
addonTable.WhatsNew = {}
local W = addonTable.WhatsNew
local Brand = addonTable.BrandStyle

-- ── Update this block every release to match CHANGELOG.md ──────
-- (no "version" field here on purpose - see note above)
W.WHATS_NEW = {
    date = "November 15, 2026",
    intro = "A mount tracker that shows what you can actually go and get, and how to get it.",
    sections = {
        { heading = "New", items = {
            "Six color skins - pick one in settings and every window changes right away.",
            "A real settings window, with options for the zone alert icon: show or hide it, make it bigger or smaller, and put it back where it started.",
            "A new icon to match the rest of the Xal's addons.",
        } },
        { heading = "Changed", items = {
            "Indigo slate is the new default look. Crimson is still there as a choice.",
            "The selected tab is a brighter color.",
        } },
    },
}

-- WoW Forever has its own release notes - the Retail ones above talk about
-- expansions and features that don't exist there.
W.WHATS_NEW_FOREVER = {
    date = "November 15, 2026",
    intro = "Reins on WoW Forever now knows where every mount comes from.",
    sections = {
        { heading = "New", items = {
            "Each mount says how you get it: Vendor, Drop, Quest, Reputation, Profession or PvP, and PvP mounts have their own section.",
            "Six color skins and a real settings window, with options for the zone alert icon.",
            "A new icon to match the rest of the Xal's addons.",
        } },
        { heading = "Fixed", items = {
            "The zone alert, the Zone tab and the Raids and Dungeons tabs were empty on Forever. They now work.",
            "Racial mounts no longer ask for Exalted reputation they don't need.",
        } },
    },
}
local FOREVER = WOW_PROJECT_CAMELOT ~= nil and WOW_PROJECT_ID == WOW_PROJECT_CAMELOT

-- ── Version check ────────────────────────────────────────────
-- C_AddOns.GetAddOnMetadata is the current namespaced API (available on
-- Retail, MoP Classic, and Classic Era alike since Dragonflight); the bare
-- global is kept as a fallback only, same defensive pattern used elsewhere
-- in Jason's addons for other C_* namespaces.
local function GetInstalledVersion()
    local v
    if C_AddOns and C_AddOns.GetAddOnMetadata then
        v = C_AddOns.GetAddOnMetadata(addonName, "Version")
    elseif _G.GetAddOnMetadata then
        v = _G.GetAddOnMetadata(addonName, "Version")
    end
    -- The .toc's "@project-version@" token only gets replaced with a real
    -- number by the packager, which only runs on an actual tagged release.
    -- Testing straight from local files (no tag pushed) leaves it as this
    -- literal, unsubstituted text - show a friendly fallback instead of the
    -- broken-looking placeholder string.
    if v == "@project-version@" then
        return "dev"
    end
    return v
end

local FW = 460
local MAX_FH = 560 -- clamp so an unusually long release note can't run off-screen

local function BuildFrame(installedVersion)
    local f = CreateFrame("Frame", "XalsReinsWhatsNewFrame", UIParent)
    f:SetSize(FW, 360) -- placeholder height; set for real below once content is laid out
    -- Distinct default offset + SetToplevel + saved position, per the suite-wide
    -- window rule: a bare SetPoint("CENTER") makes this land on top of another
    -- Xal's addon's window whenever two are open at once.
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
            XalsReinsDB.whatsNewPos = { point = point, relPoint = relPoint, x = x, y = y }
        end
    end)
    f:SetClampedToScreen(true)

    local pos = type(XalsReinsDB) == "table" and XalsReinsDB.whatsNewPos or nil
    if pos and pos.point then
        f:SetPoint(pos.point, UIParent, pos.relPoint, pos.x, pos.y)
    else
        f:SetPoint("CENTER", UIParent, "CENTER", -220, 140)
    end

    Brand.ApplyBackground(f)
    Brand.DrawBorder(f, 1)

    local data = FOREVER and W.WHATS_NEW_FOREVER or W.WHATS_NEW
    Brand.Title(f, "What's New", 26, "TOP", f, "TOP", 0, -24)

    -- "installedVersion" is the REAL live version (from CheckAndShow), not a
    -- hand-typed field - it always matches whatever actually got tagged.
    local verLine = Brand.FS(f, "Version " .. installedVersion .. (data.date and ("  ·  " .. data.date) or ""),
        Brand.BODY_FONT_PATH, 12, "", Brand.GOLD[1], Brand.GOLD[2], Brand.GOLD[3])
    verLine:SetPoint("TOP", f, "TOP", 0, -58)
    verLine:SetJustifyH("CENTER")

    Brand.DrawHeaderDivider(f, 30, 78, FW - 60)

    -- Every line hangs off the one above it (BOTTOMLEFT anchor) instead of a
    -- height measured up front: a wrapped line's real height isn't known
    -- until its width has resolved, so measuring it here read one line and
    -- stacked everything on top of everything else. With chained anchors the
    -- layout is always right, and the frame height is fitted from the last
    -- line's real bottom (below).
    local last, lastX
    local function Place(obj, x, gap)
        if last then
            obj:SetPoint("TOPLEFT", last, "BOTTOMLEFT", x - lastX, -gap)
        else
            obj:SetPoint("TOPLEFT", f, "TOPLEFT", x, -92)
        end
        last, lastX = obj, x
    end

    if data.intro and data.intro ~= "" then
        local intro = Brand.FS(f, data.intro, Brand.BODY_FONT_PATH, 12, "", Brand.BODY_COLOR[1], Brand.BODY_COLOR[2], Brand.BODY_COLOR[3])
        intro:SetWidth(FW - 60)
        intro:SetJustifyH("LEFT")
        intro:SetWordWrap(true)
        Place(intro, 30, 0)
    end

    local afterBullet = false
    for _, section in ipairs(data.sections or {}) do
        local head = Brand.FS(f, section.heading, Brand.BODY_FONT_PATH, 13, "OUTLINE",
            Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3])
        Place(head, 30, afterBullet and 16 or 14)
        afterBullet = false

        for _, item in ipairs(section.items or {}) do
            local bullet = Brand.FS(f, "-  " .. item, Brand.BODY_FONT_PATH, 12, "",
                Brand.GOLD[1], Brand.GOLD[2], Brand.GOLD[3])
            bullet:SetWidth(FW - 76)
            bullet:SetJustifyH("LEFT")
            bullet:SetWordWrap(true)
            Place(bullet, 36, 6)
            afterBullet = true
        end
    end

    local closeBtn = Brand.MakeButton(f, "Got it", 110, 28, function()
        f:Hide()
    end)
    closeBtn:SetPoint("BOTTOM", f, "BOTTOM", 0, 18)

    -- Size the frame to its ACTUAL content: from the frame's top down to the
    -- last line's real bottom, plus room for the close button and padding.
    -- Re-checked every frame while shown (cheap, and only writes on a change)
    -- so it settles as soon as the text widths resolve.
    f:SetScript("OnUpdate", function(self)
        local top, bottom = self:GetTop(), last and last:GetBottom()
        if not (top and bottom) then return end
        local h = math.min((top - bottom) + 56, MAX_FH)
        if math.abs(self:GetHeight() - h) > 0.5 then self:SetHeight(h) end
    end)

    return f
end

-- Call this from Engine's Init - checks the version and shows the splash
-- only when it's genuinely changed since this player last saw it.
function W:CheckAndShow()
    local installed = GetInstalledVersion()
    if not installed then return end -- metadata unavailable, don't error, just skip

    -- Uses the addon's account-wide DB - XalsReinsDB - same table
    -- every other saved setting lives in, so no extra SavedVariables entry
    -- needs registering in the .toc.
    local db = _G["XalsReinsDB"]
    if not db then return end

    if db.lastSeenVersion ~= installed then
        db.lastSeenVersion = installed
        -- pcall so a bad edit to WHATS_NEW (typo, missing field) can never
        -- break the rest of the addon's login - worst case, the splash just
        -- silently doesn't show that one time.
        local ok, frame = pcall(BuildFrame, installed)
        if ok and frame then frame:Show() end
    end
end
