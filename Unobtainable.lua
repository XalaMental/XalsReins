-- Unobtainable.lua
-- Xal's Reins - mounts that are in the journal but nobody can get any more.
--
-- The mount journal has no "this is over" flag. A Legion Remix mount still
-- sits there listed as a World Event long after the event ended, and without
-- this it lands in your to-do list as though you could go and get it.
--
-- Kept as a list of SOURCE FRAGMENTS rather than individual mounts, which is
-- the whole reason this stays maintainable: one entry retires every mount from
-- that event at once, instead of a thousand-row per-mount table.
--
-- RULES:
--   * Only add something genuinely closed to everyone. A mount that's merely
--     rare, seasonal, or returns on a rotation is NOT unobtainable - holiday
--     mounts come back every year and belong in Limited Time.
--   * Match text as it appears in the game's own source line.
--   * Add a comment saying when it closed, so this can be audited later.

local addonName, addonTable = ...

addonTable.UnobtainableSources = {
    -- Limited-time expansion remix events. These do not return.
    "WoW Remix: Legion",          -- ended 2025
    "WoW Remix: Mists of Pandaria", -- ended 2025
}

-- Name prefixes that mark a mount as not real content. "(PH)" is Blizzard's
-- own placeholder marker for unreleased or internal entries; they show up in
-- the journal with no meaningful source and can never be collected.
addonTable.PlaceholderPrefixes = {
    "(PH)",
    "[PH]",
    "[DNT]",   -- "do not translate"/internal test entries
}
