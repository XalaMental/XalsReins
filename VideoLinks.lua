-- VideoLinks.lua
-- Xal's Reins - hand-researched video guide links.
--
-- There is no per-mount video ID anywhere in game data, so unlike the Wowhead
-- link (derived from spellID) every entry here is found and verified by hand.
--
-- RULES for this table:
--   * Only real, specific video guides for THAT mount. Never a search URL,
--     never a channel, never a "top 10 mounts" compilation.
--   * A mount with no verified link simply gets no entry - the detail popup
--     hides the button entirely rather than showing something dead.
--   * Keyed by the mount's in-game name exactly as the journal reports it
--     (English). Mount IDs only exist inside the running client, so they
--     can't be used as keys in a file maintained from outside the game.
--
-- Prefer guides that still reflect how the mount is obtained TODAY. Where a
-- mount was removed from the game, a historical guide is still useful for
-- context, but note it in a comment.

local addonName, addonTable = ...

addonTable.VideoLinks = {
    -- Raid drops
    ["Ashes of Al'ar"]        = "https://www.youtube.com/watch?v=z2IrQdn9Bjk",
    ["Invincible"]            = "https://www.youtube.com/watch?v=ckILZ-NxYo4",

    -- Rare spawns
    ["Time-Lost Proto-Drake"] = "https://www.youtube.com/watch?v=jEeIDZ-e6ck",

    -- Removed from the game - guide kept for reference/completionism.
    -- Brawler's Guild season 4 reward, retired in Shadowlands.
    ["Bruce"]                 = "https://www.youtube.com/watch?v=SuGTZ6M2nBg",
}
