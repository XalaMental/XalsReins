-- MountSteps.lua
-- Xal's Reins - prerequisite chains, hand-researched.
--
-- The game gives one source line per mount and nothing about what has to
-- happen BEFORE it can drop. "Zul'Aman, from Nalorakk" is useless if a quest
-- chain gates it. There is no API for prerequisites, so these are written by
-- hand - but once written, the addon checks each step against YOUR character
-- live, so it reads as a real checklist rather than a wall of text.
--
-- FORMAT
--   ["Exact in-game mount name"] = {
--       { text = "Do the thing",       questID       = 12345,
--         start = "Starts from Some NPC in Some Zone" },
--       { text = "Earn the meta",      achievementID = 4567 },
--       { text = "Hold the key",       itemID        = 89012, count = 1 },
--       { text = "Save up 5000 coins", currencyID    = 3456, amount = 5000 },
--       { text = "Reach Honored",      factionID     = 2600, reaction = 6 },
--       { text = "Kill it on Heroic" },   -- no auto-check, shown plain
--   },
--
-- AVAILABILITY (optional, for mounts only obtainable during an event)
--   ["Some Darkmoon Mount"] = {
--       availability = "Darkmoon Faire",
--       { text = "Save up 90 Darkmoon Prize Tickets" },
--   },
--   Written as a named key alongside the numbered steps. The addon checks the
--   in-game calendar to say whether that event is running right now, so no
--   dates are hardcoded and nothing drifts year to year.
--
-- RULES
--   * Steps go in the order they must be done.
--   * `questID` auto-ticks when that quest is flagged complete.
--   * `start` (optional, quest steps) - where the quest is picked up, shown as
--     a grey sub-line. The game exposes no quest giver for a quest you haven't
--     accepted, so this has to be written down. Worth adding to any quest step
--     whose name alone wouldn't tell a player where to go.
--   * `achievementID` auto-ticks when earned (account-wide).
--   * `itemID` (+ optional `count`) auto-ticks when the player holds that many,
--     counting bags, bank, reagent bank and warband bank.
--   * `currencyID` (+ optional `amount`) auto-ticks at that quantity or more.
--   * `factionID` + `reaction` auto-ticks at that standing or better.
--     Reaction levels: 1 Hated, 2 Hostile, 3 Unfriendly, 4 Neutral,
--     5 Friendly, 6 Honored, 7 Revered, 8 Exalted.
--   * A step with neither is fine - it just shows with a neutral marker
--     instead of a tick. Better an accurate untickable step than a wrong ID.
--   * Only add mounts that genuinely have prerequisites. A plain boss drop
--     needs nothing here and should not get an entry.
--   * Never guess a quest ID. An unchecked step is honest; a wrong tick tells
--     the player they've done something they haven't.
--
-- Mounts with no entry simply don't show the Steps section at all, same rule
-- as the video links.

local addonName, addonTable = ...

addonTable.MountSteps = {

    -- =================================================================
    -- MIDNIGHT  (researched 2026-08-18)
    -- Every ID below was read from a Wowhead URL; unverifiable ones are
    -- text-only by design. Sources are cited per mount.
    -- =================================================================
    ----------------------------------------------------------------------
    -- DELVES
    ----------------------------------------------------------------------

    ["Elven Arcane Guardian"] = {
        -- source: https://www.wowhead.com/guide/collections/midnight-mounts-locations-appearances
        { text = "Save up 10,000 Undercoin from Delves", currencyID = 2803, amount = 10000 },
        { text = "Buy the mount from Naleidea Rivergleam in Silvermoon City" },
    },

    ["Silvermoon's Arcane Defender"] = {
        -- source: https://www.wowhead.com/guide/collections/midnight-mounts-locations-appearances
        { text = "Reach Rank 5 on the Midnight Season 1 Delver's Journey" },
        { text = "Save up 10,000 Undercoin from Delves", currencyID = 2803, amount = 10000 },
        { text = "Buy the mount from Telemancer Astrandis in Silvermoon City" },
    },

    ["Giganto Manis"] = {
        -- source: https://www.wowhead.com/achievement=61906/glory-of-the-midnight-delver
        { text = "Earn the achievement \"Glory of the Midnight Delver\"", achievementID = 61906 },
    },

    ["Arcanovoid Construct"] = {
        -- source: https://www.wowhead.com/achievement=61799/let-me-solo-him-nullaeus
        { text = "Defeat the Season 1 Delve Nemesis Nullaeus in his lair with no other players in your party" },
        { text = "Earn the achievement \"Let Me Solo Him: Nullaeus\"", achievementID = 61799 },
    },

    ["Apophic Soul Crusher"] = {
        -- source: https://www.wowhead.com/achievement=63333/let-me-solo-him-aztarec
        { text = "Defeat the Season 2 Delve Nemesis Azta'rec in his lair with no other players in your party" },
        { text = "Earn the achievement \"Let Me Solo Him: Azta'rec\"", achievementID = 63333 },
    },

    ["Corroded Soul Crusher"] = {
        -- source: https://www.wowhead.com/guide/midnight/mounts-patch-12-1-models-locations
        { text = "Reach Rank 5 on the Season 2 Delver's Journey" },
        { text = "Buy the mount from Telemancer Astrandis in Silvermoon City" },
    },

    ----------------------------------------------------------------------
    -- PREY
    ----------------------------------------------------------------------

    ["Preyseeker's Hubris"] = {
        -- source: https://www.wowhead.com/guide/collections/midnight-mounts-locations-appearances
        { text = "Reach Rank 5 on the Midnight Season 1 Preyseeker's Journey" },
        { text = "Save up 2,000 Remnant of Anguish", currencyID = 3392, amount = 2000 },
        { text = "Buy the mount from Construct V'anore in Silvermoon City" },
    },

    ["Preyseeker's Wrath"] = {
        -- source: https://www.wowhead.com/guide/collections/midnight-mounts-locations-appearances
        { text = "Reach Rank 10 on the Midnight Season 1 Preyseeker's Journey" },
        { text = "Save up 2,000 Remnant of Anguish", currencyID = 3392, amount = 2000 },
        { text = "Buy the mount from Construct V'anore in Silvermoon City" },
    },

    ["Preyhunter's Fury"] = {
        -- source: https://www.wowhead.com/guide/midnight/mounts-patch-12-1-models-locations
        { text = "Reach Rank 10 on the Season 2 Prey Journey" },
        { text = "Save up 2,250 Remnant of Anguish", currencyID = 3392, amount = 2250 },
        { text = "Buy the mount from Construct V'anore in Silvermoon City" },
    },

    ["Preyseeker's Nightmare"] = {
        -- source: https://www.wowhead.com/achievement=42703/prey-nightmare-mode-iii
        { text = "Defeat every Prey target on Nightmare difficulty" },
        { text = "Earn the achievement \"Prey: Nightmare Mode III\"", achievementID = 42703 },
    },

    ----------------------------------------------------------------------
    -- DUNGEONS / MYTHIC+
    ----------------------------------------------------------------------

    ["Calamitous Carrion"] = {
        -- source: https://www.wowhead.com/achievement=61256/midnight-keystone-master-season-one
        { text = "Attain a Mythic+ Rating of at least 2000 during Midnight Season 1" },
        { text = "Earn the achievement \"Midnight Keystone Master: Season One\"", achievementID = 61256 },
    },

    ["Convalescent Carrion"] = {
        -- source: https://www.wowhead.com/achievement=61258/midnight-keystone-legend-season-1
        { text = "Attain a Mythic+ Rating of at least 3000 during Midnight Season 1" },
        { text = "Earn the achievement \"Midnight Keystone Legend: Season 1\"", achievementID = 61258 },
    },

    ["Breath of Blight"] = {
        -- source: https://www.wowhead.com/achievement=62447/midnight-keystone-master-season-2
        { text = "Attain a Mythic+ Rating of at least 2000 during Midnight Season 2" },
        { text = "Earn the achievement \"Midnight Keystone Master: Season 2\"", achievementID = 62447 },
    },

    ["Breath of Ruin"] = {
        -- source: https://www.wowhead.com/achievement=62449/midnight-keystone-legend-season-2
        { text = "Attain a Mythic+ Rating of at least 3000 during Midnight Season 2" },
        { text = "Earn the achievement \"Midnight Keystone Legend: Season 2\"", achievementID = 62449 },
    },

    -- The six Keystone Myth mounts below all share one unlock and one vendor.
    ["Cerulean Deathwalker"] = {
        -- source: https://www.wowhead.com/guide/midnight/mounts-patch-12-0-5-models-locations
        { text = "Earn the achievement \"Midnight Keystone Myth: Season One\"", achievementID = 63097 },
        { text = "Buy the mount from Lindormi" },
    },

    ["Amethyst Mechsuit"] = {
        -- source: https://www.wowhead.com/guide/midnight/mounts-patch-12-0-5-models-locations
        { text = "Earn the achievement \"Midnight Keystone Myth: Season One\"", achievementID = 63097 },
        { text = "Buy the mount from Lindormi" },
    },

    ["Blue-Chip Shreddertank"] = {
        -- source: https://www.wowhead.com/guide/midnight/mounts-patch-12-0-5-models-locations
        { text = "Earn the achievement \"Midnight Keystone Myth: Season One\"", achievementID = 63097 },
        { text = "Buy the mount from Lindormi" },
    },

    ["Profit-Green Shreddertank"] = {
        -- source: https://www.wowhead.com/guide/midnight/mounts-patch-12-0-5-models-locations
        { text = "Earn the achievement \"Midnight Keystone Myth: Season One\"", achievementID = 63097 },
        { text = "Buy the mount from Lindormi" },
    },

    ["High-Yield Shreddertank"] = {
        -- source: https://www.wowhead.com/guide/midnight/mounts-patch-12-0-5-models-locations
        { text = "Earn the achievement \"Midnight Keystone Myth: Season One\"", achievementID = 63097 },
        { text = "Buy the mount from Lindormi" },
    },

    ["Speculative Shreddertank"] = {
        -- source: https://www.wowhead.com/guide/midnight/mounts-patch-12-0-5-models-locations
        { text = "Earn the achievement \"Midnight Keystone Myth: Season One\"", achievementID = 63097 },
        { text = "Buy the mount from Lindormi" },
    },

    ----------------------------------------------------------------------
    -- RAIDS
    ----------------------------------------------------------------------

    ["Tenebrous Harrower"] = {
        -- source: https://www.wowhead.com/achievement=61380/glory-of-the-midnight-raider
        { text = "Complete the listed achievements in The Dreamrift, Voidspire and March on Quel'Danas" },
        { text = "Earn the achievement \"Glory of the Midnight Raider\"", achievementID = 61380 },
    },

    ["Crimson Venomfang"] = {
        -- source: https://www.wowhead.com/ptr/achievement=63254/glory-of-the-venomous-raider
        { text = "Complete the listed achievements in The Venomous Abyss" },
        { text = "Earn the achievement \"Glory of the Venomous Raider\"", achievementID = 63254 },
    },

    ["Luminous Sporeglider"] = {
        -- source: https://www.wowhead.com/guide/midnight/mounts-patch-12-0-7-models-locations
        { text = "Collect 4 Delicious Sporesnack from Rotmire in Sporefall (one per week)", itemID = 269245, count = 4 },
        { text = "Combine the four Delicious Sporesnack" },
    },

    ----------------------------------------------------------------------
    -- QUEST REWARDS
    ----------------------------------------------------------------------

    ["Relinquished Scarlet Charger"] = {
        -- source: https://www.wowhead.com/quest=86902/relinquishing-relics
        -- source: https://www.wowhead.com/quest=89193/arator  (chain opener, "The Path of Light")
        { text = "Complete the quest \"Arator\" to open the Path of Light chain", questID = 89193 },
        { text = "Complete the quest \"Relinquishing Relics\" during Arator's Journey", questID = 86902,
          start = "Starts from Alonsus Faol on the Isle of Quel'Danas" },
    },

    ["Emerald Hawkstrider"] = {
        -- source: https://www.wowhead.com/quest=88769/the-battle-of-the-bridge
        -- source: https://www.wowhead.com/quest=90746/the-elves-assemble  (quest 1 of 2)
        { text = "Complete the quest \"The Elves Assemble\"", questID = 90746 },
        { text = "Complete the quest \"The Battle of the Bridge\"", questID = 88769,
          start = "Starts from Arator in Silvermoon City" },
    },

    ["Peridot Dragonhawk"] = {
        -- source: https://www.wowhead.com/quest=90867/from-darkness-light
        -- source: Wowhead storyline "Dawn of a New Well" (quests 92689, 90876, 90861, 90862, 90867)
        { text = "Complete the quest \"A Path Forward\"", questID = 92689,
          start = "Starts from Lor'themar Theron in Silvermoon City" },
        { text = "Complete the quest \"Reluctant Hand\"", questID = 90876,
          start = "Starts from Grand Magister Rommath in Silvermoon City" },
        { text = "Complete the quest \"Those Left Behind\"", questID = 90861,
          start = "Starts from Lor'themar Theron in Silvermoon City" },
        { text = "Complete the quest \"In Times of Need\"", questID = 90862,
          start = "Starts from Arator on the Isle of Quel'Danas" },
        { text = "Complete the quest \"From Darkness, Light\"", questID = 90867,
          start = "Starts from Lady Liadrin on the Isle of Quel'Danas" },
    },

    ["Dusk Grimlynx"] = {
        -- source: https://www.wowhead.com/quest=92899/history-lesson
        -- source: Wowhead storyline "Legacy of the Amani" (92897, 92895, 92899, ...)
        { text = "Complete the quest \"The Preparations Are Complete\"", questID = 92897 },
        { text = "Complete the quest \"Hagar's Invitation\"", questID = 92895,
          start = "Starts from Orweyna in Silvermoon City" },
        { text = "Complete the quest \"History Lesson\"", questID = 92899,
          start = "Starts from Orweyna at The Den" },
    },

    ["Spirit of Tok'jara"] = {
        -- source: https://www.wowhead.com/guide/midnight/mounts-patch-12-1-models-locations
        -- source: https://www.wowhead.com/ptr/quest=96305/the-innocent-essence
        { text = "Reach Renown 10 with Zul'jarra's Forces" },
        { text = "Complete the time-gated questline from Du'gal beginning with \"Ancestral Gems\"" },
        { text = "Complete the quest \"The Innocent Essence\"", questID = 96305 },
    },

    ["Echo of Aln'sharan"] = {
        -- source: https://www.wowhead.com/guide/collections/midnight-mounts-locations-appearances
        -- source: https://www.wowhead.com/quest=90467/tales-of-the-sky
        -- "Tales of the Sky" is itself the opener of the Legend of Aln'sharan storyline.
        { text = "Complete the quest \"Tales of the Sky\" in Harandar", questID = 90467,
          start = "Starts from Kuri in Harandar" },
        { text = "Finish the rest of the Legend of Aln'sharan questline" },
        { text = "Collect and turn in 500 Mysterious Skyshard to Kuri in Harandar" },
        { text = "Approach Aln'sharan above Har'kuai to claim the mount" },
    },

    ----------------------------------------------------------------------
    -- EXPLORATION ACHIEVEMENTS
    ----------------------------------------------------------------------

    ["Crimson Dragonhawk"] = {
        -- source: https://www.wowhead.com/achievement=61584/midnight-glyph-hunter
        { text = "Collect every Skyriding Glyph in Quel'Thalas and the adjacent Midnight zones" },
        { text = "Earn the achievement \"Midnight Glyph Hunter\"", achievementID = 61584 },
    },

    ["Vivacious Chloroceros"] = {
        -- source: https://www.wowhead.com/achievement=61263/treasures-of-harandar
        { text = "Earn the achievement \"Treasures of Harandar\"", achievementID = 61263 },
    },

    ["Brilliant Petalwing"] = {
        -- source: https://www.wowhead.com/achievement=62386/light-up-the-night
        { text = "Earn the achievement \"Light Up the Night\"", achievementID = 62386 },
    },

    ["Ivory Grimlynx"] = {
        -- source: https://www.wowhead.com/achievement=61506/allied-race-haranir
        { text = "Complete the Midnight storylines that unlock the Haranir allied race" },
        { text = "Earn the achievement \"Allied Race: Haranir\"", achievementID = 61506 },
    },

    ["Auriferous Venomfang"] = {
        -- source: https://www.wowhead.com/achievement=63359/treasures-of-the-coiled-isle
        { text = "Earn the achievement \"Treasures of the Coiled Isle\"", achievementID = 63359 },
    },

    ["Emerald Skyfang"] = {
        -- source: https://www.wowhead.com/ptr/achievement=63653/pro-poison-patroller
        { text = "Complete 250 patrols within the Vaults of Atal'Utek" },
        { text = "Earn the achievement \"Pro Poison Patroller\"", achievementID = 63653 },
    },

    ["Venomous Coiler"] = {
        -- source: https://www.wowhead.com/achievement=63630/assault-the-vault
        { text = "Complete the listed Vaults of Atal'Utek achievements" },
        { text = "Earn the achievement \"Assault the Vault\"", achievementID = 63630 },
    },

    ----------------------------------------------------------------------
    -- COLLECTION / ACCUMULATION GATES
    ----------------------------------------------------------------------

    ["Vivid Chloroceros"] = {
        -- source: https://www.wowhead.com/guide/collections/midnight-mounts-locations-appearances
        { text = "Capture 50 Glowing Moths in Harandar" },
        { text = "Save up 10 Luminous Dust", currencyID = 3385, amount = 10 },
        { text = "Buy the mount from Mothkeeper Wew'tam in Harandar" },
    },

    ["Elder Glowmite"] = {
        -- source: https://www.wowhead.com/guide/collections/midnight-mounts-locations-appearances
        { text = "Capture 120 Glowing Moths in Harandar" },
        { text = "Save up 10 Luminous Dust", currencyID = 3385, amount = 10 },
        { text = "Buy the mount from Mothkeeper Wew'tam in Harandar" },
    },

    ["Ancestral War Bear"] = {
        -- source: https://www.wowhead.com/guide/collections/midnight-mounts-locations-appearances
        { text = "Interact once with the Honored Warrior's Cache in Zul'Aman" },
        { text = "Search the four urns across Zul'Aman and kill each guardian they spawn" },
        { text = "Loot the key item from all four guardians" },
        { text = "Return to the Honored Warrior's Cache and open it" },
    },

    ["Hexed Vilefeather Eagle"] = {
        -- source: https://www.wowhead.com/guide/collections/midnight-mounts-locations-appearances
        { text = "Collect 1,000 Vile Essence from the mobs beside the treasure in Zul'Aman" },
        { text = "Open the Abandoned Ritual Skull treasure" },
    },

    ["Ruddy Sporeglider"] = {
        -- source: https://www.wowhead.com/guide/collections/midnight-mounts-locations-appearances
        { text = "Collect 150 Crystalized Resin Fragment from Flame-Hardened Sap of Teldrassil in Harandar" },
        { text = "Open the Peculiar Cauldron treasure" },
    },

    ["Witherbark Warbear Mother"] = {
        -- source: https://www.wowhead.com/guide/midnight/mounts-patch-12-0-5-models-locations
        { text = "Use Practically Pork on the Lost Bear Cub at the Broken Throne ritual site to acquire Chubs" },
        { text = "Summon Chubs at the meat piles to spawn the Angry Amani Warbear, then defeat it" },
        { text = "Use 5 more Practically Pork to claim the mount" },
    },

    ["Void-Corrupted Lynx"] = {
        -- source: https://www.wowhead.com/guide/midnight/mounts-patch-12-0-5-models-locations
        { text = "Learn the Rope Lynx Harness pattern from Ritual Sites treasures or rare spoils" },
        { text = "Obtain a Broken Lynx Leash from Ritual Sites" },
        { text = "Have a Leatherworker craft the Rope Lynx Harness" },
    },

    ----------------------------------------------------------------------
    -- RENOWN VENDORS
    ----------------------------------------------------------------------

    ["Crimson Silvermoon Hawkstrider"] = {
        -- source: https://www.wowhead.com/news/every-new-mount-that-can-be-earned-from-faction-renown-in-midnight-380535
        { text = "Reach Renown 17 with the Silvermoon Court" },
        { text = "Save up 6,000 Voidlight Marl", currencyID = 3316, amount = 6000 },
        { text = "Buy the mount from Caeris Fairdawn in Eversong Woods" },
    },

    ["Fiery Dragonhawk"] = {
        -- source: https://www.wowhead.com/news/every-new-mount-that-can-be-earned-from-faction-renown-in-midnight-380535
        { text = "Reach Renown 19 with the Silvermoon Court" },
        { text = "Save up 8,000 Voidlight Marl", currencyID = 3316, amount = 8000 },
        { text = "Buy the mount from Caeris Fairdawn in Eversong Woods" },
    },

    ["Amani Blessed Bear"] = {
        -- source: https://www.wowhead.com/news/every-new-mount-that-can-be-earned-from-faction-renown-in-midnight-380535
        { text = "Reach Renown 17 with the Amani Tribe" },
        { text = "Save up 6,000 Voidlight Marl", currencyID = 3316, amount = 6000 },
        { text = "Buy the mount from Magovu in Zul'Aman" },
    },

    ["Amani Windcaller"] = {
        -- source: https://www.wowhead.com/news/every-new-mount-that-can-be-earned-from-faction-renown-in-midnight-380535
        { text = "Reach Renown 19 with the Amani Tribe" },
        { text = "Save up 8,000 Voidlight Marl", currencyID = 3316, amount = 8000 },
        { text = "Buy the mount from Magovu in Zul'Aman" },
    },

    ["Fierce Grimlynx"] = {
        -- source: https://www.wowhead.com/news/every-new-mount-that-can-be-earned-from-faction-renown-in-midnight-380535
        -- NOTE: Wowhead's news post and mount-guide body both say Renown 16;
        -- the summary table on the same guide page says 17. Text kept vague-safe at 16.
        { text = "Reach Renown 16 with the Hara'ti" },
        { text = "Save up 6,000 Voidlight Marl", currencyID = 3316, amount = 6000 },
        { text = "Buy the mount from Naynar in Harandar" },
    },

    ["Cerulean Sporeglider"] = {
        -- source: https://www.wowhead.com/news/every-new-mount-that-can-be-earned-from-faction-renown-in-midnight-380535
        { text = "Reach Renown 19 with the Hara'ti" },
        { text = "Save up 8,000 Voidlight Marl", currencyID = 3316, amount = 8000 },
        { text = "Buy the mount from Naynar in Harandar" },
    },

    ["Ravenous Shredclaw"] = {
        -- source: https://www.wowhead.com/news/every-new-mount-that-can-be-earned-from-faction-renown-in-midnight-380535
        { text = "Reach Renown 17 with The Singularity" },
        { text = "Save up 6,000 Voidlight Marl", currencyID = 3316, amount = 6000 },
        { text = "Buy the mount from Void Researcher Anomander in Voidstorm" },
    },

    ["Voidbound Stormray"] = {
        -- source: https://www.wowhead.com/news/every-new-mount-that-can-be-earned-from-faction-renown-in-midnight-380535
        { text = "Reach Renown 19 with The Singularity" },
        { text = "Save up 8,000 Voidlight Marl", currencyID = 3316, amount = 8000 },
        { text = "Buy the mount from Void Researcher Anomander in Voidstorm" },
    },

    ["Indigo Coiled Horror"] = {
        -- source: https://www.wowhead.com/guide/midnight/mounts-patch-12-1-models-locations
        { text = "Reach Renown 17 with Zul'jarra's Forces" },
        { text = "Save up 6,000 Voidlight Marl", currencyID = 3316, amount = 6000 },
        { text = "Buy the mount from Jan'sari the Watchful on the Coiled Isle" },
    },

    ["Violet-Backed Skyfang"] = {
        -- source: https://www.wowhead.com/guide/midnight/mounts-patch-12-1-models-locations
        { text = "Reach Renown 19 with Zul'jarra's Forces" },
        { text = "Save up 8,000 Voidlight Marl", currencyID = 3316, amount = 8000 },
        { text = "Buy the mount from Jan'sari the Watchful on the Coiled Isle" },
    },

    ["Sea-Dwelling Isle Serpent"] = {
        -- source: https://www.wowhead.com/guide/midnight/mounts-patch-12-1-models-locations
        { text = "Earn standing with Captain Tokka's Bloodsworn Crew" },
        { text = "Buy the mount from Second Mate Sluggs on the Coiled Isle for 2,500" },
    },

    ["Caustic Venomfang"] = {
        -- source: https://www.wowhead.com/guide/midnight/mounts-patch-12-1-models-locations
        { text = "Save up 10,000 currency from the Coiled Isle" },
        { text = "Buy the mount from the Skull of Er'inye" },
    },

    -- NOT IN THE JOURNAL as of 2026-08-18 (checked live: 12 hawkstriders on the
    -- account, none void). Unreleased 12.1 content, so the name can't be
    -- verified yet - research picked "Void-Corrupted" (spell 1282936) over
    -- "Void-Touched", which two sites use but which is the ITEM name (268578).
    -- Harmless while absent: no journal entry means no steps shown. Recheck the
    -- name once the mount actually ships.
    ["Void-Corrupted Hawkstrider"] = {
        -- source: https://www.wowhead.com/guide/midnight/mounts-patch-12-0-5-models-locations
        -- NOTE: the ITEM is named "Void-Touched Hawkstrider" (item 268578);
        -- the mount/spell is "Void-Corrupted Hawkstrider" (spell 1282936).
        { text = "Reach Ritual Sites Renown Rank 8" },
        { text = "Buy the mount from Sergeant Vornin for 4,500" },
    },

    ["Lab-Grown Stormray"] = {
        -- source: https://www.wowhead.com/achievement=62385/staring-into-the-void
        { text = "Earn Renown with The Singularity to access the Void Research Console" },
        { text = "Spend Uncontaminated Void Sample to fully unlock the Research Console in Voidstorm" },
        { text = "Earn the achievement \"Staring Into The Void\"", achievementID = 62385 },
    },

    ["Unbound Manawyrm"] = {
        -- source: https://www.wowhead.com/guide/midnight/mounts-patch-12-0-5-models-locations
        { text = "Earn the achievement \"Void Response Team\"", achievementID = 62563 },
        { text = "Earn the achievement \"Ritual Site Disruptor\"", achievementID = 62562 },
        { text = "Save up 6,000 Voidlight Marl", currencyID = 3316, amount = 6000 },
        { text = "Buy the mount from Sergeant Vornin" },
    },

    ----------------------------------------------------------------------
    -- CLASSIC REPUTATION (Slayer's Duellum)
    ----------------------------------------------------------------------

    ["Frenzied Shredclaw"] = {
        -- source: https://www.wowhead.com/guide/collections/midnight-mounts-locations-appearances
        -- source: https://www.wowhead.com/faction=2770/slayers-duellum
        { text = "Reach Exalted with the Slayer's Duellum", factionID = 2770, reaction = 8 },
        { text = "Save up 6,000 Voidlight Marl", currencyID = 3316, amount = 6000 },
        { text = "Buy the mount from Thraxadar in Voidstorm" },
    },

    ["Prowling Shredclaw"] = {
        -- source: https://www.wowhead.com/guide/collections/midnight-mounts-locations-appearances
        -- source: https://www.wowhead.com/faction=2770/slayers-duellum
        { text = "Reach Exalted with the Slayer's Duellum", factionID = 2770, reaction = 8 },
        { text = "Save up 6,000 Voidlight Marl", currencyID = 3316, amount = 6000 },
        { text = "Buy the mount from Thraxadar in Voidstorm" },
    },

    ["Duskbrute Harrower"] = {
        -- source: https://www.wowhead.com/guide/collections/midnight-mounts-locations-appearances
        { text = "Reach Exalted with the Slayer's Duellum", factionID = 2770, reaction = 8 },
        { text = "Keep earning reputation to fill a Paragon bar and claim a Slayer's Duellum Trove" },
        { text = "Open Slayer's Duellum Troves until the mount drops" },
    },

    ["Umbral Dragonhawk"] = {
        -- source: https://www.wowhead.com/achievement=62190/life-of-the-party
        { text = "Reach maximum reputation with each Silvermoon Court sub-faction in Eversong Woods" },
        { text = "Earn the achievement \"Life of the Party\"", achievementID = 62190 },
    },

    ----------------------------------------------------------------------
    -- WORLD EVENTS
    ----------------------------------------------------------------------

    ["Amani Sunfeather"] = {
        -- source: https://www.wowhead.com/guide/collections/midnight-mounts-locations-appearances
        { text = "Save up 1,600 Unalloyed Abundance from the Abundance world event", currencyID = 3377, amount = 1600 },
        { text = "Buy the mount from Chel the Chip at an Abundance cavern entrance" },
    },

    ["Blessed Amani Burrower"] = {
        -- source: https://www.wowhead.com/guide/collections/midnight-mounts-locations-appearances
        { text = "Save up 1,600 Unalloyed Abundance from the Abundance world event", currencyID = 3377, amount = 1600 },
        { text = "Buy the mount from Chel the Chip at an Abundance cavern entrance" },
    },

    ["Netherforged Nullframe"] = {
        -- source: https://www.wowhead.com/guide/midnight/mounts-patch-12-0-7-models-locations
        { text = "Earn the achievement \"A Trip Through the Stars\" in Naigtal", achievementID = 62874 },
        { text = "Buy the mount from the Naigtal vendor for 15" },
    },

    ["Voidmancer's Starcarver"] = {
        -- source: https://www.wowhead.com/guide/midnight/mounts-patch-12-0-7-models-locations
        { text = "Earn the achievement \"A Trip Around the Stars\" in Val", achievementID = 62873 },
        { text = "Buy the mount from the Val vendor for 15" },
    },

    ["Tortured Gorger"] = {
        -- source: https://www.wowhead.com/guide/midnight/mounts-patch-12-0-7-models-locations
        { text = "Earn the achievement \"Heroic Showdowns\" in Val and Naigtal", achievementID = 63264 },
        { text = "Buy the mount from the Showdown vendor for 15" },
    },

    ["Spawn of Vyranoth"] = {
        -- source: https://www.wowhead.com/achievement=61463/master-of-the-turbulent-timeways-v
        { text = "Gain Mastery of the Timeways for 4 weeks during Turbulent Timeways V" },
        { text = "Earn the achievement \"Master of the Turbulent Timeways V\"", achievementID = 61463 },
    },

    ----------------------------------------------------------------------
    -- PRE-PATCH EVENT (Twilight Ascension)
    ----------------------------------------------------------------------

    ["Light-Forged Mechsuit"] = {
        -- source: https://www.wowhead.com/achievement=42300/two-minutes-to-midnight
        { text = "Defeat every rare summoned by the Twilight's Blade in the Twilight Highlands" },
        { text = "Earn the achievement \"Two Minutes to Midnight\"", achievementID = 42300 },
    },

    ["Retrained Skyrazor"] = {
        -- source: https://www.wowhead.com/guide/collections/midnight-mounts-locations-appearances
        { text = "Collect 100 Twilight's Blade Insignia during the Twilight Ascension pre-patch event" },
        { text = "Buy the mount from Materialist Ophinell in the Twilight Highlands" },
    },

    ----------------------------------------------------------------------
    -- PVP
    ----------------------------------------------------------------------

    ["Galactic Gladiator's Goredrake"] = {
        -- source: https://www.wowhead.com/achievement=61188/gladiator-midnight-season-1
        { text = "Win 50 3v3 Arena games while at Elite rank (2400+) during Midnight Season 1" },
        { text = "Earn the achievement \"Gladiator: Midnight Season 1\"", achievementID = 61188 },
    },

    ["Venomous Gladiator's Goredrake"] = {
        -- source: https://www.wowhead.com/achievement=62930/gladiator-midnight-season-2
        { text = "Win 50 3v3 Arena games while at Elite rank during Midnight Season 2" },
        { text = "Earn the achievement \"Gladiator: Midnight Season 2\"", achievementID = 62930 },
    },

    ["Vicious Snaplizard"] = {
        -- source: https://www.wowhead.com/guide/collections/midnight-mounts-locations-appearances
        { text = "Reach Combatant rank (1000+ rating) in rated PvP during Midnight Season 1" },
        { text = "Win enough rated Arena, Solo Shuffle or Rated Battleground games to claim the seasonal mount" },
    },

    ["Vicious Lightbloom Boar"] = {
        -- source: https://www.wowhead.com/guide/midnight/mounts-patch-12-1-models-locations
        { text = "Reach 1000+ rating in rated PvP during Midnight Season 2" },
        { text = "Win enough rated games to earn the Venomous Combatant achievement for your faction" },
    },

    -- =================================================================
    -- THE WAR WITHIN  (researched 2026-08-18)
    -- Every ID double-verified: read from a Wowhead URL, then the URL
    -- re-fetched to confirm it returns the expected name.
    -- =================================================================
    ----------------------------------------------------------------------
    -- DELVES
    ----------------------------------------------------------------------

    ["Ivory Goliathus"] = {
        -- source: https://www.wowhead.com/achievement=40438/glory-of-the-delver
        -- NOTE: the achievement's real name is "Glory of the War Within Delver".
        { text = "Earn the achievement \"Glory of the War Within Delver\"", achievementID = 40438 },
    },

    ["Delver's Dirigible"] = {
        -- source: https://www.wowhead.com/quest=81514/bountiful-delves
        -- source: https://www.wowhead.com/quest=81510/ship-it
        { text = "Complete the quest \"Bountiful Delves\" for Brann Bronzebeard", questID = 81514,
          start = "Starts from Brann Bronzebeard at the Delver's Headquarters in Dornogal" },
        { text = "Complete the follow-up quest \"Ship It!\"",                    questID = 81510,
          start = "Starts from Brann Bronzebeard at the Delver's Headquarters in Dornogal" },
    },

    ["Delver's Gob-Trotter"] = {
        -- source: https://www.warcraftmounts.com/mounts/delversgobtrotter.php
        -- questID for "I Want My Hat Back" could not be verified.
        { text = "Complete the Season 2 delve quest \"I Want My Hat Back\" from Brann Bronzebeard in Dornogal" },
    },

    ["Delver's Mana-Skimmer"] = {
        -- source: https://www.warcraftmounts.com/mounts/delversmanaskimmer.php
        -- questID for "Repossessed!" could not be verified.
        { text = "Complete the Season 3 delve quest \"Repossessed!\" from Brann Bronzebeard in Dornogal" },
    },

    ["OC91 Chariot"] = {
        -- source: https://www.wowhead.com/achievement=42212 (Titan Console Overcharged)
        -- Overcharged Delves were retired in 11.2; the mount then moved to
        -- Sir Finley Mrrgglton for 15,000 Undercoin. Undercoin currencyID not
        -- verified in this pass, so that route is left as plain text.
        { text = "Collect 1,700 Titan Disc Shards from Overcharged Delves" },
        { text = "Unlock all 17 skills in the Overcharged Titan Console" },
        { text = "Earn the achievement \"Titan Console Overcharged\"", achievementID = 42212 },
    },

    ----------------------------------------------------------------------
    -- RAIDS
    ----------------------------------------------------------------------

    ["Shadowed Swarmite"] = {
        -- source: https://www.wowhead.com/achievement=40232 (Glory of the Nerub-ar Raider)
        { text = "Earn the meta achievement \"Glory of the Nerub-ar Raider\"", achievementID = 40232 },
    },

    ["Junkmaestro's Magnetomech"] = {
        -- source: https://www.wowhead.com/achievement=41286
        { text = "Earn the meta achievement \"Glory of the Liberation of Undermine Raider\"", achievementID = 41286 },
    },

    ["Umbral K'arroc"] = {
        -- source: https://www.wowhead.com/achievement=41597 (Glory of the Omega Raider)
        { text = "Earn the meta achievement \"Glory of the Omega Raider\"", achievementID = 41597 },
    },

    ["Royal Voidwing"] = {
        -- source: https://www.wowhead.com/quest=91413 (A Twilight Oath's End)
        -- Time-limited: the quest-starter stops dropping once the tier closes.
        { text = "Defeat Dimensius, the All-Devouring in Manaforge Omega on Heroic or Mythic" },
        { text = "Loot \"Mark of the Twilight Oath\" from his corpse" },
        { text = "Complete the quest \"A Twilight Oath's End\" for Ve'nari in The Oasis", questID = 91413 },
    },

    ----------------------------------------------------------------------
    -- MYTHIC+
    ----------------------------------------------------------------------

    ["Diamond Mechsuit"] = {
        -- source: https://www.wowhead.com/achievement=20525
        { text = "Reach Mythic+ Rating 2000 during The War Within Season 1" },
        { text = "Earn the achievement \"The War Within Keystone Master: Season One\"", achievementID = 20525 },
    },

    ["Azure Void Flyer"] = {
        -- source: https://www.wowhead.com/achievement=41973
        { text = "Reach Mythic+ Rating 2000 during The War Within Season 3" },
        { text = "Earn the achievement \"The War Within Keystone Master: Season Three\"", achievementID = 41973 },
    },

    ["Scarlet Void Flyer"] = {
        -- source: https://www.wowhead.com/achievement=42172
        { text = "Reach Mythic+ Rating 3000 during The War Within Season 3" },
        { text = "Earn the achievement \"The War Within Keystone Legend: Season Three\"", achievementID = 42172 },
    },

    ----------------------------------------------------------------------
    -- EXPLORATION AND META ACHIEVEMENTS
    ----------------------------------------------------------------------

    ["Swarmite Skyhunter"] = {
        -- source: https://www.wowhead.com/achievement=40702 (Khaz Algar Glyph Hunter)
        { text = "Find every skyriding glyph in Isle of Dorn, The Ringing Deeps, Hallowfall and Azj-Kahet" },
        { text = "Earn the achievement \"Khaz Algar Glyph Hunter\"", achievementID = 40702 },
    },

    ["Shadow of Doubt"] = {
        -- source: https://www.wowhead.com/achievement=41201 (You Xal Not Pass)
        { text = "Earn the meta achievement \"You Xal Not Pass\"", achievementID = 41201 },
    },

    ["The Breaker's Song"] = {
        -- source: https://www.wowhead.com/achievement=41133 (Isle Remember You)
        { text = "Earn the meta achievement \"Isle Remember You\" on Siren Isle", achievementID = 41133 },
    },

    ["Geargrinder Mk. 11"] = {
        -- source: https://www.wowhead.com/achievement=61451 (Worldsoul-Searching)
        -- Added in patch 11.2.7 as the full War Within expansion meta.
        { text = "Earn the expansion meta achievement \"Worldsoul-Searching\"", achievementID = 61451 },
    },

    ["Ny'alothan Shadow Worm"] = {
        -- source: https://www.wowhead.com/achievement=41966 (Mastering the Visions)
        { text = "Clear Horrific Visions Revisited with all eight masks active in both Stormwind and Orgrimmar" },
        { text = "Earn the achievement \"Mastering the Visions\"", achievementID = 41966 },
    },

    ["Terror of the Night"] = {
        -- source: https://www.wowhead.com/achievement=41980 (Vigilante)
        { text = "Reach Renown 3 with The K'aresh Trust to unlock Warrants" },
        { text = "Complete every Warrant on K'aresh" },
        { text = "Earn the achievement \"Vigilante\"", achievementID = 41980 },
    },

    ["Phase-Lost Slateback"] = {
        -- source: https://www.wowhead.com/achievement=61017/phase-lost-and-found
        { text = "Unlock Phase Diving with the Reshii Wraps on K'aresh" },
        { text = "Upgrade the Reshii Wraps to Rank 3 (\"Orbs of Power\")" },
        { text = "Collect every Phase-Lost appearance from phase orbs" },
        { text = "Earn the achievement \"Phase-Lost-and-Found\"", achievementID = 61017 },
    },

    ["Slatestone Ramolith"] = {
        -- source: https://www.wowhead.com/achievement=40307 (Allied Races: Earthen)
        { text = "Complete The War Within campaign" },
        { text = "Complete the \"Mourning Rise\", \"Broken Tools\" and \"Merrix and Steelvein\" questlines" },
        { text = "Earn the achievement \"Allied Races: Earthen\"", achievementID = 40307 },
    },

    ["Earthen Ordinant's Ramolith"] = {
        -- source: https://warcraft.wiki.gg/wiki/Earthen_Ordinant%27s_Ramolith
        { text = "Unlock the Earthen allied race", achievementID = 40307 },
        { text = "Create an Earthen Paladin and reach level 10" },
    },

    ["Coldflame Tempest"] = {
        -- source: https://www.wowhead.com/achievement=40976 (A Cool Twenty Years)
        -- Only completable while the WoW Anniversary event is running.
        { text = "Earn \"A Cool Twenty Years\" during the WoW Anniversary event", achievementID = 40976 },
    },

    ----------------------------------------------------------------------
    -- QUEST CHAINS
    ----------------------------------------------------------------------

    ["Siesbarg"] = {
        -- source: https://www.wowhead.com/quest=83722/consolation-flies
        -- 83627 is started by the vial Tka'ktath drops, so it has no quest giver.
        { text = "Defeat the rare Tka'ktath in Azj-Kahet and loot the vial he drops" },
        { text = "Complete the quest \"The Beginning of Something Beautiful\"", questID = 83627 },
        { text = "Complete the quest \"Those Are Chitin Words\" (1,500 Nerubian Chitin)", questID = 83719,
          start = "Starts from Shalba in the City of Threads, Azj-Kahet" },
        { text = "Complete the quest \"Venom? More Like Get 'Em\" (1,000 Nerubian Venom)", questID = 83720,
          start = "Starts from Shalba in the City of Threads, Azj-Kahet" },
        { text = "Complete the quest \"A Small Ocean's Worth of Blood\" (500 Nerubian Blood)", questID = 83721,
          start = "Starts from Shalba in the City of Threads, Azj-Kahet" },
        { text = "Complete the quest \"Witnessing Brilliance\"", questID = 84246,
          start = "Starts from Shalba in the City of Threads, Azj-Kahet" },
        { text = "Complete the quest \"Consolation Flies\" for Shalba", questID = 83722,
          start = "Starts from Shalba in the City of Threads, Azj-Kahet" },
    },

    ["Thrayir, Eyes of the Siren"] = {
        -- source: https://www.wowhead.com/quest=85811
        { text = "Collect the five Runekeys from Siren Isle rares, fishing and activities" },
        { text = "During a storm, activate all five runestones at the Forgotten Vault" },
        { text = "Complete the quest \"Thrayir, Eyes of the Siren\"", questID = 85811 },
    },

    ["Prismatic Snapdragon"] = {
        -- source: https://www.wowhead.com/quest=86482/a-lifeline
        -- source: https://www.wowhead.com/quest=86485/a-loyal-friend
        { text = "Find the Starving Snapdragon Runt on Siren Isle and complete \"A Lifeline\"", questID = 86482,
          start = "Starts from the Starving Snapdragon Runt on Siren Isle" },
        { text = "Complete the daily \"Hungry, Hungry Snapdragon\" until the runt matures" },
        { text = "Complete the quest \"A Loyal Friend\"", questID = 86485,
          start = "Starts from the Mature Prismatic Snapdragon on Siren Isle" },
    },

    ["Resplendent K'arroc"] = {
        -- source: https://www.wowhead.com/quest=88976/the-hope-of-karesh
        -- source: https://www.wowhead.com/quest=88974/eco-stability  (quest 1 of the "A Thriving Eco-System" storyline)
        { text = "Complete the Ghosts of K'aresh campaign chapter \"Shadows En Garde\"" },
        { text = "Fully integrate all seven Oasis species", achievementID = 41811 },
        { text = "Complete the quest \"Eco-Stability\"", questID = 88974 },
        { text = "Complete the quest \"The Hope of K'aresh\" for Ve'nari",  questID = 88976,
          start = "Starts from Ve'nari in The Oasis, K'aresh" },
    },

    ["K'arroc Swiftwing"] = {
        -- source: https://www.wowhead.com/quest=85213/off-to-tazavesh-again
        -- source: https://www.wowhead.com/quest=85011  (opener of the "A Meeting with Minn'da" storyline)
        { text = "Complete the Midnight Prologue questline on K'aresh" },
        { text = "Start it with \"Where in K'aresh is Alleria Windrunner?\"", questID = 85011,
          start = "Starts from Arator in Tazavesh, the Veiled Market" },
        { text = "Complete the quest \"Off to Tazavesh, Again\" for Ve'nari", questID = 85213,
          start = "Starts from Arator on K'aresh" },
    },

    ["Blue Barry"] = {
        -- source: https://www.wowhead.com/quest=90769/a-blue-for-you
        -- source: Wowhead storyline "Ba'eth's Request" (90663, 90729, 90747, 90773, 90770, 90769)
        { text = "Reach Renown 9 with The K'aresh Trust to unlock \"Ba'eth's Request\"" },
        { text = "Complete the quest \"Stealing What is Ours\"", questID = 90663,
          start = "Starts from Ba'eth in Tazavesh, the Veiled Market" },
        { text = "Complete the quest \"Win-Win Situation\"", questID = 90729,
          start = "Starts from Ba'eth in Tazavesh, the Veiled Market" },
        { text = "Complete the quest \"The Wrong Bluecephalus\"", questID = 90747,
          start = "Starts from Xy'dax in Tazavesh, the Veiled Market" },
        { text = "Complete the quest \"Meat My Business\"", questID = 90773,
          start = "Starts from Chef Xy'Zin in Tazavesh, the Veiled Market" },
        { text = "Complete the quest \"The Grift\"", questID = 90770,
          start = "Starts from Griftah in Tazavesh, the Veiled Market" },
        { text = "Work through the daily-gated chain over the following days" },
        { text = "Complete the quest \"A Blue for You\" for Griftah",  questID = 90769,
          start = "Starts from Griftah in Tazavesh, the Veiled Market" },
    },

    ["The Bone Freezer"] = {
        -- source: https://www.wowhead.com/quest=91954/freezing-over
        { text = "Reach Renown 14 with the Manaforge Vandals by running Manaforge Omega" },
        { text = "Complete the quest \"Freezing Over\" at Shadow Point, K'aresh", questID = 91954,
          start = "Starts from Zo'turu at Shadow Point, K'aresh" },
    },

    ["Xy Trustee's Gearglider"] = {
        -- source: https://www.wowhead.com/quest=92082/someone-like-me
        { text = "Reach Renown 8 with the Manaforge Vandals" },
        { text = "Obtain the scribe-made buffs Deal: Cartel Ba, Deal: Cartel Zo and Deal: Cartel Om" },
        { text = "Loot all three cartel Dead Drops inside Manaforge Omega, one per buff" },
        { text = "Complete the quest \"Someone Like Me\"", questID = 92082,
          start = "Starts from Zo'turu in K'aresh" },
    },

    ["Incognitro, the Indecipherable Felcycle"] = {
        -- source: https://www.warcraftmounts.com/twwmounts.php
        -- Secret questline; individual step IDs not verifiable.
        { text = "Complete the hidden \"Ratts' Revenge\" questline" },
    },

    ----------------------------------------------------------------------
    -- RENOWN AND REPUTATION VENDORS
    ----------------------------------------------------------------------

    ["Shale Ramolith"] = {
        -- source: https://www.wowhead.com/item=223571/shale-ramolith
        { text = "Reach Renown 18 with the Council of Dornogal" },
        { text = "Save up 8,125 Resonance Crystals", currencyID = 2815, amount = 8125 },
        { text = "Buy the mount from Auditor Balwurz in Dornogal" },
    },

    ["Smoldering Cinderbee"] = {
        -- source: https://www.wowhead.com/item=221753/smoldering-cinderbee
        { text = "Reach Renown 23 with the Council of Dornogal" },
        { text = "Save up 11,375 Resonance Crystals", currencyID = 2815, amount = 11375 },
        { text = "Buy the mount from Auditor Balwurz in Dornogal" },
    },

    ["Crimson Mudnose"] = {
        -- source: https://www.wowhead.com/item=223505/crimson-mudnose
        { text = "Reach Renown 19 with The Assembly of the Deeps" },
        { text = "Save up 8,125 Resonance Crystals", currencyID = 2815, amount = 8125 },
        { text = "Buy the mount from Waxmonger Squick in Gundargaz" },
    },

    ["Cyan Glowmite"] = {
        -- source: https://www.wowhead.com/item=222989/cyan-glowmite
        { text = "Reach Renown 23 with The Assembly of the Deeps" },
        { text = "Save up 11,375 Resonance Crystals", currencyID = 2815, amount = 11375 },
        { text = "Buy the mount from Waxmonger Squick in Gundargaz" },
    },

    ["Vermillion Imperial Lynx"] = {
        -- source: https://www.wowhead.com/item=223317/vermillion-imperial-lynx
        { text = "Reach Renown 21 with the Hallowfall Arathi" },
        { text = "Save up 8,125 Resonance Crystals", currencyID = 2815, amount = 8125 },
        { text = "Buy the mount from Auralia Steelstrike in Mereldar" },
    },

    ["Shackled Shadow"] = {
        -- source: https://www.wowhead.com/item=223314/shackled-shadow
        { text = "Reach Renown 23 with the Hallowfall Arathi" },
        { text = "Save up 11,375 Resonance Crystals", currencyID = 2815, amount = 11375 },
        { text = "Buy the mount from Auralia Steelstrike in Mereldar" },
    },

    ["Ferocious Jawcrawler"] = {
        -- source: https://www.wowhead.com/item=223274/ferocious-jawcrawler
        -- Renown level: warcraftmounts and Icy Veins say 22, one wiki page says 23.
        { text = "Reach Renown 22 with The Severed Threads" },
        { text = "Save up 2,815 Kej", currencyID = 3056, amount = 2815 },
        { text = "Buy the mount from Lady Vinazian in the Weaver's Lair" },
    },

    ["Aquamarine Swarmite"] = {
        -- source: https://www.wowhead.com/item=223264/aquamarine-swarmite
        { text = "Reach Renown 23 with The Severed Threads" },
        { text = "Save up 3,940 Kej", currencyID = 3056, amount = 3940 },
        { text = "Buy the mount from Lady Vinazian in the Weaver's Lair" },
    },

    ["Widow's Undercrawler"] = {
        -- source: https://www.wowhead.com/item=223276/widows-undercrawler
        { text = "Reach Conspirator standing with The Weaver in Azj-Kahet" },
        { text = "Save up 2,020 Kej", currencyID = 3056, amount = 2020 },
        { text = "Buy the mount from a Severed Threads vendor in Azj-Kahet" },
    },

    ["Heritage Undercrawler"] = {
        -- source: https://www.wowhead.com/item=223278/heritage-undercrawler
        { text = "Reach Conspirator standing with The General in Azj-Kahet" },
        { text = "Save up 2,020 Kej", currencyID = 3056, amount = 2020 },
        { text = "Buy the mount from a Severed Threads vendor in Azj-Kahet" },
    },

    ["Royal Court Undercrawler"] = {
        -- source: https://www.wowhead.com/item=223279/royal-court-undercrawler
        { text = "Reach Conspirator standing with The Vizier in Azj-Kahet" },
        { text = "Save up 2,020 Kej", currencyID = 3056, amount = 2020 },
        { text = "Buy the mount from a Severed Threads vendor in Azj-Kahet" },
    },

    ["Radiant Imperial Lynx"] = {
        -- source: https://www.warcraftmounts.com/mounts/radiantimperiallynx.php
        { text = "Reach Renown 9 with Flame's Radiance in Hallowfall" },
        { text = "Save up 8,125 Resonance Crystals", currencyID = 2815, amount = 8125 },
        { text = "Buy the mount from Lars Bronsmaelt at Morgaen's Tears" },
    },

    ["Violet Armored Growler"] = {
        -- source: https://www.warcraftmounts.com/mounts/violetarmoredgrowler.php
        { text = "Reach Renown 15 with The Cartels of Undermine" },
        { text = "Save up 8,125 Resonance Crystals", currencyID = 2815, amount = 8125 },
        { text = "Buy the mount from Smaks Topskimmer in Undermine" },
    },

    ["The Topskimmer Special"] = {
        -- source: https://www.warcraftmounts.com/mounts/thetopskimmerspecial.php
        { text = "Reach Renown 19 with The Cartels of Undermine" },
        { text = "Save up 11,375 Resonance Crystals", currencyID = 2815, amount = 11375 },
        { text = "Buy the mount from Smaks Topskimmer in Undermine" },
    },

    ["Thunderdrum Misfire"] = {
        -- source: https://warcraft.wiki.gg/wiki/Thunderdrum_Misfire
        -- Gallagio renown is earned only inside Liberation of Undermine.
        { text = "Reach Renown 8 with the Gallagio Loyalty Rewards Club" },
        { text = "Buy the mount from Ando the Gat at the Incontinental Hotel for 500 gold" },
    },

    ["Darkfuse Chompactor"] = {
        -- source: https://www.warcraftmounts.com/mounts/darkfusechompactor.php
        { text = "Reach Renown 17 with the Gallagio Loyalty Rewards Club" },
        { text = "Buy the mount from Ando the Gat at the Incontinental Hotel for 500 gold" },
    },

    ["Flarendo the Furious"] = {
        -- source: https://warcraft.wiki.gg/wiki/Flarendo_the_Furious
        { text = "Reach Renown 20 with the Gallagio Loyalty Rewards Club" },
        { text = "Buy the mount from Ando the Gat at the Incontinental Hotel for 777 gold" },
    },

    ["Crimson Armored Growler"] = {
        -- source: https://www.wowhead.com/faction=2673 (Bilgewater Cartel, Undermine)
        { text = "Reach Exalted with the Bilgewater Cartel in Undermine", factionID = 2673, reaction = 8 },
        { text = "Save up 8,125 Resonance Crystals", currencyID = 2815, amount = 8125 },
        { text = "Buy the mount from Rocco Razzboom at The Scrapshop" },
    },

    ["Blackwater Shredder Deluxe Mk 2"] = {
        -- source: https://www.wowhead.com/faction=2675 (Blackwater Cartel, Undermine)
        { text = "Reach Exalted with the Blackwater Cartel in Undermine", factionID = 2675, reaction = 8 },
        { text = "Save up 8,125 Resonance Crystals", currencyID = 2815, amount = 8125 },
        { text = "Buy the mount from Boatswain Hardee at the Port Authority" },
    },

    ["Mean Green Flying Machine"] = {
        -- source: https://www.wowhead.com/faction=2677 (Steamwheedle Cartel, Undermine)
        { text = "Reach Exalted with the Steamwheedle Cartel in Undermine", factionID = 2677, reaction = 8 },
        { text = "Save up 11,375 Resonance Crystals", currencyID = 2815, amount = 11375 },
        { text = "Buy the mount from Lab Assistant Laszly" },
    },

    ["Ochre Delivery Rocket"] = {
        -- source: https://www.wowhead.com/faction=2671 (Venture Company, Undermine)
        { text = "Reach Exalted with the Venture Company in Undermine", factionID = 2671, reaction = 8 },
        { text = "Save up 11,375 Resonance Crystals", currencyID = 2815, amount = 11375 },
        { text = "Buy the mount from Shredz the Scrapper" },
    },

    ["Bilgewater Bombardier"] = {
        -- source: https://www.warcraftmounts.com/mounts/bilgewaterbombardier.php
        { text = "Reach Exalted with the Bilgewater Cartel in Undermine", factionID = 2673, reaction = 8 },
        { text = "Keep opening Bilgewater Troves from Rocco Razzboom -- the mount is a rare drop" },
    },

    ["Blackwater Bonecrusher"] = {
        -- source: https://www.warcraftmounts.com/mounts/blackwaterbonecrusher.php
        { text = "Reach Exalted with the Blackwater Cartel in Undermine", factionID = 2675, reaction = 8 },
        { text = "Keep opening Blackwater Troves from Boatswain Hardee -- the mount is a rare drop" },
    },

    ["Steamwheedle Supplier"] = {
        -- source: https://www.warcraftmounts.com/mounts/steamwheedlesupplier.php
        { text = "Reach Exalted with the Steamwheedle Cartel in Undermine", factionID = 2677, reaction = 8 },
        { text = "Keep opening Steamwheedle Troves from Lab Assistant Laszly -- the mount is a rare drop" },
    },

    ["Venture Co-ordinator"] = {
        -- source: https://www.warcraftmounts.com/mounts/venturecoordinator.php
        { text = "Reach Exalted with the Venture Company in Undermine", factionID = 2671, reaction = 8 },
        { text = "Keep opening Venture Co. Troves from Shredz the Scrapper -- the mount is a rare drop" },
    },

    ["Darkfuse Demolisher"] = {
        -- source: https://warcraft.wiki.gg/wiki/Darkfuse_Demolisher
        -- Standing conflict: wiki and Icy Veins say Revered, warcraftmounts says
        -- Exalted. No factionID/reaction attached rather than risk a false tick.
        { text = "Defeat Chrome King Gallywix and complete the Darkfuse Solutions unlock quests" },
        { text = "Raise Darkfuse Solutions reputation by handing Market Research to Sitch Lowdown" },
        { text = "Save up 11,375 Resonance Crystals", currencyID = 2815, amount = 11375 },
        { text = "Buy the mount from Sitch Lowdown at Hovel Hill" },
    },

    ["Bronze Goblin Waveshredder"] = {
        -- source: https://www.wowhead.com/quest=85808/exalted-with-darkfuse-solutions
        { text = "Unlock Darkfuse Solutions after defeating Chrome King Gallywix" },
        { text = "Reach Exalted with Darkfuse Solutions",                    factionID = 2669, reaction = 8 },
        { text = "Complete the quest \"Exalted with Darkfuse Solutions\"",   questID = 85808 },
        { text = "Keep opening Darkfuse Troves -- the mount is a rare drop", itemID = 232465 },
    },

    ["Darkfuse Spy-Eye"] = {
        -- source: https://warcraft.wiki.gg/wiki/Darkfuse_Spy-Eye
        { text = "Unlock Darkfuse Solutions after defeating Chrome King Gallywix" },
        { text = "Buy a Canister of Darkfuse Solution from Sitch Lowdown", itemID = 229823, count = 1 },
        { text = "Use it on the De-Pollution Station X1119 pylon in Undermine to summon Darkfuse Precipitant" },
        { text = "Defeat Darkfuse Precipitant -- the mount is a rare drop" },
    },

    ["Personalized Goblin S.C.R.A.P.per"] = {
        -- source: https://warcraft.wiki.gg/wiki/Sifted_Pile_of_Scrap
        { text = "Unlock D.R.I.V.E. and S.C.R.A.P. digging in Undermine" },
        { text = "Collect 333 Empty Kaja'Cola Cans from S.C.R.A.P. heaps", currencyID = 3218, amount = 333 },
        { text = "Buy a Sifted Pile of Scrap from Angelo Rustbin at Hovel Hill", itemID = 233557, count = 1 },
        { text = "Open it -- the mount is a rare drop" },
    },

    ["Violet Goblin Shredder"] = {
        -- source: https://www.warcraftmounts.com/mounts/violetgoblinshredder.php
        { text = "Earn the G-99 Breakneck in Undermine campaign chapter 2" },
        { text = "Reach Renown 8 with The Cartels of Undermine" },
        { text = "Complete Shipping and Handling job streaks -- the mount is a chance reward" },
    },

    ["Asset Advocator"] = {
        -- source: https://www.warcraftmounts.com/mounts/assetadvocator.php
        { text = "Complete the Entrepreneur Inc. heist questline to open Skedgit Cinderbangs' shop" },
        { text = "Collect 25 Miscellaneous Mechanica from Undermine rares" },
        { text = "Buy the mount from Skedgit Cinderbangs in Entrepreneur Inc." },
    },

    ["Margin Manipulator"] = {
        -- source: https://www.warcraftmounts.com/mounts/marginmanipulator.php
        { text = "Complete the Entrepreneur Inc. heist questline to open Skedgit Cinderbangs' shop" },
        { text = "Collect 25 Miscellaneous Mechanica from Undermine rares" },
        { text = "Buy the mount from Skedgit Cinderbangs in Entrepreneur Inc." },
    },

    ["Innovation Investigator"] = {
        -- source: https://www.warcraftmounts.com/mounts/innovationinvestigator.php
        { text = "Complete the Entrepreneur Inc. heist questline to open Skedgit Cinderbangs' shop" },
        { text = "Collect 25 Miscellaneous Mechanica from Undermine rares" },
        { text = "Buy the mount from Skedgit Cinderbangs in Entrepreneur Inc." },
    },

    ["Corruption of the Aspects"] = {
        -- source: https://www.warcraftmounts.com/mounts/corruptionoftheaspects.php
        { text = "Unlock Horrific Visions Revisited" },
        { text = "Save up 40,000 Displaced Corrupted Mementos", currencyID = 3149, amount = 40000 },
        { text = "Buy the mount from Torie in Dornogal" },
    },

    ["Void-Crystal Panther"] = {
        -- source: https://www.warcraftmounts.com/mounts/voidcrystalpanther.php
        { text = "Loot \"Design: Void-Crystal Panther\" from Big Keech in the Revisited Vision of Orgrimmar" },
        { text = "Gather the reagents from inside Horrific Visions Revisited" },
        { text = "Have a jewelcrafter craft the mount" },
    },

    ["Ivory Savagemane"] = {
        -- source: https://www.warcraftmounts.com/mounts/ivorysavagemane.php
        { text = "Save up 5,000 Timewarped Badges", currencyID = 1166, amount = 5000 },
        { text = "Buy Reins of the Ivory Savagemane from Churbro during Battle for Azeroth Timewalking" },
    },

    ["Moonlit Nightsaber"] = {
        -- source: https://www.warcraftmounts.com/mounts/moonlitnightsaber.php
        { text = "Save up 5,000 Timewarped Badges", currencyID = 1166, amount = 5000 },
        { text = "Buy Reins of the Moonlit Nightsaber from Churbro during Battle for Azeroth Timewalking" },
    },

    ["Chrono Corsair"] = {
        -- source: https://www.warcraftmounts.com/mounts/chronocorsair.php
        -- Originally the "Master of the Turbulent Timeways III" reward; the
        -- achievement ID could not be verified, so it is left as text.
        -- Two routes: the original achievement, or the badge purchase.
        { text = "Save up 5,000 Timewarped Badges", currencyID = 1166, amount = 5000 },
        { text = "Buy the mount from any Timewalking vendor, or earn \"Master of the Turbulent Timeways III\"" },
    },

    ["Ruby Void Creeper"] = {
        -- source: https://www.wowhead.com/item=242729/ruby-void-creeper
        { text = "Reach Renown 15 with The K'aresh Trust" },
        { text = "Save up 8,125 Resonance Crystals", currencyID = 2815, amount = 8125 },
        { text = "Buy the mount from Om'sirik in Tazavesh" },
    },

    ["Terror of the Wastes"] = {
        -- source: https://www.warcraftmounts.com/mounts/terrorofthewastes.php
        { text = "Reach Renown 19 with The K'aresh Trust" },
        { text = "Save up 11,375 Resonance Crystals", currencyID = 2815, amount = 11375 },
        { text = "Buy the mount from Om'sirik in Tazavesh" },
    },

    ["Vandal's Gearglider"] = {
        -- source: https://www.warcraftmounts.com/mounts/vandalsgearglider.php
        { text = "Reach Renown 8 with the Manaforge Vandals by running Manaforge Omega" },
        { text = "Collect the mount from the Manaforge Vandals quartermaster at Shadow Point, K'aresh" },
    },

    ["Lavender K'arroc"] = {
        -- source: https://www.wowhead.com/currency=3303/untethered-coin
        { text = "Unlock Phase Diving with the Reshii Wraps on K'aresh" },
        { text = "Reach Renown 2 with The K'aresh Trust" },
        { text = "Save up 10 Untethered Coin", currencyID = 3303, amount = 10 },
        { text = "Buy the mount from Shad'anis at Overlook Zo'Shuul" },
    },

    ["Acidic Void Creeper"] = {
        -- source: https://www.wowhead.com/currency=3303/untethered-coin
        { text = "Unlock Phase Diving with the Reshii Wraps on K'aresh" },
        { text = "Reach Renown 2 with The K'aresh Trust" },
        { text = "Save up 7 Untethered Coin", currencyID = 3303, amount = 7 },
        { text = "Buy the mount from Shad'anis at Overlook Zo'Shuul" },
    },

    ----------------------------------------------------------------------
    -- WORLD CONTENT WITH AN UNLOCK OR ACCUMULATION STEP
    ----------------------------------------------------------------------

    ["Alunira"] = {
        -- source: https://warcraft.wiki.gg/wiki/Storm_Vessel
        { text = "Collect 10 Crackling Shards from rares on the Isle of Dorn", itemID = 224025, count = 10 },
        { text = "Combine them into a Storm Vessel",                          itemID = 224026, count = 1 },
        { text = "Use the Storm Vessel to strip Alunira's shroud at Dhar Oztan, then kill her" },
    },

    ["Soaring Meaderbee"] = {
        -- source: https://www.wowhead.com/item=225557/sizzling-cinderpollen
        -- Sizzling Cinderpollen is an item, not a currency.
        { text = "Farm 900 Sizzling Cinderpollen at Cinderbrew Meadery, Isle of Dorn", itemID = 225557, count = 900 },
        { text = "Buy Reins of the Soaring Meaderbee from Cendvin outside the meadery" },
    },

    ["Ol' Mole Rufus"] = {
        -- source: https://warcraft.wiki.gg/wiki/Lurker_of_the_Deeps
        { text = "Have five players pull the five Inconspicuous Levers across The Ringing Deeps at once" },
        { text = "Defeat the summoned Lurker of the Deeps" },
    },

    ["Machine Defense Unit 1-11"] = {
        -- source: https://warcraft.wiki.gg/wiki/Machine_Defense_Unit_1-11
        { text = "Pick up the weekly quest for Awakening the Machine in Gundargaz" },
        { text = "Defend Speaker Kuldas through the wave event to unlock Awakened Caches" },
        { text = "Open the Awakened Caches -- the mount is a rare drop, once per character per week" },
    },

    ["Dauntless Imperial Lynx"] = {
        -- source: https://www.warcraftmounts.com/twwmounts.php
        -- Sources disagree on the exact container (Lamplighter Supply Satchel
        -- vs Radiant Cache), so the container is not named here.
        { text = "Take part in the Spreading the Light keyflame event and Lamplighter weeklies in Hallowfall" },
        { text = "Open the reward containers they award -- the mount is a rare drop" },
    },

    ["Translocated Gorger"] = {
        -- source: https://warcraft.wiki.gg/wiki/Devoured_Energy-Pod
        -- Devoured Energy-Pod itemID was wiki-stated only, so it is omitted.
        { text = "Kill the four Devourer Invasion swarm bosses on K'aresh each week" },
        { text = "Accumulate 20 Devoured Energy-Pods (capped at 4 per week)" },
        { text = "Combine them into the mount" },
    },

    ["Curious Slateback"] = {
        -- source: https://warcraft.wiki.gg/wiki/Curious_Slateback
        { text = "Unlock Ecological Succession in The Oasis on K'aresh" },
        { text = "Complete the weekly Ecological Succession quest and open the Wriggling Pinnacle Cache" },
    },

    ["Crowd Pummeler 2-30"] = {
        -- source: https://www.warcraftmounts.com/twwmounts.php
        { text = "Learn Khaz Algar Engineering and the Crowd Pummeler 2-30 recipe" },
        { text = "Craft the mount, or buy one from the Auction House" },
    },

    ----------------------------------------------------------------------
    -- PVP
    ----------------------------------------------------------------------

    ["Raging Cinderbee"] = {
        -- source: https://www.wowhead.com/achievement=40097 (Ruffious's Bid)
        { text = "Complete the Khaz Algar War Mode achievements, including all four Tours of Duty" },
        { text = "Earn the achievement \"Ruffious's Bid\"", achievementID = 40097 },
    },

    ["Forged Gladiator's Fel Bat"] = {
        -- source: https://www.wowhead.com/achievement=40393
        { text = "Win 50 3v3 games at Elite rank during The War Within Season 1" },
        { text = "Earn the achievement \"Gladiator: The War Within Season 1\"", achievementID = 40393 },
    },

    ["Prized Gladiator's Fel Bat"] = {
        -- source: https://www.wowhead.com/achievement=41032
        { text = "Win 50 3v3 games at Elite rank during The War Within Season 2" },
        { text = "Earn the achievement \"Gladiator: The War Within Season 2\"", achievementID = 41032 },
    },

    ["Astral Gladiator's Fel Bat"] = {
        -- source: https://www.wowhead.com/achievement=41049
        { text = "Win 50 3v3 games at Elite rank during The War Within Season 3" },
        { text = "Earn the achievement \"Gladiator: The War Within Season 3\"", achievementID = 41049 },
    },

    ["Vicious Skyflayer"] = {
        -- source: https://warcraft.wiki.gg/wiki/Vicious_Skyflayer
        { text = "Win rated PvP matches at 1000+ rating during The War Within Season 1" },
        { text = "Fill the Season Rewards progress bar in the Rated PvP tab" },
    },

    ["Vicious Electro Eel"] = {
        -- source: https://warcraft.wiki.gg/wiki/Vicious_Electro_Eel
        { text = "Win rated PvP matches at 1000+ rating during The War Within Season 2" },
        { text = "Fill the Season Rewards progress bar in the Rated PvP tab" },
    },

    ["Vicious Void Creeper"] = {
        -- source: https://warcraft.wiki.gg/wiki/Vicious_Void_Creeper
        { text = "Win rated PvP matches at 1000+ rating during The War Within Season 3" },
        { text = "Fill the Season Rewards progress bar in the Rated PvP tab" },
    },

    ----------------------------------------------------------------------
    -- FISHING
    ----------------------------------------------------------------------

    ["Kah, Legend of the Deep"] = {
        -- source: https://www.wowhead.com/achievement=40539 (The Derby Dash)
        { text = "Pick up the Hallowfall Fishing Derby quest from Captain Oathmyt for the Derby Dasher buff" },
        { text = "Catch all 20 Algari trophy fish across Khaz Algar while the buff is active" },
        { text = "Earn the achievement \"The Derby Dash\"", achievementID = 40539 },
    },

    -- =================================================================
    -- DRAGONFLIGHT  (researched 2026-08-18)
    -- Drakewatcher manuscripts are customisations, not journal mounts,
    -- and are deliberately absent. Every DF faction is Renown-based, so
    -- no factionIDs are used here at all.
    -- =================================================================
    ----------------------------------------------------------------------
    -- CAMPAIGN / STORY DRAKES
    ----------------------------------------------------------------------

    ["Renewed Proto-Drake"] = {
        -- source: https://www.wowhead.com/quest=68795
        -- Wowhead lists Alexstrasza as the giver and Lord Andestrasz as the turn-in.
        { text = "Reach the Dragon Isles and progress the Waking Shores campaign to the Ruby Lifeshrine" },
        { text = "Complete the quest \"Skyriding\" (named \"Dragonriding\" in Dragonflight)", questID = 68795,
          start = "Starts from Alexstrasza the Life-Binder at the Ruby Lifeshrine, The Waking Shores" },
    },

    ["Windborne Velocidrake"] = {
        -- source: https://www.wowhead.com/quest=70220
        { text = "Finish the Waking Shores campaign and travel to the Ohn'ahran Plains" },
        { text = "Progress the Ohn'ahran Plains story to chapter 4" },
        { text = "Complete the quest \"Shady Sanctuary\"", questID = 70220,
          start = "Starts from Merithra in the Ohn'ahran Plains" },
    },

    ["Highland Drake"] = {
        -- source: https://www.wowhead.com/quest=66027
        { text = "Finish the Ohn'ahran Plains campaign and travel to The Azure Span" },
        { text = "Progress the Azure Span story to the Vakthros chapter" },
        { text = "Complete the quest \"Calling the Blue Dragons\"", questID = 66027,
          start = "Starts from Kalecgos in The Azure Span" },
    },

    ["Cliffside Wylderdrake"] = {
        -- source: https://www.wowhead.com/quest=66040
        -- Chromie's own NPC page lists no ordinary world location, so no zone is
        -- claimed here.
        { text = "Finish the Azure Span campaign and travel to Thaldraszus" },
        { text = "Progress the Thaldraszus story to its finale" },
        { text = "Complete the quest \"Back to the Future\"", questID = 66040,
          start = "Starts from Chromie" },
    },

    ["Winding Slitherdrake"] = {
        -- source: https://www.wowhead.com/quest=74563
        { text = "Complete the Dragonflight level 70 campaign to unlock Zaralek Cavern" },
        { text = "Progress the Embers of Neltharion campaign to chapter 4" },
        { text = "Complete the quest \"Worst of the Worst\"", questID = 74563,
          start = "Starts from Ebyssian in Zaralek Cavern" },
    },

    ["Flourishing Whimsydrake"] = {
        -- source: https://www.wowhead.com/quest=76318
        { text = "Complete the Fury Incarnate campaign to unlock the Guardians of the Dream campaign" },
        { text = "Complete the quest \"Call of the Dream\" at the Ancient Bough in the Ohn'ahran Plains", questID = 76317,
          start = "Starts from Merithra at the Ancient Bough, Ohn'ahran Plains" },
        { text = "Complete the quest \"Emerald Welcome\"", questID = 76318,
          start = "Starts from Merithra at the Ancient Bough, Ohn'ahran Plains" },
    },

    ["Grotto Netherwing Drake"] = {
        -- source: https://www.wowhead.com/quest=76465
        -- Note: originally a July 2023 Traveler's Log reward. The questline
        -- below is the permanent 10.2 route, so long-time collectors may
        -- already own it without any of these steps.
        -- Vyranoth is listed in three zones, so no zone is claimed for 76465.
        { text = "Progress the Guardians of the Dream campaign far enough to reach Wrathion in the Emerald Dream" },
        { text = "Start the Misfit Dragons chain with \"A Dragon in Hand is Worth Two in the Roost\"", questID = 76460,
          start = "Starts from Wrathion in the Emerald Dream" },
        { text = "Work through the Misfit Dragons chain (Draconic Diplomacy, Cavern Cleaning, A Whelping Hand, Delectable Delicacies, Home in Time for Tea, The Thorignir)" },
        { text = "Complete the quest \"Dragon Keeping\"", questID = 76465,
          start = "Starts from Vyranoth" },
    },

    ["Tarecgosa's Visage"] = {
        -- source: https://www.wowhead.com/quest=73199
        { text = "Own the Cataclysm legendary staff Dragonwrath, Tarecgosa's Rest" },
        { text = "Complete the Veiled Ossuary blue dragonflight questline in Thaldraszus" },
        { text = "Complete the quest \"Rhapsody in Blue\" for the Lingering Echo of Tarecgosa", questID = 73199,
          start = "Starts from Kalecgos in Thaldraszus" },
    },

    ["Gilnean Prowler"] = {
        -- source: https://www.wowhead.com/quest=78189
        { text = "Play through The Gilneas Reclamation storyline" },
        { text = "Complete the quest \"Beginning a New Dawn\"", questID = 78189,
          start = "Starts from Genn Greymane in the Ruins of Gilneas" },
    },

    ----------------------------------------------------------------------
    -- ACHIEVEMENT REWARDS - MYTHIC+ SEASONAL
    ----------------------------------------------------------------------

    ["Hailstorm Armoredon"] = {
        -- source: https://www.wowhead.com/achievement=16649
        { text = "Attain a Mythic+ Rating of 2000 during Dragonflight Season One" },
        { text = "Earn the achievement \"Dragonflight Keystone Master: Season One\"", achievementID = 16649 },
    },

    ["Inferno Armoredon"] = {
        -- source: https://www.wowhead.com/achievement=17844
        { text = "Attain a Mythic+ Rating of 2000 during Dragonflight Season Two" },
        { text = "Earn the achievement \"Dragonflight Keystone Master: Season Two\"", achievementID = 17844 },
    },

    ["Verdant Armoredon"] = {
        -- source: https://www.wowhead.com/achievement=19011
        { text = "Attain a Mythic+ Rating of 2000 during Dragonflight Season Three" },
        { text = "Earn the achievement \"Dragonflight Keystone Master: Season Three\"", achievementID = 19011 },
    },

    ["Infinite Armoredon"] = {
        -- source: https://www.wowhead.com/achievement=19782
        { text = "Attain a Mythic+ Rating of 2000 during Dragonflight Season Four" },
        { text = "Earn the achievement \"Dragonflight Keystone Master: Season Four\"", achievementID = 19782 },
    },

    ----------------------------------------------------------------------
    -- ACHIEVEMENT REWARDS - RAID AND DUNGEON GLORY METAS
    ----------------------------------------------------------------------

    ["Raging Magmammoth"] = {
        -- source: https://www.wowhead.com/achievement=16355
        { text = "Complete all eight Vault of the Incarnates raid achievements" },
        { text = "Earn the meta achievement \"Glory of the Vault Raider\"", achievementID = 16355 },
    },

    ["Shadowflame Shalewing"] = {
        -- source: https://www.wowhead.com/achievement=18251
        { text = "Complete all the Aberrus, the Shadowed Crucible raid achievements" },
        { text = "Earn the meta achievement \"Glory of the Aberrus Raider\"", achievementID = 18251 },
    },

    ["Shadow Dusk Dreamsaber"] = {
        -- source: https://www.wowhead.com/achievement=19349
        { text = "Complete all nine Amirdrassil, the Dream's Hope raid achievements" },
        { text = "Earn the meta achievement \"Glory of the Dream Raider\"", achievementID = 19349 },
    },

    ["Shellack"] = {
        -- source: https://www.wowhead.com/achievement=16295
        { text = "Complete all the Dragonflight Mythic dungeon achievements" },
        { text = "Earn the meta achievement \"Glory of the Dragonflight Hero\"", achievementID = 16295 },
    },

    ["Voyaging Wilderling"] = {
        -- source: https://www.wowhead.com/achievement=19574
        { text = "Clear all three Awakened Dragonflight raids on Normal or higher during Season 4" },
        { text = "Earn the achievement \"Awakening the Dragonflight Raids\"", achievementID = 19574 },
    },

    ----------------------------------------------------------------------
    -- ACHIEVEMENT REWARDS - 10.2.6 "A WORLD AWOKEN" CHAIN
    ----------------------------------------------------------------------

    ["Taivan"] = {
        -- source: https://www.wowhead.com/achievement=19458
        { text = "Complete all thirteen Dragon Isles meta achievements" },
        { text = "Earn the achievement \"A World Awoken\" for the Good Boy's Leash", achievementID = 19458 },
    },

    ["Stormtouched Bruffalon"] = {
        -- source: https://www.wowhead.com/achievement=19486
        { text = "Complete the nine Dragon Isles zone and faction metas" },
        { text = "Earn the achievement \"Across the Isles\"", achievementID = 19486 },
    },

    ["Bestowed Ohuna Spotter"] = {
        -- source: https://www.wowhead.com/achievement=19479
        { text = "Aid the Dragonscale Expedition in the Waking Shores" },
        { text = "Earn the achievement \"Wake Me Up\"", achievementID = 19479 },
    },

    ["Bestowed Thunderspine Packleader"] = {
        -- source: https://www.wowhead.com/achievement=19481
        { text = "Aid the Maruuk Centaur in the Ohn'ahran Plains" },
        { text = "Earn the achievement \"Centaur of Attention\"", achievementID = 19481 },
    },

    ["Bestowed Trawling Mammoth"] = {
        -- source: https://www.wowhead.com/achievement=19482
        { text = "Aid the Iskaara Tuskarr in The Azure Span" },
        { text = "Earn the achievement \"Army of the Fed\"", achievementID = 19482 },
    },

    ["Bestowed Ottuk Vanguard"] = {
        -- source: https://www.wowhead.com/achievement=19483
        { text = "Aid the Valdrakken Accord in Thaldraszus" },
        { text = "Earn the achievement \"Flight Club\"", achievementID = 19483 },
    },

    ["Bestowed Sandskimmer"] = {
        -- source: https://www.wowhead.com/achievement=19485
        { text = "Aid the Timewalkers across the Forbidden Reach and Dawn of the Infinite" },
        { text = "Earn the achievement \"Closing Time\"", achievementID = 19485 },
    },

    ----------------------------------------------------------------------
    -- ACHIEVEMENT REWARDS - OTHER
    ----------------------------------------------------------------------

    ["Coralscale Salamanther"] = {
        -- source: https://www.wowhead.com/achievement=16492
        { text = "Complete the four Primal Storm achievements" },
        { text = "Earn the meta achievement \"Into the Storm\"", achievementID = 16492 },
    },

    ["Calescent Shalewing"] = {
        -- source: https://www.wowhead.com/achievement=17785
        { text = "Complete all the Zaralek Cavern achievements" },
        { text = "Earn the meta achievement \"Que Zara(lek), Zara(lek)\"", achievementID = 17785 },
    },

    ["Otterworldly Ottuk Carrier"] = {
        -- source: https://www.wowhead.com/achievement=15833
        { text = "Collect 500 mounts usable by a single character" },
        { text = "Earn the achievement \"Thanks for the Carry!\"", achievementID = 15833 },
    },

    ----------------------------------------------------------------------
    -- PVP - GLADIATOR SEASONAL
    ----------------------------------------------------------------------

    ["Crimson Gladiator's Drake"] = {
        -- source: https://www.wowhead.com/achievement=15957
        { text = "Win 50 3v3 games at Elite rank during Dragonflight Season 1" },
        { text = "Earn the achievement \"Gladiator: Dragonflight Season 1\"", achievementID = 15957 },
    },

    ["Obsidian Gladiator's Slitherdrake"] = {
        -- source: https://www.wowhead.com/achievement=17740
        { text = "Win 50 3v3 games at Elite rank during Dragonflight Season 2" },
        { text = "Earn the achievement \"Gladiator: Dragonflight Season 2\"", achievementID = 17740 },
    },

    ["Verdant Gladiator's Slitherdrake"] = {
        -- source: https://www.wowhead.com/achievement=19091
        { text = "Win 50 3v3 games at Elite rank during Dragonflight Season 3" },
        { text = "Earn the achievement \"Gladiator: Dragonflight Season 3\"", achievementID = 19091 },
    },

    ["Draconic Gladiator's Drake"] = {
        -- source: https://www.wowhead.com/achievement=19490
        { text = "Win 50 3v3 games at Elite rank during Dragonflight Season 4" },
        { text = "Earn the achievement \"Gladiator: Dragonflight Season 4\"", achievementID = 19490 },
    },

    ----------------------------------------------------------------------
    -- PVP - VICIOUS SADDLE
    -- Alliance and Horde share the mount name, so one entry covers both.
    ----------------------------------------------------------------------

    ["Vicious Sabertooth"] = {
        -- source: https://warcraft.wiki.gg/wiki/Vicious_Saddle
        { text = "Fill the Rated PvP progress bar during Dragonflight Season 1 to earn a Vicious Saddle" },
        { text = "Trade 1 Vicious Saddle to your faction's Vicious mount vendor" },
    },

    ["Vicious War Snail"] = {
        -- source: https://warcraft.wiki.gg/wiki/Vicious_Saddle
        { text = "Fill the Rated PvP progress bar during Dragonflight Season 2 to earn a Vicious Saddle" },
        { text = "Trade 1 Vicious Saddle to your faction's Vicious mount vendor" },
    },

    ["Vicious Moonbeast"] = {
        -- source: https://warcraft.wiki.gg/wiki/Vicious_Saddle
        { text = "Fill the Rated PvP progress bar during Dragonflight Season 3 to earn a Vicious Saddle" },
        { text = "Trade 1 Vicious Saddle to your faction's Vicious mount vendor" },
    },

    ["Vicious Dreamtalon"] = {
        -- source: https://warcraft.wiki.gg/wiki/Vicious_Saddle
        { text = "Fill the Rated PvP progress bar during Dragonflight Season 4 to earn a Vicious Saddle" },
        { text = "Trade 1 Vicious Saddle to your faction's Vicious mount vendor" },
    },

    ----------------------------------------------------------------------
    -- DRAGONSCALE EXPEDITION
    ----------------------------------------------------------------------

    ["Azure Skitterfly"] = {
        -- source: https://www.warcraftmounts.com/mounts/azureskitterfly.php
        { text = "Reach Renown 25 with the Dragonscale Expedition" },
        { text = "Collect 20 Contoured Fowlfeather and 5 Iridescent Plume" },
        { text = "Save up 750 Dragon Isles Supplies", currencyID = 2003, amount = 750 },
        { text = "Buy the mount from Granpap Whiskers or Cataloger Jakes at Dragonscale Basecamp, the Waking Shores" },
    },

    ["Tamed Skitterfly"] = {
        -- source: https://www.warcraftmounts.com/mounts/tamedskitterfly.php
        { text = "Reach Renown 25 with the Dragonscale Expedition" },
        { text = "Collect 20 Contoured Fowlfeather and 5 Iridescent Plume" },
        { text = "Save up 750 Dragon Isles Supplies", currencyID = 2003, amount = 750 },
        { text = "Buy the mount from Granpap Whiskers or Cataloger Jakes at Dragonscale Basecamp, the Waking Shores" },
    },

    ["Verdant Skitterfly"] = {
        -- source: https://www.warcraftmounts.com/mounts/verdantskitterfly.php
        { text = "Reach Renown 25 with the Dragonscale Expedition - it cannot drop before this" },
        { text = "Loot Expedition Scout's Packs across the Dragon Isles for a chance at the mount" },
    },

    ----------------------------------------------------------------------
    -- ISKAARA TUSKARR
    ----------------------------------------------------------------------

    ["Brown Scouting Ottuk"] = {
        -- source: https://warcraft.wiki.gg/wiki/Ottuk_mounts
        { text = "Reach Renown 25 with the Iskaara Tuskarr" },
        { text = "Collect 2 Mastodon Tusk and 2 Aquatic Maw" },
        { text = "Save up 750 Dragon Isles Supplies", currencyID = 2003, amount = 750 },
        { text = "Buy the mount from Tatto or Murik in Iskaara, The Azure Span" },
    },

    ["Yellow Scouting Ottuk"] = {
        -- source: https://warcraft.wiki.gg/wiki/Ottuk_mounts
        { text = "Reach Renown 25 with the Iskaara Tuskarr" },
        { text = "Collect 2 Mastodon Tusk and 2 Aquatic Maw" },
        { text = "Save up 750 Dragon Isles Supplies", currencyID = 2003, amount = 750 },
        { text = "Buy the mount from Tatto or Murik in Iskaara, The Azure Span" },
    },

    ["Brown War Ottuk"] = {
        -- source: https://www.warcraftmounts.com/mounts/brownwarottuk.php
        { text = "Reach Renown 30 with the Iskaara Tuskarr" },
        { text = "Collect 5 Mastodon Tusk and 5 Aquatic Maw" },
        { text = "Save up 1000 Dragon Isles Supplies", currencyID = 2003, amount = 1000 },
        { text = "Buy the mount from Tatto or Murik in Iskaara, The Azure Span" },
    },

    ["Yellow War Ottuk"] = {
        -- source: https://warcraft.wiki.gg/wiki/Ottuk_mounts
        { text = "Reach Renown 30 with the Iskaara Tuskarr" },
        { text = "Collect 5 Mastodon Tusk and 5 Aquatic Maw" },
        { text = "Save up 1000 Dragon Isles Supplies", currencyID = 2003, amount = 1000 },
        { text = "Buy the mount from Tatto or Murik in Iskaara, The Azure Span" },
    },

    ["Iskaara Trader's Ottuk"] = {
        -- source: https://warcraft.wiki.gg/wiki/Iskaara_Trader's_Ottuk
        { text = "Loot Terros's Captive Core from Terros in Vault of the Incarnates" },
        { text = "Loot the Eye of the Vengeful Hurricane from Dathea, Ascended in Vault of the Incarnates" },
        { text = "Trade both items to Tattukiaka in Iskaara, The Azure Span" },
    },

    ["Ivory Trader's Ottuk"] = {
        -- source: https://warcraft.wiki.gg/wiki/Ivory_Trader's_Ottuk
        { text = "Loot the Thunderous Downburst Ring from The Raging Tempest in The Nokhud Offensive" },
        { text = "Loot the Unstable Arcane Loop from Leymor in The Azure Vault" },
        { text = "Loot the Platinum Star Band from Vexamus in Algeth'ar Academy" },
        { text = "Trade all three rings to Tattukiaka in Iskaara, The Azure Span" },
    },

    ----------------------------------------------------------------------
    -- MARUUK CENTAUR
    ----------------------------------------------------------------------

    ["Plainswalker Bearer"] = {
        -- source: https://www.warcraftmounts.com/mounts/plainswalkerbearer.php
        { text = "Reach Renown 5 with the Maruuk Centaur to unlock Grand Hunts" },
        { text = "Complete a Grand Hunt to earn your weekly Hunt Spoils cache" },
        { text = "Open the cache for a chance at the mount" },
    },

    ["Lizi, Thunderspine Tramper"] = {
        -- source: https://www.wowhead.com/quest=71209
        { text = "Reach Renown 9 with the Maruuk Centaur" },
        { text = "Complete the \"Initiate's Day Out\" questline, ending with \"Sneaking In\"" },
        { text = "Take \"To Tame A Thunderspine\" from Initiate Radiya at Ohn'iri Springs, Ohn'ahran Plains", questID = 71196,
          start = "Starts from Initiate Radiya at Ohn'iri Springs, Ohn'ahran Plains" },
        { text = "Complete the remaining four daily stages, one per day, at 150 Dragon Isles Supplies each" },
        { text = "Complete the quest \"Beast of the Plains\" for Lizi's Reins", questID = 71209,
          start = "Starts from Initiate Radiya at Ohn'iri Springs, Ohn'ahran Plains" },
    },

    ["Divine Kiss of Ohn'ahra"] = {
        -- source: https://www.wowhead.com/quest=72512
        -- source: https://www.wowhead.com/quest=71091/the-highest-honor
        { text = "Reach Renown 25 with the Maruuk Centaur" },
        { text = "Complete the quest \"The Highest Honor\"", questID = 71091,
          start = "Starts from Khanam Matra Sarest in the Ohn'ahran Plains" },
        { text = "Obtain the mount Lizi, Thunderspine Tramper" },
        { text = "Collect 3 Stolen Breath of Ohn'ahra from Balakar Khan in The Nokhud Offensive" },
        { text = "Obtain an Exultant Incense (alchemy craft, also sold on the Auction House)" },
        { text = "Buy an Essence of Awakening from Quartermaster Huseng" },
        { text = "Complete the quest \"A Whispering Breeze\" from Godoloto at Ohn'ahra's Roost", questID = 72512,
          start = "Starts from Godoloto at Ohn'ahra's Roost, Ohn'ahran Plains" },
    },

    ["Zenet Hatchling"] = {
        -- source: https://warcraft.wiki.gg/wiki/Zenet_Hatchling
        { text = "Kill the rare Zenet Avis west of Teerakai in the Ohn'ahran Plains for a Zenet Egg" },
        { text = "Keep the Zenet Egg in your bags or bank for about 7 real-world days until it hatches" },
    },

    ----------------------------------------------------------------------
    -- LOAMM NIFFEN AND ZARALEK CAVERN
    ----------------------------------------------------------------------

    ["Boulder Hauler"] = {
        -- source: https://warcraft.wiki.gg/wiki/Boulder_Hauler_Reins
        { text = "Collect 170 Barter Bricks in Zaralek Cavern", itemID = 204985, count = 170 },
        { text = "Buy Boulder Hauler Reins from Ponzo in Loamm, Zaralek Cavern" },
        { text = "Alternatively, reach Renown 12 with the Loamm Niffen for the cheaper 85 Barter Boulder price" },
    },

    ["Morsel Sniffer"] = {
        -- source: https://warcraft.wiki.gg/wiki/Morsel_Sniffer
        { text = "Reach Renown 18 with the Loamm Niffen" },
        { text = "Save up 800 Dragon Isles Supplies", currencyID = 2003, amount = 800 },
        { text = "Buy Morsel Sniffer Reins from Harlowe Marl in Loamm, Zaralek Cavern" },
    },

    ["Big Slick in the City"] = {
        -- source: https://www.wowhead.com/quest=75598
        { text = "Reach Renown 7 with the Loamm Niffen to unlock snail racing with Briggul in Glimmerogg" },
        { text = "Run Briggul's daily race quests until you reach Professional standing with the Glimmerogg Racer" },
        { text = "Complete the quest \"Snailed It\"", questID = 75598 },
    },

    ["Subterranean Magmammoth"] = {
        -- source: https://warcraft.wiki.gg/wiki/Saccratros
        { text = "Collect Unearthed Fragrant Coin from public objectives and events in Zaralek Cavern" },
        { text = "Trade the coins to Spinsoa in Loamm for 100 Coveted Baubles", itemID = 204727, count = 100 },
        { text = "Buy the mount from Saccratros in Loamm, Zaralek Cavern" },
    },

    ["Igneous Shalewing"] = {
        -- source: https://warcraft.wiki.gg/wiki/Saccratros
        { text = "Collect Unearthed Fragrant Coin from public objectives and events in Zaralek Cavern" },
        { text = "Trade the coins to Spinsoa in Loamm for 400 Coveted Baubles", itemID = 204727, count = 400 },
        { text = "Buy the mount from Saccratros in Loamm, Zaralek Cavern" },
    },

    ["Seething Slug"] = {
        -- source: https://www.warcraftmounts.com/mounts/seethingslug.php
        { text = "Click three Seething Orbs around Zaralek Cavern to build 3 stacks of Insidious Insight - the buff lasts an hour and is lost if you leave the zone" },
        { text = "With all 3 stacks, open the Seething Cache at the northern shrine in Zaralek Cavern" },
    },

    ----------------------------------------------------------------------
    -- DREAM WARDENS AND THE EMERALD DREAM
    ----------------------------------------------------------------------

    ["Lunar Dreamstag"] = {
        -- source: https://warcraft.wiki.gg/wiki/Stag_mounts
        { text = "Reach Renown 17 with the Dream Wardens" },
        { text = "Save up 1200 Dragon Isles Supplies", currencyID = 2003, amount = 1200 },
        { text = "Buy Reins of the Lunar Dreamstag from Moon Priestess Lasara in the Emerald Dream" },
    },

    ["Suntouched Dreamstag"] = {
        -- source: https://warcraft.wiki.gg/wiki/Reins_of_the_Suntouched_Dreamstag
        { text = "Reach Renown 17 with the Dream Wardens" },
        { text = "Save up 1200 Dragon Isles Supplies", currencyID = 2003, amount = 1200 },
        { text = "Buy Reins of the Suntouched Dreamstag from Moon Priestess Lasara in the Emerald Dream" },
    },

    ["Blossoming Dreamstag"] = {
        -- source: https://warcraft.wiki.gg/wiki/Seedbloom
        { text = "Reach Renown 18 with the Dream Wardens" },
        { text = "Earn a Seedbloom from the weekly quest \"Blooming Dreamseeds\"", itemID = 211376, count = 1 },
        { text = "Buy the reins from Talisa or Sylvia Whisperbloom at the Central Encampment, Emerald Dream" },
    },

    ["Rekindled Dreamstag"] = {
        -- source: https://warcraft.wiki.gg/wiki/Seedbloom
        { text = "Reach Renown 18 with the Dream Wardens" },
        { text = "Earn a Seedbloom from the weekly quest \"Blooming Dreamseeds\"", itemID = 211376, count = 1 },
        { text = "Buy the reins from Talisa or Sylvia Whisperbloom at the Central Encampment, Emerald Dream" },
    },

    ["Snowfluff Dreamtalon"] = {
        -- source: https://warcraft.wiki.gg/wiki/Seedbloom
        { text = "Reach Renown 18 with the Dream Wardens" },
        { text = "Earn a Seedbloom from the weekly quest \"Blooming Dreamseeds\"", itemID = 211376, count = 1 },
        { text = "Buy the reins from Talisa or Sylvia Whisperbloom at the Central Encampment, Emerald Dream" },
    },

    ["Springtide Dreamtalon"] = {
        -- source: https://warcraft.wiki.gg/wiki/Seedbloom
        { text = "Reach Renown 18 with the Dream Wardens" },
        { text = "Earn a Seedbloom from the weekly quest \"Blooming Dreamseeds\"", itemID = 211376, count = 1 },
        { text = "Buy the reins from Talisa or Sylvia Whisperbloom at the Central Encampment, Emerald Dream" },
    },

    ["Evening Sun Dreamsaber"] = {
        -- source: https://warcraft.wiki.gg/wiki/Seedbloom
        { text = "Reach Renown 18 with the Dream Wardens" },
        { text = "Earn a Seedbloom from the weekly quest \"Blooming Dreamseeds\"", itemID = 211376, count = 1 },
        { text = "Buy the reins from Talisa or Sylvia Whisperbloom at the Central Encampment, Emerald Dream" },
    },

    ["Morning Flourish Dreamsaber"] = {
        -- source: https://warcraft.wiki.gg/wiki/Seedbloom
        { text = "Reach Renown 18 with the Dream Wardens" },
        { text = "Earn a Seedbloom from the weekly quest \"Blooming Dreamseeds\"", itemID = 211376, count = 1 },
        { text = "Buy the reins from Talisa or Sylvia Whisperbloom at the Central Encampment, Emerald Dream" },
    },

    ["Ochre Dreamtalon"] = {
        -- source: https://www.wowhead.com/quest=77762
        -- source: https://www.wowhead.com/quest=77677/some-water
        { text = "Find the Smoldering Sprout in the Emerald Dream and interact with it to douse it and brush off the soot" },
        { text = "Complete the quest \"Some Water...\"", questID = 77677,
          start = "Starts from Sprout in the Emerald Dream" },
        { text = "Work through the time-gated \"A Mix of Hope, Care, and Patience\" chain with Professor Ash, roughly three weeks of real time" },
        { text = "Complete the quest \"A Little Hope is Never Without Worth\"", questID = 77762,
          start = "Starts from Professor Ash in the Emerald Dream" },
    },

    ----------------------------------------------------------------------
    -- ELIANNA - DREAM INFUSION RECOLOURS
    -- Each needs a same-model mount already in your collection.
    ----------------------------------------------------------------------

    ["Delugen"] = {
        -- source: https://www.wowhead.com/quest=78386/emerald-reawakening
        { text = "Reach Renown 5 with the Dream Wardens" },
        { text = "Complete the quest \"Emerald Reawakening\" from Elianna", questID = 78386,
          start = "Starts from Melsysra in the Emerald Dream, hands in to Elianna" },
        { text = "Already own another ottuk mount" },
        { text = "Fill the Dream Energy bar to 100% for 1 Dream Infusion", currencyID = 2777, amount = 1 },
        { text = "Buy Delugen from Elianna at the Central Encampment, Emerald Dream" },
    },

    ["Stargrazer"] = {
        -- source: https://www.wowhead.com/quest=78386/emerald-reawakening
        { text = "Reach Renown 5 with the Dream Wardens" },
        { text = "Complete the quest \"Emerald Reawakening\" from Elianna", questID = 78386,
          start = "Starts from Melsysra in the Emerald Dream, hands in to Elianna" },
        { text = "Already own another dreamstag mount" },
        { text = "Fill the Dream Energy bar to 100% for 1 Dream Infusion", currencyID = 2777, amount = 1 },
        { text = "Buy Stargrazer from Elianna at the Central Encampment, Emerald Dream" },
    },

    ["Talont"] = {
        -- source: https://www.wowhead.com/quest=78386/emerald-reawakening
        { text = "Reach Renown 5 with the Dream Wardens" },
        { text = "Complete the quest \"Emerald Reawakening\" from Elianna", questID = 78386,
          start = "Starts from Melsysra in the Emerald Dream, hands in to Elianna" },
        { text = "Already own another dreamtalon mount" },
        { text = "Fill the Dream Energy bar to 100% for 1 Dream Infusion", currencyID = 2777, amount = 1 },
        { text = "Buy Talont from Elianna at the Central Encampment, Emerald Dream" },
    },

    ["Mammyth"] = {
        -- source: https://www.wowhead.com/quest=78386/emerald-reawakening
        { text = "Reach Renown 5 with the Dream Wardens" },
        { text = "Complete the quest \"Emerald Reawakening\" from Elianna", questID = 78386,
          start = "Starts from Melsysra in the Emerald Dream, hands in to Elianna" },
        { text = "Already own another magmammoth mount" },
        { text = "Fill the Dream Energy bar to 100% for 1 Dream Infusion", currencyID = 2777, amount = 1 },
        { text = "Buy Mammyth from Elianna at the Central Encampment, Emerald Dream" },
    },

    ["Imagiwing"] = {
        -- source: https://www.wowhead.com/quest=78386/emerald-reawakening
        { text = "Reach Renown 5 with the Dream Wardens" },
        { text = "Complete the quest \"Emerald Reawakening\" from Elianna", questID = 78386,
          start = "Starts from Melsysra in the Emerald Dream, hands in to Elianna" },
        { text = "Already own another shalewing mount" },
        { text = "Fill the Dream Energy bar to 100% for 1 Dream Infusion", currencyID = 2777, amount = 1 },
        { text = "Buy Imagiwing from Elianna at the Central Encampment, Emerald Dream" },
    },

    ["Salatrancer"] = {
        -- source: https://www.wowhead.com/quest=78386/emerald-reawakening
        { text = "Reach Renown 5 with the Dream Wardens" },
        { text = "Complete the quest \"Emerald Reawakening\" from Elianna", questID = 78386,
          start = "Starts from Melsysra in the Emerald Dream, hands in to Elianna" },
        { text = "Already own another salamanther mount" },
        { text = "Fill the Dream Energy bar to 100% for 1 Dream Infusion", currencyID = 2777, amount = 1 },
        { text = "Buy Salatrancer from Elianna at the Central Encampment, Emerald Dream" },
    },

    ----------------------------------------------------------------------
    -- ELEMENTAL OVERFLOW AND THE FORBIDDEN REACH
    ----------------------------------------------------------------------

    ["Stormhide Salamanther"] = {
        -- source: https://warcraft.wiki.gg/wiki/Mythressa
        { text = "Save up 2000 Elemental Overflow from Primal Storms and Primalist enemies", currencyID = 2118, amount = 2000 },
        { text = "Buy the mount from Mythressa in the Sapphire Enclave, Valdrakken" },
    },

    ["Noble Bruffalon"] = {
        -- source: https://warcraft.wiki.gg/wiki/Storykeeper_Ashekh
        { text = "Save up 100,000 Elemental Overflow", currencyID = 2118, amount = 100000 },
        { text = "Buy the mount from Storykeeper Ashekh in Morqut Village, The Forbidden Reach" },
    },

    ["Skyskin Hornstrider"] = {
        -- source: https://warcraft.wiki.gg/wiki/Skyskin_Hornstrider
        { text = "Farm 150 Essence of the Storm from the Storm's Fury event in the Primalist Future", itemID = 202039, count = 150 },
        { text = "Save up 3000 Elemental Overflow", currencyID = 2118, amount = 3000 },
        { text = "Buy the mount from Brendormi at the entrance to the Primalist Future" },
    },

    ["Gooey Snailemental"] = {
        -- source: https://warcraftmounts.com/patch10.0.7.php
        { text = "Run the Froststone Vault Primal Storm event in The Forbidden Reach repeatedly - it spawns every 2 hours with no lockout" },
        { text = "Collect 50 Leftover Elemental Slime from the event's final boss" },
        { text = "Combine the 50 Leftover Elemental Slime into the mount" },
    },

    ["Mossy Mammoth"] = {
        -- source: https://www.warcraftmounts.com/mounts/mossymammoth.php
        { text = "Unlock the Zskera Vaults in The Forbidden Reach and farm Zskera Vault Keys from rares" },
        { text = "Loot a Strange Petrified Orb and a Scrap of Black Dragonscales, and combine them into a Particularly Ordinary Egg" },
        { text = "Add a Drop of Blue Dragon Magic to make a Magically Altered Egg" },
        { text = "Add Everburning Ruby Coals to make an Egg of Unknown Contents" },
        { text = "Add a Speck of Bronze Dust to make a Sleeping Ancient Mammoth" },
        { text = "Add an Emerald Dragon Brooch to wake it - the last two pieces only appear in later vaults, so expect several weeks" },
    },

    ----------------------------------------------------------------------
    -- THE WAKING SHORES
    ----------------------------------------------------------------------

    ["Loyal Magmammoth"] = {
        -- source: https://warcraft.wiki.gg/wiki/Loyal_Magmammoth
        { text = "Reach True Friend standing with Sabellian, then buy the Netherforged Lavaproof Boots at the Obsidian Citadel" },
        { text = "Reach True Friend standing with Wrathion, then buy the Sturdy Obsidian Glasses at the Obsidian Citadel" },
        { text = "Trade both items to Yries Lightfingers atop the Obsidian Throne for a Magmammoth Harness" },
        { text = "Ride a tame magmammoth in the Waking Shores, then use the Magmammoth Harness on it" },
    },

    ["Magmashell"] = {
        -- source: https://www.warcraftmounts.com/mounts/magmashell.php
        { text = "Loot an Empty Magma Shell from Lavaslurpers south of the Obsidian Citadel, or buy one on the Auction House" },
        { text = "Find the Empowered Snail at the bottom of the lava pool at Scalecracker Keep in the Waking Shores" },
        { text = "Survive a 20-second channel on it while standing in the lava" },
    },

    ["Scrappy Worldsnail"] = {
        -- source: https://www.warcraftmounts.com/mounts/scrappyworldsnail.php
        { text = "Complete \"The Shadow of His Wings\" questline in the Waking Shores" },
        { text = "Run the repeatable quest \"Unlocking Our Past\" from Igys the Believer with Restored Obsidian Keys until a Twilight Cache gives you a Worldbreaker Membership" },
        { text = "Use the Worldbreaker Membership to unlock Dealer Vexil's stock" },
        { text = "Farm 1000 Magmote around the Obsidian Citadel", itemID = 202173, count = 1000 },
        { text = "Buy the Slumbering Worldsnail Shell from Dealer Vexil at the Smoldering Perch" },
    },

    ----------------------------------------------------------------------
    -- THE AZURE SPAN AND THALDRASZUS
    ----------------------------------------------------------------------

    ["Temperamental Skyclaw"] = {
        -- source: https://warcraft.wiki.gg/wiki/Temperamental_Skyclaw
        { text = "Collect 20 Flash Frozen Meat from the gnolls at Camp Nowhere" },
        { text = "Collect 20 Gnolan's House Special from the gnolls outside Brackenhide Hollow" },
        { text = "Collect 20 Tuskarr Jerky from the Darkhide gnolls north of the Azure Archives" },
        { text = "Hand all 60 items to Zon'Wogi at Three-Falls Lookout, The Azure Span" },
    },

    ["Explorer's Stonehide Packbeast"] = {
        -- source: https://warcraft.wiki.gg/wiki/Explorer's_Stonehide_Packbeast
        { text = "Save up 20,000 Mysterious Fragments from Azerothian Archives digs and events" },
        { text = "Buy the mount from Provisioner Aristta at Algeth'ar Academy, Thaldraszus" },
    },

    ----------------------------------------------------------------------
    -- DREAMSURGE
    ----------------------------------------------------------------------

    ["Duskwing Ohuna"] = {
        -- source: https://warcraft.wiki.gg/wiki/Dreamsurge_Coalescence
        { text = "Earn 1000 Dreamsurge Coalescence from world quests, rares and portals in the active Dreamsurge zone" },
        { text = "Buy the mount from Celestine of the Harvest in the active Dreamsurge zone" },
    },

    ["Renewed Magmammoth"] = {
        -- source: https://warcraft.wiki.gg/wiki/Renewed_Magmammoth
        { text = "Kill Waking Dream portal bosses during Dreamsurge for 20 Charred Elemental Remains" },
        { text = "Combine the 20 Charred Elemental Remains into the mount" },
    },

    ----------------------------------------------------------------------
    -- TIMEWALKING
    ----------------------------------------------------------------------

    ["Sandy Shalewing"] = {
        -- source: https://warcraft.wiki.gg/wiki/Sandy_Shalewing
        -- Originally the "Master of the Turbulent Timeways" reward during the
        -- first two Turbulent Timeways events; achievement ID not verified.
        { text = "Save up 5000 Timewarped Badges", currencyID = 1166, amount = 5000 },
        { text = "Buy the mount from any Timewalking vendor" },
    },
}
