-- BrandStyle.lua
-- Xal's Reins
--
-- Xal's shared visual brand. Background/accent/title treatment are from Xal's
-- Craft Courier's splash panel; the button style is from Xal's Compendium
-- (Courier's beveled "steel" buttons looked visually off - inconsistent
-- highlight/shadow read - once placed in a horizontal row, so Compendium's
-- flat button replaced it as the standard, confirmed 2026-08-09). Every
-- border/divider line is at least 2px - a 1px line can fail to render
-- reliably depending on UI scale, which is why Courier's border was already
-- 2px; dividers are brought up to match here too.
--
-- Use these helpers for splash screens, settings panels, and any other
-- custom-drawn frame. Standard interactive controls that AREN'T part of this
-- brand spec (checkboxes, sliders, edit boxes) should still use Blizzard's
-- native templates (UICheckButtonTemplate etc.) - only buttons/borders/titles
-- get the custom treatment.
local addonName, addonTable = ...
addonTable.BrandStyle = {}
local Brand = addonTable.BrandStyle

-- ── Colours (r, g, b) ─────────────────────────────────────────
-- Brand.ACCENT is no longer used anywhere in this addon's UI - kept defined
-- (not deleted) only in case something external still references it, same
-- as Xpedited Routes kept its own old accent constant around unused rather
-- than deleting it outright.
Brand.ACCENT = { 0.72, 0.30, 0.0 }    -- deep, dark, burnt orange - RETIRED 2026-09-27, see Brand.HEADER_COLOR
Brand.GOLD   = { 0.60, 0.47, 0.30 }   -- secondary/body text tone - unaffected, a separate muted body-copy tone
Brand.BG     = { 0.03, 0.028, 0.06, 1 } -- dark indigo leaning purple, #08070f (was near-black, 2026-09-02 rebrand)

-- #681417, a dark brick red - the ONE accent color for this addon, no
-- exceptions (confirmed 2026-09-25, family-wide): window title text, the
-- header divider under it, section headers within a page, action links/
-- buttons, checkbox/edit-box borders, tab labels, the zone-alert icon's
-- glow - literally everywhere the old separate orange (Brand.ACCENT) was
-- used. There is no carved-out exception anywhere in this addon for a
-- second accent color.
Brand.HEADER_COLOR = { 0.4078, 0.0784, 0.0902 }

-- Confirmed color for every OTHER divider (section dividers within a page,
-- list dividers) and panel/window edges - #101020, a near-black indigo.
-- Was (0.16, 0.12, 0.05), a muted brown, for dividers, and orange for
-- borders, before this. Family-wide rollout confirmed 2026-09-20. Distinct
-- concept from HEADER_COLOR above - this is not an accent color, it's the
-- structural line/edge color.
Brand.DIVIDER_COLOR = { 0.0627, 0.0627, 0.1255 }

-- #323264, a muted blue-gray - confirmed 2026-09-20, family-wide. For an
-- UNSELECTED entry in a set of tabs/sidebar links where one is always the
-- current selection (e.g. this addon's Zone/All/Raids/Dungeons tabs) - the
-- selected one uses HEADER_COLOR above, everything else this. Was HEADER_
-- COLOR for both states before, which read as "every tab is active at
-- once" instead of showing one clear current tab.
Brand.SIDEBAR_UNSELECTED = { 0.196, 0.196, 0.392 }
Brand.LINE_THICKNESS = 2 -- minimum for ANY border/divider - never go below this
-- Minimum gap between a panel's true outer edge and the nearest button/text
-- (close buttons especially). DrawBorder()'s line occupies out to 8px in
-- (6px inset + 2px thick) - the FIRST version of this constant was set to
-- exactly 8, which technically cleared the border but left ZERO actual
-- visual gap (content started precisely where the border line ended), so
-- it still read as crammed/touching. Bumped to 14 (a real ~6px of clear
-- space beyond the border) after seeing this live in-game - confirmed
-- 2026-08-09.
Brand.SAFE_MARGIN = 14

-- ── T()  ─ solid-colour texture rectangle.
-- x, y measured from the parent's TOP-LEFT corner (y increases downward).
-- Uses PixelUtil so every edge snaps to a whole physical screen pixel -
-- at a non-integer UI Scale (e.g. 71%), a plain SetPoint/SetSize can land
-- a 2px line on a fractional pixel, which the renderer then blurs/dims.
-- Confirmed 2026-08-09: this was making some sidebar tab borders look
-- randomly "less pronounced" than others, reproducibly, at 71% scale.
function Brand.T(parent, x, y, w, h, r, g, b, a, layer)
    local tex = parent:CreateTexture(nil, layer or "ARTWORK")
    PixelUtil.SetPoint(tex, "TOPLEFT", parent, "TOPLEFT", x, -y)
    PixelUtil.SetSize(tex, w, h)
    tex:SetColorTexture(r, g, b, a or 1)
    return tex
end

-- ── FS()  ─ a FontString with a specific font/size/colour.
function Brand.FS(parent, text, fontPath, size, flags, r, g, b)
    local fs = parent:CreateFontString(nil, "OVERLAY")
    fs:SetFont(fontPath, size, flags or "")
    fs:SetText(text)
    fs:SetTextColor(r, g, b, 1)
    return fs
end

-- ── Font paths ────────────────────────────────────────────────
-- Header/title font: Cinzel Bold (bundled, SIL OFL). Body/label font: Inter
-- Regular/SemiBold (bundled, SIL OFL) - current go-forward pairing,
-- confirmed 2026-09-19, matching Quest Compass's floating tracker window.
-- Must ship in this addon's own Fonts/ folder (Fonts/Cinzel-Bold.ttf,
-- Fonts/Inter-Regular.ttf, Fonts/Inter-SemiBold.ttf, plus their
-- LICENSE.txt files). NOT Fonts\CustomFont.ttf/FiraSans-Medium.ttf (Simply
-- Sans/Fira Sans) - that was this addon's pairing until this update;
-- those files stay bundled (LICENSE.md still covers them) but are no
-- longer referenced by any live code path.
Brand.TITLE_FONT_PATH = "Interface\\AddOns\\XalsReins\\Fonts\\Cinzel-Bold.ttf"
Brand.BODY_FONT_PATH = "Interface\\AddOns\\XalsReins\\Fonts\\Inter-Regular.ttf"
Brand.BODY_FONT_PATH_SEMIBOLD = "Interface\\AddOns\\XalsReins\\Fonts\\Inter-SemiBold.ttf"

-- ── Title()  ─ the branded title treatment, with its drop-shadow layer, in
-- one call. Returns the visible (front) fontstring. Front layer now
-- Brand.HEADER_COLOR (was Brand.ACCENT) - family-wide rollout, 2026-09-20.
function Brand.Title(parent, text, size, anchorPoint, relTo, relPoint, x, y)
    local shadow = Brand.FS(parent, text, Brand.TITLE_FONT_PATH, size, "OUTLINE", 0, 0, 0)
    PixelUtil.SetPoint(shadow, anchorPoint, relTo, relPoint, x + 4, y - 4)
    shadow:SetJustifyH("CENTER")

    local title = Brand.FS(parent, text, Brand.TITLE_FONT_PATH, size, "OUTLINE",
        Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3])
    PixelUtil.SetPoint(title, anchorPoint, relTo, relPoint, x, y)
    title:SetJustifyH("CENTER")
    return title
end

-- Unselected label color - Brand.HEADER_COLOR, the one accent color, no
-- exceptions (confirmed 2026-09-25 - the old separate orange is retired;
-- every call site that used it now uses this instead).
local BTN_LABEL_UNSELECTED = Brand.HEADER_COLOR

-- ── MakeButton()  ─ text-link style (confirmed 2026-08-17/18, originated on
-- Xal's Xpedited Routes - "I don't like the blocky look... the link style
-- looks better"). Supersedes the earlier boxed/bordered/filled button
-- entirely - plain text, no fill, no border. Selected vs. normal state is
-- carried entirely by label color/brightness. Call btn:SetSelected(true/
-- false) to toggle white (selected) vs. the unselected amber-orange.
function Brand.MakeButton(parent, text, w, h, onClick)
    local btn = CreateFrame("Button", nil, parent)
    PixelUtil.SetSize(btn, w, h)

    local label = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetPoint("CENTER")
    label:SetText(text)
    label:SetTextColor(BTN_LABEL_UNSELECTED[1], BTN_LABEL_UNSELECTED[2], BTN_LABEL_UNSELECTED[3], 1)
    btn.label = label

    btn:SetScript("OnEnter", function(self)
        if not self.selected then label:SetTextColor(1, 1, 1, 1) end
    end)
    btn:SetScript("OnLeave", function(self)
        if not self.selected then
            label:SetTextColor(BTN_LABEL_UNSELECTED[1], BTN_LABEL_UNSELECTED[2], BTN_LABEL_UNSELECTED[3], 1)
        end
    end)
    if onClick then btn:SetScript("OnClick", onClick) end

    function btn:SetSelected(selected)
        self.selected = selected
        if selected then
            label:SetTextColor(1, 1, 1, 1)
        else
            label:SetTextColor(BTN_LABEL_UNSELECTED[1], BTN_LABEL_UNSELECTED[2], BTN_LABEL_UNSELECTED[3], 1)
        end
    end

    -- Was a border-color hook before the box existed - kept as the same
    -- method name/signature so call sites don't need touching, just now
    -- tints the label itself instead of a border that no longer exists.
    function btn:SetBorderColor(r, g, bC, a)
        label:SetTextColor(r, g, bC, a)
    end

    return btn
end

-- ── MakeLinkButton()  ─ a second, deliberately plain button style for
-- inline quick-toggles and as the shared building block for other helpers
-- below (MakeDiscordLink, ShowContextMenu) - no border/fill. Hover feedback
-- is wired via HookScript, not SetScript, so a call site can still add its
-- own OnEnter/OnLeave (e.g. a tooltip) without one silently overwriting the
-- other.
function Brand.MakeLinkButton(parent)
    local btn = CreateFrame("Button", nil, parent)
    local label = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    label:SetFont(Brand.BODY_FONT_PATH, 12, "")
    label:SetPoint("CENTER")
    btn.label = label

    function btn:SetLabel(text, r, g, b)
        label:SetText(text)
        if r then label:SetTextColor(r, g, b, 1) end
        btn.baseColor = { r or Brand.HEADER_COLOR[1], g or Brand.HEADER_COLOR[2], b or Brand.HEADER_COLOR[3] }
    end

    btn:HookScript("OnEnter", function() label:SetTextColor(1, 1, 1, 1) end)
    btn:HookScript("OnLeave", function()
        local c = btn.baseColor or Brand.HEADER_COLOR
        label:SetTextColor(c[1], c[2], c[3], 1)
    end)

    return btn
end

-- ── DrawBorder()  ─ single clean line around a frame, in Brand.DIVIDER_COLOR
-- (not Brand.ACCENT - 2026-09-20, matches the confirmed subtle panel-edge
-- look instead of a bright orange border on every window). Deliberately
-- simple - no corner ornaments or tick marks. Each side is anchored to BOTH
-- ends of that edge (not a fixed x/y/w/h), so it auto-stretches if the
-- frame resizes later - important for anything that grows or shrinks at
-- runtime (a list that adds/removes rows, etc.), not just fixed-size
-- splash screens. Call sites pass inset=1 for an outer window edge, inset=0
-- for an inner card/popup - the bare default below is only a fallback.
function Brand.DrawBorder(f, inset)
    inset = inset or 6
    local thick = Brand.LINE_THICKNESS
    local r, g, b = Brand.DIVIDER_COLOR[1], Brand.DIVIDER_COLOR[2], Brand.DIVIDER_COLOR[3]

    local top = f:CreateTexture(nil, "ARTWORK")
    PixelUtil.SetPoint(top, "TOPLEFT", f, "TOPLEFT", inset, -inset)
    PixelUtil.SetPoint(top, "TOPRIGHT", f, "TOPRIGHT", -inset, -inset)
    PixelUtil.SetHeight(top, thick)
    top:SetColorTexture(r, g, b, 1)

    local bottom = f:CreateTexture(nil, "ARTWORK")
    PixelUtil.SetPoint(bottom, "BOTTOMLEFT", f, "BOTTOMLEFT", inset, inset)
    PixelUtil.SetPoint(bottom, "BOTTOMRIGHT", f, "BOTTOMRIGHT", -inset, inset)
    PixelUtil.SetHeight(bottom, thick)
    bottom:SetColorTexture(r, g, b, 1)

    local left = f:CreateTexture(nil, "ARTWORK")
    PixelUtil.SetPoint(left, "TOPLEFT", f, "TOPLEFT", inset, -inset)
    PixelUtil.SetPoint(left, "BOTTOMLEFT", f, "BOTTOMLEFT", inset, inset)
    PixelUtil.SetWidth(left, thick)
    left:SetColorTexture(r, g, b, 1)

    local right = f:CreateTexture(nil, "ARTWORK")
    PixelUtil.SetPoint(right, "TOPRIGHT", f, "TOPRIGHT", -inset, -inset)
    PixelUtil.SetPoint(right, "BOTTOMRIGHT", f, "BOTTOMRIGHT", -inset, inset)
    PixelUtil.SetWidth(right, thick)
    right:SetColorTexture(r, g, b, 1)

    return top, bottom, left, right
end

-- ── DrawDivider()  ─ the thin section-separator line used between content
-- blocks (feature lists, header bars, etc.) - Brand.DIVIDER_COLOR (was a
-- muted brown, 2026-09-20). Not for the one divider directly under a
-- window's title - see DrawHeaderDivider below.
function Brand.DrawDivider(parent, x, y, width)
    return Brand.T(parent, x, y, width, Brand.LINE_THICKNESS,
        Brand.DIVIDER_COLOR[1], Brand.DIVIDER_COLOR[2], Brand.DIVIDER_COLOR[3], 1)
end

-- ── DrawHeaderDivider()  ─ same as DrawDivider, but in Brand.HEADER_COLOR -
-- used ONLY for the single divider directly under a window's main title,
-- never for section dividers within a page (those stay DrawDivider above).
function Brand.DrawHeaderDivider(parent, x, y, width)
    return Brand.T(parent, x, y, width, Brand.LINE_THICKNESS,
        Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3], 1)
end

-- ── ApplyCardBackground()  ─ the fill behind a bordered card, a few shades
-- lighter than the window's own background (#08070f -> #151426) so a card
-- reads as a raised box instead of just an outline. Sits one sublevel
-- below the default BACKGROUND layer so a card's hover highlight (drawn at
-- the default sublevel) still lands on top of it.
Brand.CARD_BG = { 0.082, 0.078, 0.149, 1 }

function Brand.ApplyCardBackground(f)
    local bg = f:CreateTexture(nil, "BACKGROUND", nil, -1)
    bg:SetAllPoints()
    bg:SetColorTexture(Brand.CARD_BG[1], Brand.CARD_BG[2], Brand.CARD_BG[3], Brand.CARD_BG[4])
    return bg
end

-- ── ApplyBackground()  ─ the standard opaque near-black frame background.
function Brand.ApplyBackground(f)
    local bg = f:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(Brand.BG[1], Brand.BG[2], Brand.BG[3], Brand.BG[4])
    return bg
end

-- ── MakeCheckbox()  ─ hand-drawn checkbox, same reason/technique as
-- MakeButton's hand-drawn border: Blizzard's native UICheckButtonTemplate
-- was found rendering incomplete (missing its bottom edge entirely, not
-- just uneven thickness) in a real in-game screenshot - confirmed
-- 2026-08-12 on Roster Roundup's Options window. Rather than chase why the
-- native template's art is unreliable, this uses the exact same
-- pixel-snapped 4-texture border technique already proven reliable for
-- Brand.MakeButton/DrawBorder, so it can't have a side silently fail to
-- render. This is now the brand standard for checkboxes - stop using
-- UICheckButtonTemplate in new code.
--
-- Usage differs slightly from a native CheckButton: set `cb.OnToggle =
-- function(self) ... end` instead of `cb:SetScript("OnClick", ...)`, since
-- OnClick is used internally to flip the checked state before your handler
-- runs (matching the native behavior where GetChecked() already reflects
-- the NEW state inside OnClick).
function Brand.MakeCheckbox(parent, size)
    size = size or 22
    local cb = CreateFrame("Button", nil, parent)
    PixelUtil.SetSize(cb, size, size)

    local bg = cb:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(0.1, 0.1, 0.1, 0.6)

    local thick = Brand.LINE_THICKNESS
    local r, g, b = Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3]

    local borderTop = cb:CreateTexture(nil, "ARTWORK")
    PixelUtil.SetPoint(borderTop, "TOPLEFT", cb, "TOPLEFT", 0, 0)
    PixelUtil.SetPoint(borderTop, "TOPRIGHT", cb, "TOPRIGHT", 0, 0)
    PixelUtil.SetHeight(borderTop, thick)
    borderTop:SetColorTexture(r, g, b, 1)

    local borderBottom = cb:CreateTexture(nil, "ARTWORK")
    PixelUtil.SetPoint(borderBottom, "BOTTOMLEFT", cb, "BOTTOMLEFT", 0, 0)
    PixelUtil.SetPoint(borderBottom, "BOTTOMRIGHT", cb, "BOTTOMRIGHT", 0, 0)
    PixelUtil.SetHeight(borderBottom, thick)
    borderBottom:SetColorTexture(r, g, b, 1)

    local borderLeft = cb:CreateTexture(nil, "ARTWORK")
    PixelUtil.SetPoint(borderLeft, "TOPLEFT", cb, "TOPLEFT", 0, 0)
    PixelUtil.SetPoint(borderLeft, "BOTTOMLEFT", cb, "BOTTOMLEFT", 0, 0)
    PixelUtil.SetWidth(borderLeft, thick)
    borderLeft:SetColorTexture(r, g, b, 1)

    local borderRight = cb:CreateTexture(nil, "ARTWORK")
    PixelUtil.SetPoint(borderRight, "TOPRIGHT", cb, "TOPRIGHT", 0, 0)
    PixelUtil.SetPoint(borderRight, "BOTTOMRIGHT", cb, "BOTTOMRIGHT", 0, 0)
    PixelUtil.SetWidth(borderRight, thick)
    borderRight:SetColorTexture(r, g, b, 1)

    -- Texture, not a FontString "X" - a font glyph's CENTER anchor centers
    -- against the font's full line-height box (ascender/descender padding
    -- included), not the glyph's actual ink, so it visually drifts off-true-
    -- center. Blizzard's own checkmark texture centers exactly where told,
    -- no font-metrics guesswork. This superseded the FontString "X" version
    -- 2026-08-13; this template still had the old version until 2026-08-14.
    local check = cb:CreateTexture(nil, "OVERLAY")
    check:SetTexture("Interface\\Buttons\\UI-CheckBox-Check")
    check:SetVertexColor(r, g, b, 1)
    PixelUtil.SetSize(check, size - 4, size - 4)
    check:SetPoint("CENTER", cb, "CENTER", 0, 0)
    check:Hide()

    cb.checked = false
    function cb:SetChecked(state)
        self.checked = state and true or false
        if self.checked then check:Show() else check:Hide() end
    end
    function cb:GetChecked()
        return self.checked
    end

    cb:SetScript("OnEnter", function() bg:SetColorTexture(0.18, 0.18, 0.18, 0.75) end)
    cb:SetScript("OnLeave", function() bg:SetColorTexture(0.1, 0.1, 0.1, 0.6) end)
    cb:SetScript("OnClick", function(self)
        self:SetChecked(not self.checked)
        if self.OnToggle then self.OnToggle(self) end
    end)

    return cb
end
-- ── ApplyBackgroundImage()  ─ the shared dark-swirl texture art, sitting on
-- top of the flat background color (BORDER layer, below everything else -
-- border/dividers/text all draw at ARTWORK/OVERLAY, above this), same
-- treatment Compendium already uses on its own panels. Call AFTER
-- ApplyBackground so the flat color shows through anywhere the image
-- doesn't cover. Returns the texture so callers can hide/show it (e.g. a
-- frameless mode toggle) without hunting for it again.
function Brand.ApplyBackgroundImage(f)
    local img = f:CreateTexture(nil, "BORDER")
    img:SetAllPoints(f)
    img:SetTexture("Interface\\AddOns\\XalsReins\\Textures\\PanelBackground.jpg")
    return img
end

-- ── Discord link ──────────────────────────────────────────────
-- A permanent, standing text link (not a per-release thing) meant to live on
-- the What's New splash and the main Settings page - Lua can't open a
-- browser directly, so clicking it pops the standard WoW copy-a-URL dialog
-- (an auto-selected, read-only edit box) instead. One popup definition
-- shared by every call site.
Brand.DISCORD_URL = "https://discord.gg/9SwrQDJeCe"

StaticPopupDialogs["XALSREINS_COPY_URL"] = {
    text = "%s",
    button1 = "Close",
    hasEditBox = true,
    editBoxWidth = 260,
    OnShow = function(self, data)
        -- Current clients expose this as `EditBox` (capital E); the lowercase
        -- `editBox` this was originally written against no longer exists and
        -- threw "attempt to index field 'editBox' (a nil value)". Both are
        -- checked so this can't break again either way.
        local eb = self.EditBox or self.editBox
        if not eb then return end
        eb:SetText(data or Brand.DISCORD_URL)
        eb:HighlightText()
        eb:SetFocus()
    end,
    EditBoxOnEscapePressed = function(self) self:GetParent():Hide() end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
}

-- Icon-only Discord mark (official brand asset, white symbol variant), shown
-- next to the text link so it pops instead of reading as plain text -
-- confirmed 2026-09-19. Ships Textures/DiscordIcon.png in this addon's own
-- folder, copied from D:\WoW_Addons\Dev\Assets\Icons\Discord-Symbol-White_64.png
-- (already resized to a game-ready size - not re-sourced, not recolored/
-- distorted per Discord's brand guidelines).
Brand.DISCORD_ICON = "Interface\\AddOns\\XalsReins\\Textures\\DiscordIcon.png"

function Brand.MakeDiscordLink(parent)
    local btn = Brand.MakeLinkButton(parent)
    btn:SetSize(92, 20)

    -- Icon sits left of the label - real aspect ratio (84x64 source)
    -- preserved so the mark doesn't look squashed at this size.
    local icon = btn:CreateTexture(nil, "ARTWORK")
    icon:SetSize(21, 16)
    icon:SetPoint("LEFT", btn, "LEFT", 0, 0)
    icon:SetTexture(Brand.DISCORD_ICON)
    btn.icon = icon

    btn.label:ClearAllPoints()
    btn.label:SetPoint("LEFT", icon, "RIGHT", 5, 0)
    btn:SetLabel("Discord", 0.45, 0.55, 0.95)

    btn:HookScript("OnEnter", function() icon:SetVertexColor(1, 1, 1, 1) end)
    btn:HookScript("OnLeave", function() icon:SetVertexColor(0.45, 0.55, 0.95, 1) end)
    icon:SetVertexColor(0.45, 0.55, 0.95, 1)

    btn:SetScript("OnClick", function()
        Brand.ShowCopyBox("Join us on Discord", Brand.DISCORD_URL)
    end)

    return btn
end

-- ── MakeTextLink() / MakeCloseButton() ───────────────────────────
-- Text-link style controls (brightening to white on hover) rather than
-- boxed buttons. Ported from Routes, where the boxed "X"/button style was
-- replaced for exactly this reason - confirmed preference 2026-08-16: "it
-- doesn't create such a visual blemish". Default label color is
-- Brand.HEADER_COLOR - the one accent color, no exceptions (confirmed
-- 2026-09-25).
--
-- Neither sets its own anchor point; every call site anchors it itself, same
-- convention as Brand.MakeButton.
function Brand.MakeTextLink(parent, text, onClick)
    local btn = CreateFrame("Button", nil, parent)
    btn:SetHeight(20)

    local label = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    label:SetPoint("CENTER")
    label:SetText(text)
    label:SetTextColor(Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3], 1)
    btn.label = label
    btn:SetWidth(math.max(40, label:GetStringWidth() + 8))

    btn:SetScript("OnEnter", function() label:SetTextColor(1, 1, 1, 1) end)
    btn:SetScript("OnLeave", function()
        label:SetTextColor(Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3], 1)
    end)
    btn:SetScript("OnClick", onClick)

    return btn
end

function Brand.MakeCloseButton(parent, onClick)
    return Brand.MakeTextLink(parent, "Close", onClick or function() parent:Hide() end)
end

-- ── MakeEditBox()  ─ hand-drawn text input, same 4-texture border technique
-- as MakeButton/MakeCheckbox - no Blizzard InputBoxTemplate art, whose
-- endcap textures render wider than its SetSize (bled fields past a panel's
-- safe margin on another addon). Exact, predictable width instead.
function Brand.MakeEditBox(parent, w, h)
    h = h or 22
    local box = CreateFrame("EditBox", nil, parent)
    PixelUtil.SetSize(box, w, h)

    local bg = box:CreateTexture(nil, "BACKGROUND")
    bg:SetAllPoints()
    bg:SetColorTexture(0.1, 0.1, 0.1, 0.6)

    local thick = Brand.LINE_THICKNESS
    local r, g, b = Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3]

    local borderTop = box:CreateTexture(nil, "ARTWORK")
    PixelUtil.SetPoint(borderTop, "TOPLEFT", box, "TOPLEFT", 0, 0)
    PixelUtil.SetPoint(borderTop, "TOPRIGHT", box, "TOPRIGHT", 0, 0)
    PixelUtil.SetHeight(borderTop, thick)
    borderTop:SetColorTexture(r, g, b, 1)

    local borderBottom = box:CreateTexture(nil, "ARTWORK")
    PixelUtil.SetPoint(borderBottom, "BOTTOMLEFT", box, "BOTTOMLEFT", 0, 0)
    PixelUtil.SetPoint(borderBottom, "BOTTOMRIGHT", box, "BOTTOMRIGHT", 0, 0)
    PixelUtil.SetHeight(borderBottom, thick)
    borderBottom:SetColorTexture(r, g, b, 1)

    local borderLeft = box:CreateTexture(nil, "ARTWORK")
    PixelUtil.SetPoint(borderLeft, "TOPLEFT", box, "TOPLEFT", 0, 0)
    PixelUtil.SetPoint(borderLeft, "BOTTOMLEFT", box, "BOTTOMLEFT", 0, 0)
    PixelUtil.SetWidth(borderLeft, thick)
    borderLeft:SetColorTexture(r, g, b, 1)

    local borderRight = box:CreateTexture(nil, "ARTWORK")
    PixelUtil.SetPoint(borderRight, "TOPRIGHT", box, "TOPRIGHT", 0, 0)
    PixelUtil.SetPoint(borderRight, "BOTTOMRIGHT", box, "BOTTOMRIGHT", 0, 0)
    PixelUtil.SetWidth(borderRight, thick)
    borderRight:SetColorTexture(r, g, b, 1)

    box:SetFont(Brand.BODY_FONT_PATH, 13, "")
    box:SetTextColor(0.9, 0.9, 0.9, 1)
    box:SetTextInsets(6, 6, 0, 0)
    box:SetAutoFocus(false)

    return box
end

-- ── ShowContextMenu()  ─ a right-click menu built entirely from brand
-- widgets (bordered background, text-link entries) - NOT Blizzard's
-- UIDropDownMenu/EasyMenu. Confirmed 2026-09-19: never default to
-- Blizzard's own menu chrome for a context menu - build it ourselves like
-- everything else in this brand.
--
-- options is an array of { label, r, g, b, onClick } - r/g/b optional
-- (defaults to Brand.HEADER_COLOR). Not currently called anywhere in this
-- addon - bundled for parity/future use, same as every other addon's
-- BrandStyle.
local contextMenu, clickCatcher

function Brand.ShowContextMenu(options)
    if not clickCatcher then
        clickCatcher = CreateFrame("Button", nil, UIParent)
        clickCatcher:SetAllPoints(UIParent)
        clickCatcher:SetFrameStrata("FULLSCREEN")
        clickCatcher:Hide()
    end

    if not contextMenu then
        contextMenu = CreateFrame("Frame", nil, UIParent)
        contextMenu:SetFrameStrata("FULLSCREEN_DIALOG")
        Brand.ApplyBackground(contextMenu)
        Brand.DrawBorder(contextMenu, 0)
        contextMenu.buttons = {}
        contextMenu:Hide()
    end

    local ROW_H, PAD = 22, 10
    local width = 90
    for i, opt in ipairs(options) do
        local btn = contextMenu.buttons[i]
        if not btn then
            btn = Brand.MakeLinkButton(contextMenu)
            btn:SetHeight(ROW_H)
            contextMenu.buttons[i] = btn
        end
        btn:SetLabel(opt.label, opt.r or Brand.HEADER_COLOR[1], opt.g or Brand.HEADER_COLOR[2], opt.b or Brand.HEADER_COLOR[3])
        btn:SetPoint("TOPLEFT", contextMenu, "TOPLEFT", PAD, -PAD - (i - 1) * ROW_H)
        btn:SetScript("OnClick", function()
            clickCatcher:Hide()
            contextMenu:Hide()
            if opt.onClick then opt.onClick() end
        end)
        btn:Show()
        local w = btn.label:GetStringWidth() + 4
        if w > width then width = w end
    end
    for i = #options + 1, #contextMenu.buttons do
        contextMenu.buttons[i]:Hide()
    end
    for _, btn in ipairs(contextMenu.buttons) do btn:SetWidth(width) end

    contextMenu:SetSize(width + PAD * 2, #options * ROW_H + PAD * 2)

    local x, y = GetCursorPosition()
    local scale = UIParent:GetEffectiveScale()
    contextMenu:ClearAllPoints()
    contextMenu:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x / scale, y / scale)

    clickCatcher:Show()
    clickCatcher:SetScript("OnClick", function()
        clickCatcher:Hide()
        contextMenu:Hide()
    end)
    contextMenu:Show()
end

-- ── ShowCopyBox() ────────────────────────────────────────────────
-- Our own copy-a-URL window, replacing Blizzard's StaticPopup so it carries
-- the addon's background, border and fonts like every other frame here.
-- Also sidesteps that dialog's field-name churn (editBox vs EditBox) entirely.
local copyFrame

function Brand.ShowCopyBox(caption, url)
    if not url or url == "" then return end

    if not copyFrame then
        local f = CreateFrame("Frame", "XalsReinsCopyBox", UIParent)
        f:SetSize(360, 130)
        f:SetPoint("CENTER", UIParent, "CENTER", 0, 220)
        f:SetFrameStrata("FULLSCREEN_DIALOG")
        f:SetToplevel(true)
        f:SetMovable(true)
        f:EnableMouse(true)
        f:RegisterForDrag("LeftButton")
        f:SetScript("OnDragStart", f.StartMoving)
        f:SetScript("OnDragStop", f.StopMovingOrSizing)
        f:SetClampedToScreen(true)
        tinsert(UISpecialFrames, "XalsReinsCopyBox")

        Brand.ApplyBackground(f)
        Brand.DrawBorder(f, 1)

        f.caption = Brand.FS(f, "", Brand.TITLE_FONT_PATH, 15, nil,
            Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3])
        f.caption:SetPoint("TOP", f, "TOP", 0, -Brand.SAFE_MARGIN)

        local box = Brand.MakeEditBox(f, 322, 22)
        box:SetPoint("TOPLEFT", f, "TOPLEFT", Brand.SAFE_MARGIN + 10, -46)
        box:SetAutoFocus(true)
        -- Reselect rather than allow edits: this is for copying, not typing.
        box:SetScript("OnTextChanged", function(self)
            if self.locked then return end
            self.locked = true
            self:SetText(f.url or "")
            self:HighlightText()
            self.locked = false
        end)
        box:SetScript("OnEscapePressed", function() f:Hide() end)
        f.box = box

        local hint = Brand.FS(f, "Ctrl+C to copy", Brand.BODY_FONT_PATH, 11, nil, 0.6, 0.6, 0.6)
        hint:SetPoint("TOPLEFT", box, "BOTTOMLEFT", 2, -6)

        local close = Brand.MakeCloseButton(f, function() f:Hide() end)
        close:SetPoint("BOTTOM", f, "BOTTOM", 0, Brand.SAFE_MARGIN)

        copyFrame = f
    end

    copyFrame.url = url
    copyFrame.caption:SetText(caption or "Copy this link")
    copyFrame.box.locked = true
    copyFrame.box:SetText(url)
    copyFrame.box.locked = false
    copyFrame:Show()
    copyFrame.box:SetFocus()
    copyFrame.box:HighlightText()
end
