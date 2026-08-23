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

    -- =================================================================
    -- SHADOWLANDS  (researched 2026-08-19)
    -- Names and IDs verified against the game's own client tables via
    -- wago.tools (Mount.db2, Faction.db2, Achievement.db2,
    -- CurrencyTypes.db2) after Wowhead rate-limited - stronger evidence
    -- than the guide pages, and it caught several item-vs-mount name
    -- traps (e.g. "Blanchy's Reins" is the ITEM; the mount is
    -- "Sinrunner Blanchy").
    -- Friendship-style reputations (Ve'nari, Archivists' Codex, Court of
    -- Night, Marasmius, The Countess) and Covenant Renown carry NO
    -- factionID - they don't use the 5-8 reaction scale.
    -- =================================================================
    -- ─────────────────────────────────────────────────────────────
    -- Multi-day / puzzle mounts
    -- ─────────────────────────────────────────────────────────────

    ["Sinrunner Blanchy"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Find Dead Blanchy in The Endmire, Revendreth (63.1, 43.1)" },
        { text = "Day 1: feed her Oats gathered in Westfall" },
        { text = "Day 2: bring the Grooming Brush from Snickersnee in Revendreth" },
        { text = "Day 3: bring a Horseshoe found around Revendreth" },
        { text = "Day 4: fill the Empty Water Bucket in Ardenweald and water her" },
        { text = "Day 5: bring the Comfortable Saddle Blanket from Ta'tru" },
        { text = "Day 6: bring a Dredhollow Apple from Mims" },
    },

    ["Patient Bufonid"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        -- source: https://warcraft.wiki.gg/wiki/The_Patient_Bufonid
        { text = "Complete the quest \"The Burrowed Bufonid\" (15 Vespoid Honey)",
          questID = 65727, start = "Starts from Avna at Haven in Zereth Mortis" },
        { text = "Next day: \"The Burrowed Bufonid\" (30 Tenebrous Ribs)",  questID = 65725 },
        { text = "Next day: \"The Burrowed Bufonid\" (200 Shrouded Cloth)", questID = 65726 },
        { text = "Next day: \"The Burrowed Bufonid\" (10 Elysian Thade)",   questID = 65728 },
        { text = "Next day: \"The Burrowed Bufonid\" (5 Protoflesh)",       questID = 65729 },
        { text = "Next day: \"The Burrowed Bufonid\" (5 Catalyzed Apple Pie)", questID = 65730 },
        { text = "Next day: \"The Burrowed Bufonid\" (1 Organic Melon from Tazavesh)", questID = 65731 },
        { text = "Complete the quest \"The Patient Bufonid\"", questID = 65732,
          start = "Starts from Avna in Zereth Mortis, offered right after the seventh day" },
    },

    ["Maelie, the Wanderer"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Find Maelie the Wanderer somewhere in Korthia and return her - she moves daily" },
        { text = "Return her on six separate days" },
    },

    ["Dusklight Razorwing"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Loot Lost Razorwing Eggs from Devourer mobs in Korthia (2 per day)",
          itemID = 187054 },
        { text = "Return six eggs to the Razorwing Nest in western Korthia" },
    },

    ["Darkmaul"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Loot Tasty Mawshroom from Invasive Mawshrooms around Korthia",
          itemID = 187153 },
        { text = "Feed Darkmaul at his den in northern Korthia on six separate days" },
    },

    ["Hand of Nilganihmaht"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        -- source: https://warcraft.wiki.gg/wiki/Gotta_Hand_It_To_Ya
        { text = "Get into the Rift phase of The Maw (Night Fae assault quest, or a Repaired Riftkey)",
          itemID = 186731 },
        { text = "Combine four Quartered Ancient Rings at Zovaal's Cauldron for Nilganihmaht's Stone Ring",
          itemID = 186603 },
        { text = "Loot Nilganihmaht's Runed Band from Torglluun in the Rift", itemID = 186605 },
        { text = "Collect four Seal Breaker Keys and open the Domination Sealed Chest for Nilganihmaht's Silver Ring",
          itemID = 186607 },
        { text = "Climb to Nilganihmaht's Gold Band above the Crucible of the Damned",
          itemID = 186608 },
        { text = "Loot Nilganihmaht's Signet Ring from Exos, Herald of Domination",
          itemID = 186606 },
        { text = "Complete the quest \"Gotta Hand It To Ya\"", questID = 64202,
          start = "Starts from Hand of Nilganihmaht in Forlorn Respite, The Maw (25.5, 36.8)" },
    },

    -- ─────────────────────────────────────────────────────────────
    -- Open-world achievement mounts
    -- ─────────────────────────────────────────────────────────────

    ["Cryptic Aurelid"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Earn the Zereth Mortis meta achievement \"From A to Zereth\"",
          achievementID = 15336 },
    },

    ["Hand of Salaranga"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Earn the Korthia / Maw meta achievement \"Breaking the Chains\"",
          achievementID = 15064 },
    },

    -- ─────────────────────────────────────────────────────────────
    -- Reputation mounts
    -- ─────────────────────────────────────────────────────────────

    ["Court Sinrunner"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Reach Exalted with the Court of Harvesters", factionID = 2413, reaction = 8 },
        { text = "Buy it from Mistress Mihaela in Revendreth" },
    },

    ["Gilded Prowler"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Reach Exalted with The Ascended", factionID = 2407, reaction = 8 },
        { text = "Buy it from Adjutant Nikos in Bastion" },
    },

    ["Inquisition Gargon"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Unlock the hidden faction The Avowed by handing in Sinstone Fragments in Revendreth" },
        { text = "Reach Exalted with The Avowed", factionID = 2439, reaction = 8 },
        { text = "Buy it from Archivist Janeera in Revendreth" },
    },

    ["Lurid Bloodtusk"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Reach Exalted with The Undying Army", factionID = 2410, reaction = 8 },
        { text = "Buy it from Nalcorn Talsen in Maldraxxus" },
    },

    ["Colossal Slaughterclaw"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Reach Exalted with The Undying Army", factionID = 2410, reaction = 8 },
        { text = "Keep earning reputation for Supplies of the Undying Army paragon caches",
          itemID = 180646 },
    },

    ["Duskflutter Ardenmoth"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Reach Exalted with The Wild Hunt", factionID = 2465, reaction = 8 },
        { text = "Buy it from Aithlyn in Ardenweald" },
    },

    ["Amber Ardenmoth"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Reach Exalted with The Wild Hunt", factionID = 2465, reaction = 8 },
        { text = "Keep earning reputation for Wild Hunt Supplies paragon caches",
          itemID = 180649 },
    },

    ["Amber Shardhide"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Reach Revered with Death's Advance", factionID = 2470, reaction = 7 },
        { text = "Save up 5,000 Stygia", currencyID = 1767, amount = 5000 },
        { text = "Buy it from Duchess Mynx in Korthia" },
    },

    ["Fierce Razorwing"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Reach Exalted with Death's Advance", factionID = 2470, reaction = 8 },
        { text = "Keep earning reputation for Death's Advance Supplies paragon caches",
          itemID = 186650 },
    },

    ["Beryl Shardhide"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Reach Exalted with Death's Advance", factionID = 2470, reaction = 8 },
        { text = "Keep earning reputation for Death's Advance Supplies paragon caches",
          itemID = 186650 },
    },

    ["Soulbound Gloomcharger"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Reach Appreciative (max) with Ve'nari in The Maw" },
        { text = "Keep earning reputation for Mysterious Gift from Ve'nari paragon caches",
          itemID = 187029 },
    },

    ["Soaring Razorwing"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Reach Tier 6 with The Archivists' Codex in Korthia" },
        { text = "Save up 5,000 Cataloged Research", currencyID = 1931, amount = 5000 },
        { text = "Buy it from Archivist Roh-Suir in Korthia" },
    },

    ["Tamed Mauler"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Reach Tier 6 with The Archivists' Codex in Korthia" },
        { text = "Keep earning research for Supplies of the Archivists' Codex paragon caches",
          itemID = 187028 },
    },

    ["Anointed Protostag"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Reach Revered with The Enlightened", factionID = 2478, reaction = 7 },
        { text = "Save up 5,000 Reservoir Anima", currencyID = 1813, amount = 5000 },
        { text = "Buy it from Vilo in Zereth Mortis" },
    },

    ["Heartlight Vombata"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Reach Exalted with The Enlightened", factionID = 2478, reaction = 8 },
        { text = "Save up 5,000 Reservoir Anima", currencyID = 1813, amount = 5000 },
        { text = "Buy it from Vilo in Zereth Mortis" },
    },

    ["Silky Shimmermoth"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Save up 5,000 Reservoir Anima", currencyID = 1813, amount = 5000 },
        { text = "Buy it from Master Clerk Salorn in Ardenweald" },
    },

    -- ─────────────────────────────────────────────────────────────
    -- Covenant sanctum features - obtainable by every covenant
    -- ─────────────────────────────────────────────────────────────

    ["Dauntless Duskrunner"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Kyrian: earn \"Disciple of Humility\" in the Path of Ascension, then buy it from Binkiros",
          achievementID = 14865 },
        { text = "Necrolord: unlock the Abomination Factory and buy it from Atticus" },
        { text = "Night Fae: plant a Divine Dutiful Spirit in the Queen's Conservatory",
          itemID = 178879 },
        { text = "Venthyr: reach Exalted with The Ember Court, then buy it from Temel",
          factionID = 2445, reaction = 8 },
    },

    ["Gruesome Flayedwing"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Kyrian: earn \"All The Colors of the Painbow\" in the Path of Ascension, then buy it from Binkiros",
          achievementID = 14853 },
        { text = "Necrolord: unlock the Abomination Factory and buy it from Atticus" },
        { text = "Night Fae: plant a Divine Martial Spirit in the Queen's Conservatory",
          itemID = 178878 },
        { text = "Venthyr: reach Exalted with The Ember Court, then buy it from Temel",
          factionID = 2445, reaction = 8 },
    },

    ["Pale Acidmaw"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Kyrian: earn \"Bare Necessities\" in the Path of Ascension, then buy it from Binkiros",
          achievementID = 14860 },
        { text = "Necrolord: unlock the Abomination Factory and buy it from Atticus" },
        { text = "Night Fae: plant a Divine Untamed Spirit in the Queen's Conservatory",
          itemID = 177700 },
        { text = "Venthyr: reach Exalted with The Ember Court, then buy it from Temel",
          factionID = 2445, reaction = 8 },
    },

    ["Silvertip Dredwing"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Kyrian: earn \"Curse of Thirst\" in the Path of Ascension, then buy it from Binkiros",
          achievementID = 14858 },
        { text = "Necrolord: unlock the Abomination Factory and buy it from Atticus" },
        { text = "Night Fae: plant a Divine Prideful Spirit in the Queen's Conservatory",
          itemID = 178884 },
        { text = "Venthyr: reach Exalted with The Ember Court, then buy it from Temel",
          factionID = 2445, reaction = 8 },
    },

    -- ─────────────────────────────────────────────────────────────
    -- Kyrian
    -- ─────────────────────────────────────────────────────────────

    ["Phalynx of Courage"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        -- source: https://warcraft.wiki.gg/wiki/Building_the_Base
        { text = "Join the Kyrian covenant" },
        { text = "Complete the quest \"Building the Base\" (Kyrian Campaign chapter 3)",
          questID = 58181, start = "Starts from Mikanikos in Elysian Hold, Bastion" },
    },

    ["Eternal Phalynx of Courage"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        -- source: https://warcraft.wiki.gg/wiki/A_New_Age
        { text = "Join the Kyrian covenant" },
        { text = "Complete the quest \"A New Age\" (Kyrian Campaign chapter 6)",
          questID = 61697, start = "Starts from Polemarch Adrestes in Elysian Hold, Bastion" },
    },

    ["Phalynx of Humility"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Kyrian covenant" },
        { text = "Unlock the Anima Conductor and channel it into the Temple of Purity, then loot the Burden of Penitence treasure" },
        { text = "Or buy it from Adjutant Galos in Elysian Hold once Renown unlocks it" },
    },

    ["Phalynx of Purity"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Kyrian covenant" },
        { text = "Reach Renown 23 with the Kyrian" },
        { text = "Buy it from Adjutant Galos in Elysian Hold, Bastion" },
    },

    ["Eternal Phalynx of Purity"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Kyrian covenant" },
        { text = "Reach Renown 39 with the Kyrian" },
        { text = "Buy it from Adjutant Galos in Elysian Hold, Bastion" },
    },

    ["Elysian Aquilon"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Kyrian covenant" },
        { text = "Reach Renown 45 with the Kyrian" },
        { text = "Buy it from Adjutant Galos in Elysian Hold, Bastion" },
    },

    ["Ascendant's Aquilon"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Kyrian covenant" },
        { text = "Reach Renown 70 with the Kyrian" },
        { text = "Save up 7,500 Reservoir Anima", currencyID = 1813, amount = 7500 },
        { text = "Buy it from Adjutant Galos in Elysian Hold, Bastion" },
    },

    ["Phalynx of Loyalty"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Kyrian covenant and unlock the Path of Ascension" },
        { text = "Defeat Mad Mortimer on Loyalty difficulty" },
        { text = "Buy it from Binkiros in Elysian Hold, Bastion" },
    },

    ["Eternal Phalynx of Loyalty"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Kyrian covenant and unlock the Path of Ascension" },
        { text = "Earn \"Death Foursworn\"", achievementID = 14863 },
        { text = "Buy it from Binkiros in Elysian Hold, Bastion" },
    },

    ["Eternal Phalynx of Humility"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Kyrian covenant and unlock the Path of Ascension" },
        { text = "Earn \"Learning from the Masters\"", achievementID = 14861 },
        { text = "Buy it from Binkiros in Elysian Hold, Bastion" },
    },

    ["Battle-Hardened Aquilon"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Be a member of the Kyrian covenant" },
        { text = "Earn \"On the Offensive\" in Korthia", achievementID = 15035 },
        { text = "Reach Exalted with Death's Advance", factionID = 2470, reaction = 8 },
        { text = "Save up 1,000 Stygia", currencyID = 1767, amount = 1000 },
        { text = "Buy it from Duchess Mynx in Korthia" },
    },

    -- ─────────────────────────────────────────────────────────────
    -- Necrolord
    -- ─────────────────────────────────────────────────────────────

    ["War-Bred Tauralus"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        -- source: https://warcraft.wiki.gg/wiki/Enemy_at_the_Door
        { text = "Join the Necrolord covenant" },
        { text = "Complete the quest \"Enemy at the Door\" (Necrolord Campaign chapter 2)",
          questID = 59555, start = "Starts from Baroness Draka at the Seat of the Primus, Maldraxxus" },
    },

    ["Armored War-Bred Tauralus"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        -- source: https://warcraft.wiki.gg/wiki/The_Third_Fall_of_Kel%27Thuzad
        { text = "Join the Necrolord covenant" },
        { text = "Complete the quest \"The Third Fall of Kel'Thuzad\" (final Necrolord Campaign chapter)",
          questID = 59020, start = "Starts from Baroness Draka in Maldraxxus (62.2, 41.0)" },
    },

    ["Armored Bonehoof Tauralus"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Necrolord covenant" },
        { text = "Channel your Anima Conductor (level 3) into the Theater of Pain, then kill Sabriel the Bonecleaver" },
        { text = "Or buy it from Su Zettai in Seat of the Primus once Renown unlocks it" },
    },

    ["Plaguerot Tauralus"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Necrolord covenant" },
        { text = "Reach Renown 23 with the Necrolords" },
        { text = "Buy it from Su Zettai in Maldraxxus" },
    },

    ["Armored Plaguerot Tauralus"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Necrolord covenant" },
        { text = "Reach Renown 39 with the Necrolords" },
        { text = "Save up 3,000 Reservoir Anima", currencyID = 1813, amount = 3000 },
        { text = "Buy it from Su Zettai in Maldraxxus" },
    },

    ["Maldraxxian Corpsefly"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Necrolord covenant" },
        { text = "Reach Renown 45 with the Necrolords" },
        { text = "Buy it from Su Zettai in Maldraxxus" },
    },

    ["Regal Corpsefly"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Necrolord covenant" },
        { text = "Reach Renown 70 with the Necrolords" },
        { text = "Save up 7,500 Reservoir Anima", currencyID = 1813, amount = 7500 },
        { text = "Buy it from Su Zettai in Maldraxxus" },
    },

    ["Bonesewn Fleshroc"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Necrolord covenant and unlock Abomination Stitching" },
        { text = "Raise Abomination Stitching to its final tier (level 5)" },
        { text = "Gather 50 Malleable Flesh and Superior Parts, then stitch it" },
    },

    ["Chosen Tauralus"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Necrolord covenant and unlock Abomination Stitching" },
        { text = "Earn \"The Gang's All Here\"", achievementID = 14751 },
    },

    ["Armored Chosen Tauralus"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Necrolord covenant and unlock Abomination Stitching" },
        { text = "Earn \"Things To Do When You're Dead\"", achievementID = 14752 },
    },

    ["Battlefield Swarmer"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Be a member of the Necrolord covenant" },
        { text = "Earn \"On the Offensive\" in Korthia", achievementID = 15035 },
        { text = "Reach Exalted with Death's Advance", factionID = 2470, reaction = 8 },
        { text = "Save up 1,000 Stygia", currencyID = 1767, amount = 1000 },
        { text = "Buy it from Duchess Mynx in Korthia" },
    },

    -- ─────────────────────────────────────────────────────────────
    -- Night Fae
    -- ─────────────────────────────────────────────────────────────

    ["Dreamlight Runestag"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        -- source: https://warcraft.wiki.gg/wiki/What%27s_My_Motivation%3F
        { text = "Join the Night Fae covenant" },
        { text = "Complete the quest \"What's My Motivation?\" (Night Fae Campaign chapter 1)",
          questID = 58159, start = "Starts from Featherlight in Ardenweald (40.7, 42.8)" },
    },

    ["Enchanted Dreamlight Runestag"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        -- source: https://warcraft.wiki.gg/wiki/Drust_and_Ashes
        { text = "Join the Night Fae covenant" },
        { text = "Complete the quest \"Drust and Ashes\" (final Night Fae Campaign chapter)",
          questID = 60108, start = "Starts from Lord Herne in Ardenweald (38.9, 63.4)" },
    },

    ["Wild Glimmerfur Prowler"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Night Fae covenant" },
        { text = "Kill Valfir the Unrelenting in Tirna Scithe (channel the Anima Conductor there to strip his immunity)" },
        { text = "Or buy it from Elwyn in the Heart of the Forest once Renown unlocks it" },
    },

    ["Shadeleaf Runestag"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Night Fae covenant" },
        { text = "Reach Renown 23 with the Night Fae" },
        { text = "Buy it from Elwyn in Ardenweald" },
    },

    ["Enchanted Shadeleaf Runestag"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Night Fae covenant" },
        { text = "Reach Renown 39 with the Night Fae" },
        { text = "Buy it from Elwyn in Ardenweald" },
    },

    ["Ardenweald Wilderling"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Night Fae covenant" },
        { text = "Reach Renown 45 with the Night Fae" },
        { text = "Buy it from Elwyn in Ardenweald" },
    },

    ["Autumnal Wilderling"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Night Fae covenant" },
        { text = "Reach Renown 70 with the Night Fae" },
        { text = "Save up 7,500 Reservoir Anima", currencyID = 1813, amount = 7500 },
        { text = "Buy it from Elwyn in Ardenweald" },
    },

    ["Umbral Scythehorn"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Night Fae covenant" },
        { text = "Reach Revered with the Court of Night" },
        { text = "Buy it from Spindlenose in Ardenweald" },
    },

    ["Winterborn Runestag"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Night Fae covenant" },
        { text = "Reach Revered with the Court of Night" },
        { text = "Buy it from Spindlenose in Ardenweald" },
    },

    ["Vibrant Flutterwing"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Night Fae covenant" },
        { text = "Reach Revered with Marasmius" },
        { text = "Buy it from Cortinarius in Ardenweald" },
    },

    ["Enchanted Winterborn Runestag"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Night Fae covenant" },
        { text = "Reach Revered with Marasmius" },
        { text = "Buy it from Cortinarius in Ardenweald" },
    },

    ["Wakener's Runestag"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Night Fae covenant and unlock the Queen's Conservatory" },
        { text = "Plant a Greater Untamed Spirit with 2 catalysts", itemID = 177699 },
        { text = "Open the Queen's Conservatory Cache for a chance at the mount" },
    },

    ["Enchanted Wakener's Runestag"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Night Fae covenant and unlock the Queen's Conservatory" },
        { text = "Plant a Divine Untamed Spirit with 4 catalysts", itemID = 177700 },
        { text = "Open the Queen's Conservatory Cache for a chance at the mount" },
    },

    ["Winter Wilderling"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Be a member of the Night Fae covenant" },
        { text = "Earn \"On the Offensive\" in Korthia", achievementID = 15035 },
        { text = "Reach Exalted with Death's Advance", factionID = 2470, reaction = 8 },
        { text = "Save up 1,000 Stygia", currencyID = 1767, amount = 1000 },
        { text = "Buy it from Duchess Mynx in Korthia" },
    },

    -- ─────────────────────────────────────────────────────────────
    -- Venthyr
    -- ─────────────────────────────────────────────────────────────

    ["Crypt Gargon"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        -- source: https://warcraft.wiki.gg/wiki/Mirror,_Mirror...
        { text = "Join the Venthyr covenant" },
        { text = "Complete the quest \"Mirror, Mirror...\" (Venthyr Campaign chapter 4)",
          questID = 58440, start = "Starts from The Curator in Revendreth" },
    },

    ["Battle Gargon Vrednic"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        -- source: https://warcraft.wiki.gg/wiki/The_Medallion_of_Dominion
        { text = "Join the Venthyr covenant" },
        { text = "Complete the quest \"The Medallion of Dominion\" (final Venthyr Campaign chapter)",
          questID = 58407, start = "Starts from General Draven" },
    },

    ["Horrid Dredwing"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Venthyr covenant" },
        { text = "Channel your Anima Conductor onto Wanecrypt Hill, then kill Harika the Horrid" },
        { text = "Or buy it from Chachi the Artiste in Sinfall once Renown unlocks it" },
    },

    ["Sinfall Gargon"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Venthyr covenant" },
        { text = "Reach Renown 23 with the Venthyr" },
        { text = "Buy it from Chachi the Artiste in Sinfall" },
    },

    ["Gravestone Battle Gargon"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Venthyr covenant" },
        { text = "Reach Renown 39 with the Venthyr" },
        { text = "Buy it from Chachi the Artiste in Sinfall" },
    },

    ["Sinfall Gravewing"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Venthyr covenant" },
        { text = "Reach Renown 45 with the Venthyr" },
        { text = "Buy it from Chachi the Artiste in Sinfall" },
    },

    ["Obsidian Gravewing"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Venthyr covenant" },
        { text = "Reach Renown 70 with the Venthyr" },
        { text = "Save up 7,500 Reservoir Anima", currencyID = 1813, amount = 7500 },
        { text = "Buy it from Chachi the Artiste in Sinfall" },
    },

    ["Desire's Battle Gargon"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Venthyr covenant and unlock the Ember Court" },
        { text = "Reach Best Friends with The Countess" },
        { text = "Get her mood to Very Happy or Elated at an Ember Court, then open The Countess' Tribute" },
    },

    ["Battle Gargon Silessa"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Join the Venthyr covenant" },
        { text = "Raise the Mirror Network (Blood Mirror) to tier 3 to open the hidden rooms" },
        { text = "Keep repairing Revendreth mirrors for a chance at the mount" },
    },

    ["Pale Gravewing"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Be a member of the Venthyr covenant" },
        { text = "Earn \"On the Offensive\" in Korthia", achievementID = 15035 },
        { text = "Reach Exalted with Death's Advance", factionID = 2470, reaction = 8 },
        { text = "Save up 1,000 Stygia", currencyID = 1767, amount = 1000 },
        { text = "Buy it from Duchess Mynx in Korthia" },
    },

    -- ─────────────────────────────────────────────────────────────
    -- Covenant Callings - Necroray eggs
    -- ─────────────────────────────────────────────────────────────

    ["Bulbous Necroray"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Complete Covenant Callings until a Tribute cache contains a Necroray Egg",
          itemID = 184159 },
        { text = "Keep the egg for 3 days until it becomes an Oozing Necroray Egg, then open it",
          itemID = 184158 },
    },

    ["Infested Necroray"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Complete Covenant Callings until a Tribute cache contains a Necroray Egg",
          itemID = 184159 },
        { text = "Keep the egg for 3 days until it becomes an Oozing Necroray Egg, then open it",
          itemID = 184158 },
    },

    ["Pestilent Necroray"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Complete Covenant Callings until a Tribute cache contains a Necroray Egg",
          itemID = 184159 },
        { text = "Keep the egg for 3 days until it becomes an Oozing Necroray Egg, then open it",
          itemID = 184158 },
    },

    -- ─────────────────────────────────────────────────────────────
    -- Torghast
    -- ─────────────────────────────────────────────────────────────

    ["Corridor Creeper"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Complete Twisting Corridors layers 1 through 8 in Torghast",
          achievementID = 14570 },
    },

    ["Mawsworn Charger"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Earn \"Flawless Master (Layer 12)\" in Torghast", achievementID = 15089 },
    },

    ["Colossal Ebonclaw Mawrat"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Complete \"The Jailer's Gauntlet: Layer 4\"", achievementID = 15254 },
    },

    ["Colossal Soulshredder Mawrat"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Earn \"Flawless Master (Layer 16)\" in Torghast", achievementID = 15322 },
    },

    -- ─────────────────────────────────────────────────────────────
    -- Dungeons and raids
    -- ─────────────────────────────────────────────────────────────

    ["Voracious Gorger"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Earn the meta achievement \"Glory of the Shadowlands Hero\"",
          achievementID = 14322 },
    },

    ["Tazavesh Gearglider"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Clear Tazavesh, the Veiled Market on Hard Mode for \"Fake It 'Til You Make It\"",
          achievementID = 15178 },
    },

    ["Sintouched Deathwalker"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Earn \"Shadowlands Keystone Master: Season One\"", achievementID = 14532 },
    },

    ["Soultwisted Deathwalker"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Earn \"Shadowlands Keystone Master: Season Two\"", achievementID = 15078 },
    },

    ["Wastewarped Deathwalker"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Earn \"Shadowlands Keystone Master: Season Three\"", achievementID = 15499 },
    },

    ["Restoration Deathwalker"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Earn \"Shadowlands Keystone Master: Season Four\"", achievementID = 15690 },
    },

    ["Rampart Screecher"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Earn the meta achievement \"Glory of the Nathria Raider\"",
          achievementID = 14355 },
    },

    ["Hand of Hrestimorak"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Earn the meta achievement \"Glory of the Dominant Raider\"",
          achievementID = 15130 },
    },

    ["Shimmering Aurelid"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Earn the meta achievement \"Glory of the Sepulcher Raider\"",
          achievementID = 15491 },
    },

    ["Jigglesworth Sr."] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        { text = "Defeat every boss in all three Shadowlands raids while Fated",
          achievementID = 15684 },
    },

    -- ─────────────────────────────────────────────────────────────
    -- PvP
    -- ─────────────────────────────────────────────────────────────

    ["Sinful Gladiator's Soul Eater"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-pvp-rewards-mounts
        { text = "Earn \"Gladiator: Shadowlands Season 1\"", achievementID = 14689 },
    },

    ["Unchained Gladiator's Soul Eater"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-pvp-rewards-mounts
        { text = "Earn \"Gladiator: Shadowlands Season 2\"", achievementID = 14972 },
    },

    ["Cosmic Gladiator's Soul Eater"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-pvp-rewards-mounts
        { text = "Earn \"Gladiator: Shadowlands Season 3\"", achievementID = 15352 },
    },

    ["Eternal Gladiator's Soul Eater"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-pvp-rewards-mounts
        { text = "Earn \"Gladiator: Shadowlands Season 4\"", achievementID = 15605 },
    },

    -- ─────────────────────────────────────────────────────────────
    -- Racial mounts added in 9.2.5
    -- ─────────────────────────────────────────────────────────────

    ["Grimhowl"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        -- source: https://warcraft.wiki.gg/wiki/Good_Fiery_Boy
        { text = "Play a Dark Iron Dwarf of at least level 50" },
        { text = "Complete the Dark Iron Dwarf heritage questline up to \"Good Fiery Boy\"",
          questID = 65564, start = "Starts from Kasea Angerforge in Shadowforge City, Blackrock Depths" },
    },

    ["Elusive Emerald Hawkstrider"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        -- source: https://warcraft.wiki.gg/wiki/Victory_for_the_Sin%27dorei
        { text = "Play a Blood Elf of at least level 60" },
        { text = "Reach Exalted with Silvermoon City", factionID = 911, reaction = 8 },
        { text = "Complete the Blood Elf questline through \"Victory for the Sin'dorei\"",
          questID = 65653, start = "Starts from Lady Liadrin in the Ghostlands" },
    },

    -- ─────────────────────────────────────────────────────────────
    -- Protoform Synthesis (Zereth Mortis crafting)
    --
    -- Every one of these needs the crafting feature unlocked first: pet
    -- synthesis comes from the Dealic Understanding cypher research, and the
    -- mount half is unlocked by "A New Architect".  After that it is find the
    -- schematic, gather Genesis Motes and the lattice, and synthesize it.
    -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
    -- source: https://warcraft.wiki.gg/wiki/A_New_Architect
    -- ─────────────────────────────────────────────────────────────

    ["Deathrunner"] = {
        { text = "Unlock pet synthesis with the Dealic Understanding cypher research in Zereth Mortis" },
        { text = "Complete the quest \"A New Architect\" - it unlocks mount synthesis and rewards this schematic",
          questID = 65427, start = "Starts from the Servitor Interface in the Protoform Repository, Zereth Mortis" },
        { text = "Gather the Genesis Motes and lattice, then synthesize it" },
    },

    ["Pale Regal Cervid"] = {
        { text = "Unlock pet synthesis with the Dealic Understanding cypher research in Zereth Mortis" },
        { text = "Complete the quest \"A New Architect\" to unlock mount synthesis", questID = 65427,
          start = "Starts from the Servitor Interface in the Protoform Repository, Zereth Mortis" },
        { text = "Finish the cypher research meta achievement \"Cyphers of the First Ones\" for the schematic",
          achievementID = 15402 },
        { text = "Gather the Genesis Motes and lattice, then synthesize it" },
    },

    ["Adorned Vombata"] = {
        { text = "Unlock pet synthesis with the Dealic Understanding cypher research in Zereth Mortis" },
        { text = "Complete the quest \"A New Architect\" to unlock mount synthesis", questID = 65427,
          start = "Starts from the Servitor Interface in the Protoform Repository, Zereth Mortis" },
        { text = "Loot the schematic from the Grateful Boon treasure in Zereth Mortis (36.9, 78.2)" },
        { text = "Gather 450 Genesis Motes, a Lens of Focused Intention and a Vombata Lattice, then synthesize it" },
    },

    ["Darkened Vombata"] = {
        { text = "Unlock pet synthesis with the Dealic Understanding cypher research in Zereth Mortis" },
        { text = "Complete the quest \"A New Architect\" to unlock mount synthesis", questID = 65427,
          start = "Starts from the Servitor Interface in the Protoform Repository, Zereth Mortis" },
        { text = "Find the schematic as overworld loot in Zereth Mortis" },
        { text = "Gather the Genesis Motes and lattice, then synthesize it" },
    },

    ["Bronze Helicid"] = {
        { text = "Unlock pet synthesis with the Dealic Understanding cypher research in Zereth Mortis" },
        { text = "Complete the quest \"A New Architect\" to unlock mount synthesis", questID = 65427,
          start = "Starts from the Servitor Interface in the Protoform Repository, Zereth Mortis" },
        { text = "Open Tribute of the Enlightened Elders for a chance at the schematic",
          itemID = 190610 },
        { text = "Gather the Genesis Motes and lattice, then synthesize it" },
    },

    ["Scarlet Helicid"] = {
        { text = "Unlock pet synthesis with the Dealic Understanding cypher research in Zereth Mortis" },
        { text = "Complete the quest \"A New Architect\" to unlock mount synthesis", questID = 65427,
          start = "Starts from the Servitor Interface in the Protoform Repository, Zereth Mortis" },
        { text = "Find the schematic as overworld loot in Zereth Mortis" },
        { text = "Gather the Genesis Motes and lattice, then synthesize it" },
    },

    ["Bronzewing Vespoid"] = {
        { text = "Unlock pet synthesis with the Dealic Understanding cypher research in Zereth Mortis" },
        { text = "Complete the quest \"A New Architect\" to unlock mount synthesis", questID = 65427,
          start = "Starts from the Servitor Interface in the Protoform Repository, Zereth Mortis" },
        { text = "Find the schematic as overworld loot in Zereth Mortis" },
        { text = "Gather the Genesis Motes and lattice, then synthesize it" },
    },

    ["Vespoid Flutterer"] = {
        { text = "Unlock pet synthesis with the Dealic Understanding cypher research in Zereth Mortis" },
        { text = "Complete the quest \"A New Architect\" to unlock mount synthesis", questID = 65427,
          start = "Starts from the Servitor Interface in the Protoform Repository, Zereth Mortis" },
        { text = "Find the schematic as overworld loot in Zereth Mortis" },
        { text = "Gather the Genesis Motes and lattice, then synthesize it" },
    },

    ["Buzz"] = {
        { text = "Unlock pet synthesis with the Dealic Understanding cypher research in Zereth Mortis" },
        { text = "Complete the quest \"A New Architect\" to unlock mount synthesis", questID = 65427,
          start = "Starts from the Servitor Interface in the Protoform Repository, Zereth Mortis" },
        { text = "Kill the Pulp-Covered Relic in Zereth Mortis for a chance at the schematic" },
        { text = "Gather the Genesis Motes and lattice, then synthesize it" },
    },

    ["Curious Crystalsniffer"] = {
        { text = "Unlock pet synthesis with the Dealic Understanding cypher research in Zereth Mortis" },
        { text = "Complete the quest \"A New Architect\" to unlock mount synthesis", questID = 65427,
          start = "Starts from the Servitor Interface in the Protoform Repository, Zereth Mortis" },
        { text = "Find its schematic in Zereth Mortis" },
        { text = "Gather the Genesis Motes and lattice, then synthesize it" },
    },

    ["Forged Spiteflyer"] = {
        { text = "Unlock pet synthesis with the Dealic Understanding cypher research in Zereth Mortis" },
        { text = "Complete the quest \"A New Architect\" to unlock mount synthesis", questID = 65427,
          start = "Starts from the Servitor Interface in the Protoform Repository, Zereth Mortis" },
        { text = "Find the schematic as overworld loot in Zereth Mortis" },
        { text = "Gather the Genesis Motes and lattice, then synthesize it" },
    },

    ["Genesis Crawler"] = {
        { text = "Unlock pet synthesis with the Dealic Understanding cypher research in Zereth Mortis" },
        { text = "Complete the quest \"A New Architect\" to unlock mount synthesis", questID = 65427,
          start = "Starts from the Servitor Interface in the Protoform Repository, Zereth Mortis" },
        { text = "Find the schematic as overworld loot in Zereth Mortis" },
        { text = "Gather the Genesis Motes and lattice, then synthesize it" },
    },

    ["Goldplate Bufonid"] = {
        { text = "Unlock pet synthesis with the Dealic Understanding cypher research in Zereth Mortis" },
        { text = "Complete the quest \"A New Architect\" to unlock mount synthesis", questID = 65427,
          start = "Starts from the Servitor Interface in the Protoform Repository, Zereth Mortis" },
        { text = "Find the schematic as overworld loot in Zereth Mortis" },
        { text = "Gather the Genesis Motes and lattice, then synthesize it" },
    },

    ["Russet Bufonid"] = {
        { text = "Unlock pet synthesis with the Dealic Understanding cypher research in Zereth Mortis" },
        { text = "Complete the quest \"A New Architect\" to unlock mount synthesis", questID = 65427,
          start = "Starts from the Servitor Interface in the Protoform Repository, Zereth Mortis" },
        { text = "Open Enlightened Broker Supplies for a chance at the schematic", itemID = 187780 },
        { text = "Gather the Genesis Motes and lattice, then synthesize it" },
    },

    ["Heartbond Lupine"] = {
        { text = "Unlock pet synthesis with the Dealic Understanding cypher research in Zereth Mortis" },
        { text = "Complete the quest \"A New Architect\" to unlock mount synthesis", questID = 65427,
          start = "Starts from the Servitor Interface in the Protoform Repository, Zereth Mortis" },
        { text = "Kill the Accelerated Bufonid in Zereth Mortis for the schematic" },
        { text = "Gather the Genesis Motes and lattice, then synthesize it" },
    },

    ["Ineffable Skitterer"] = {
        { text = "Unlock pet synthesis with the Dealic Understanding cypher research in Zereth Mortis" },
        { text = "Complete the quest \"A New Architect\" to unlock mount synthesis", questID = 65427,
          start = "Starts from the Servitor Interface in the Protoform Repository, Zereth Mortis" },
        { text = "Kill the Maw-Frenzied Lupine in Zereth Mortis for the schematic" },
        { text = "Gather the Genesis Motes and lattice, then synthesize it" },
    },

    ["Mawdapted Raptora"] = {
        { text = "Unlock pet synthesis with the Dealic Understanding cypher research in Zereth Mortis" },
        { text = "Complete the quest \"A New Architect\" to unlock mount synthesis", questID = 65427,
          start = "Starts from the Servitor Interface in the Protoform Repository, Zereth Mortis" },
        { text = "Find its schematic in Zereth Mortis" },
        { text = "Gather the Genesis Motes and lattice, then synthesize it" },
    },

    ["Raptora Swooper"] = {
        { text = "Unlock pet synthesis with the Dealic Understanding cypher research in Zereth Mortis" },
        { text = "Complete the quest \"A New Architect\" to unlock mount synthesis", questID = 65427,
          start = "Starts from the Servitor Interface in the Protoform Repository, Zereth Mortis" },
        { text = "Find the schematic as overworld loot in Zereth Mortis" },
        { text = "Gather the Genesis Motes and lattice, then synthesize it" },
    },

    ["Prototype Leaper"] = {
        { text = "Unlock pet synthesis with the Dealic Understanding cypher research in Zereth Mortis" },
        { text = "Complete the quest \"A New Architect\" to unlock mount synthesis", questID = 65427,
          start = "Starts from the Servitor Interface in the Protoform Repository, Zereth Mortis" },
        { text = "Find the schematic as overworld loot in Zereth Mortis" },
        { text = "Gather the Genesis Motes and lattice, then synthesize it" },
    },

    ["Serenade"] = {
        { text = "Unlock pet synthesis with the Dealic Understanding cypher research in Zereth Mortis" },
        { text = "Complete the quest \"A New Architect\" to unlock mount synthesis", questID = 65427,
          start = "Starts from the Servitor Interface in the Protoform Repository, Zereth Mortis" },
        { text = "Find its schematic in Zereth Mortis" },
        { text = "Gather the Genesis Motes and lattice, then synthesize it" },
    },

    ["Sundered Zerethsteed"] = {
        { text = "Unlock pet synthesis with the Dealic Understanding cypher research in Zereth Mortis" },
        { text = "Complete the quest \"A New Architect\" to unlock mount synthesis", questID = 65427,
          start = "Starts from the Servitor Interface in the Protoform Repository, Zereth Mortis" },
        { text = "Open Mawsworn Cache treasures in Zereth Mortis for a chance at the schematic" },
        { text = "Gather the Genesis Motes and lattice, then synthesize it" },
    },

    ["Tarachnid Creeper"] = {
        { text = "Unlock pet synthesis with the Dealic Understanding cypher research in Zereth Mortis" },
        { text = "Complete the quest \"A New Architect\" to unlock mount synthesis", questID = 65427,
          start = "Starts from the Servitor Interface in the Protoform Repository, Zereth Mortis" },
        { text = "Find the schematic as overworld loot in Zereth Mortis" },
        { text = "Gather the Genesis Motes and lattice, then synthesize it" },
    },

    ["Unsuccessful Prototype Fleetpod"] = {
        { text = "Unlock pet synthesis with the Dealic Understanding cypher research in Zereth Mortis" },
        { text = "Complete the quest \"A New Architect\" to unlock mount synthesis", questID = 65427,
          start = "Starts from the Servitor Interface in the Protoform Repository, Zereth Mortis" },
        { text = "Win the Locus Shift minigame in Zereth Mortis for the schematic" },
        { text = "Gather the Genesis Motes and lattice, then synthesize it" },
    },

    -- ─────────────────────────────────────────────────────────────
    -- Event
    -- ─────────────────────────────────────────────────────────────

    ["Illidari Doomhawk"] = {
        -- source: https://www.wowhead.com/guide/shadowlands-mount-guide-10510
        availability = "WoW's Anniversary",
        { text = "Wait for the WoW Anniversary event, then kill Doomwalker in Tanaris" },
    },

    -- =================================================================
    -- LEGION  (researched 2026-08-19)
    -- Every ID cross-checked against Wowhead's live tooltip endpoint, and
    -- each mount's journal name resolved through its mount spell rather
    -- than trusting the item name. That pass caught real errors in
    -- secondary sources - the wiki's own Questbox for "Fate of the
    -- Nightborne" cites 42229, which is a different quest entirely.
    -- WoW Remix: Legion content is deliberately absent - that event is
    -- closed and lives in Unobtainable.lua.
    -- =================================================================
    -- =====================================================================
    -- CLASS HALL MOUNTS
    -- Every class mount needs the same two gates first: finish your Order Hall
    -- campaign, then finish the Legionfall campaign on the Broken Shore.
    -- source: https://warcraft.wiki.gg/wiki/Class_mount
    -- source: https://warcraft.wiki.gg/wiki/Breaching_the_Tomb
    -- =====================================================================

    ["Deathlord's Vilebrood Vanquisher"] = {
        -- source: https://warcraft.wiki.gg/wiki/The_Lost_Glacier_(quest)
        { text = "Complete your class Order Hall campaign",                achievementID = 10994 },
        { text = "Complete the Legionfall campaign on the Broken Shore",   achievementID = 11546 },
        { text = "Complete the quest \"Draconic Secrets\"",                questID = 46812 },
        { text = "Complete the quest \"The Lost Glacier\"",                questID = 46813 },
    },

    ["Slayer's Felbroken Shrieker"] = {
        -- source: https://warcraft.wiki.gg/wiki/To_Fel_and_Back_(quest)
        { text = "Complete your class Order Hall campaign",                achievementID = 10994 },
        { text = "Complete the Legionfall campaign on the Broken Shore",   achievementID = 11546 },
        { text = "Complete the quest \"To Fel and Back\"",                 questID = 46334,
          start = "Starts from Matron Mother Malevolence in the Fel Hammer" },
    },

    ["Archdruid's Lunarwing Form"] = {
        -- source: https://warcraft.wiki.gg/wiki/You_Can%27t_Take_the_Sky_from_Me
        { text = "Complete your class Order Hall campaign",                achievementID = 10994 },
        { text = "Complete the Legionfall campaign on the Broken Shore",   achievementID = 11546 },
        { text = "Complete the quest \"You Can't Take the Sky from Me\"",  questID = 46319,
          start = "Starts from Thisalee Crow in the Dreamgrove" },
    },

    ["Huntmaster's Loyal Wolfhawk"] = {
        -- source: https://warcraft.wiki.gg/wiki/Night_of_the_Wilds
        { text = "Complete your class Order Hall campaign",                achievementID = 10994 },
        { text = "Complete the Legionfall campaign on the Broken Shore",   achievementID = 11546 },
        { text = "Complete the quest \"A Golden Ticket\"",                 questID = 46336,
          start = "Starts from Nimi Brightcastle on the Broken Shore" },
        { text = "Complete the quest \"Night of the Wilds\"",              questID = 46337,
          start = "Starts from the Golden Letter in Trueshot Lodge" },
    },

    ["Archmage's Prismatic Disc"] = {
        -- source: https://warcraft.wiki.gg/wiki/Dispersion_of_the_Discs
        { text = "Complete your class Order Hall campaign",                achievementID = 10994 },
        { text = "Complete the Legionfall campaign on the Broken Shore",   achievementID = 11546 },
        { text = "Complete the quest \"Dispersion of the Discs\"",         questID = 45354,
          start = "Starts from Archmage Kalec in the Hall of the Guardian" },
    },

    ["Ban-Lu, Grandmaster's Companion"] = {
        -- source: https://warcraft.wiki.gg/wiki/The_Trial_of_Ban-Lu
        { text = "Complete your class Order Hall campaign",                achievementID = 10994 },
        { text = "Complete the Legionfall campaign on the Broken Shore",   achievementID = 11546 },
        { text = "Complete the quest \"The Trial of Ban-Lu\"",             questID = 46350,
          start = "Starts from Waterspeaker Ryuli in Kun-Lai Summit" },
    },

    ["Highlord's Golden Charger"] = {
        -- source: https://warcraft.wiki.gg/wiki/Stirring_in_the_Shadows
        { text = "Complete your class Order Hall campaign",                achievementID = 10994 },
        { text = "Complete the Legionfall campaign on the Broken Shore",   achievementID = 11546 },
        { text = "Complete the quest \"Stirring in the Shadows\"",         questID = 45770,
          start = "Starts from Lord Grayson Shadowbreaker in the Sanctum of Light" },
    },

    ["High Priest's Lightsworn Seeker"] = {
        -- source: https://warcraft.wiki.gg/wiki/The_Sunken_Vault_(quest)
        { text = "Complete your class Order Hall campaign",                achievementID = 10994 },
        { text = "Complete the Legionfall campaign on the Broken Shore",   achievementID = 11546 },
        { text = "Complete the quest \"The Sunken Vault\"",                questID = 45789,
          start = "Starts from Betild Deepanvil in the Netherlight Temple" },
    },

    ["Shadowblade's Murderous Omen"] = {
        -- source: https://warcraft.wiki.gg/wiki/Hiding_In_Plain_Sight_(Alliance)
        -- NOTE: the quest is faction-split (Alliance 46089 / Horde 46178), so no
        -- single questID is given here rather than risk ticking the wrong one.
        { text = "Complete your class Order Hall campaign",                achievementID = 10994 },
        { text = "Complete the Legionfall campaign on the Broken Shore",   achievementID = 11546 },
        { text = "Complete the quest \"Hiding In Plain Sight\"",
          start = "Starts from Lilian Voss in the Hall of Shadows" },
    },

    ["Farseer's Raging Tempest"] = {
        -- source: https://warcraft.wiki.gg/wiki/Gathering_of_the_Storms
        { text = "Complete your class Order Hall campaign",                achievementID = 10994 },
        { text = "Complete the Legionfall campaign on the Broken Shore",   achievementID = 11546 },
        { text = "Complete the quest \"Gathering of the Storms\"",         questID = 46792,
          start = "Starts from Consular Celestos in the Heart of Azeroth" },
    },

    ["Netherlord's Chaotic Wrathsteed"] = {
        -- source: https://warcraft.wiki.gg/wiki/The_Wrathsteed_of_Xoroth
        { text = "Complete your class Order Hall campaign",                achievementID = 10994 },
        { text = "Complete the Legionfall campaign on the Broken Shore",   achievementID = 11546 },
        { text = "Complete the quest \"The Wrathsteed of Xoroth\"",        questID = 46243,
          start = "Starts from Mor'zul Bloodbringer in the Dreadscar Rift" },
    },

    ["Battlelord's Bloodthirsty War Wyrm"] = {
        -- source: https://warcraft.wiki.gg/wiki/The_Trial_of_Rage
        { text = "Complete your class Order Hall campaign",                achievementID = 10994 },
        { text = "Complete the Legionfall campaign on the Broken Shore",   achievementID = 11546 },
        { text = "Complete the quest \"The Trial of Rage\"",               questID = 46207,
          start = "Starts from Odyn in Skyhold" },
    },

    -- =====================================================================
    -- CLASS HALL MOUNT COLOUR VARIANTS
    -- All of these require the base class mount to be learned first.
    -- source: https://warcraft.wiki.gg/wiki/Class_mount
    -- =====================================================================

    ["Huntmaster's Dire Wolfhawk"] = {
        { text = "Learn the Huntmaster's Loyal Wolfhawk (hunter class mount)" },
        { text = "Buy the Trust of a Dire Wolfhawk from Pan the Kind Hand in Trueshot Lodge for 1,000 Order Resources",
          currencyID = 1220 },
    },

    ["Huntmaster's Fierce Wolfhawk"] = {
        { text = "Learn the Huntmaster's Loyal Wolfhawk (hunter class mount)" },
        { text = "Buy the Trust of a Fierce Wolfhawk from Pan the Kind Hand in Trueshot Lodge for 1,000 Order Resources",
          currencyID = 1220 },
    },

    ["Highlord's Vengeful Charger"] = {
        { text = "Learn the Highlord's Golden Charger (paladin class mount)" },
        { text = "Buy the Harsh Reins of the Vengeful Charger from Crusader Lord Dalfors in the Sanctum of Light for 1,000 Order Resources",
          currencyID = 1220 },
    },

    ["Highlord's Valorous Charger"] = {
        { text = "Learn the Highlord's Golden Charger (paladin class mount)" },
        { text = "Buy the Heraldic Reins of the Valorous Charger from Crusader Lord Dalfors in the Sanctum of Light for 1,000 Order Resources",
          currencyID = 1220 },
    },

    ["Highlord's Vigilant Charger"] = {
        { text = "Learn the Highlord's Golden Charger (paladin class mount)" },
        { text = "Buy the Stoic Reins of the Vigilant Charger from Crusader Lord Dalfors in the Sanctum of Light for 1,000 Order Resources",
          currencyID = 1220 },
    },

    ["Shadowblade's Crimson Omen"] = {
        { text = "Learn the Shadowblade's Murderous Omen (rogue class mount)" },
        { text = "Buy the Bloody Reins of Dark Portent from Zan Shivsproket for 1,000 Order Resources",
          currencyID = 1220 },
    },

    ["Shadowblade's Baneful Omen"] = {
        { text = "Learn the Shadowblade's Murderous Omen (rogue class mount)" },
        { text = "Buy the Mephitic Reins of Dark Portent from Zan Shivsproket for 1,000 Order Resources",
          currencyID = 1220 },
    },

    ["Shadowblade's Lethal Omen"] = {
        { text = "Learn the Shadowblade's Murderous Omen (rogue class mount)" },
        { text = "Buy the Midnight Black Reins of Dark Portent from Zan Shivsproket for 1,000 Order Resources",
          currencyID = 1220 },
    },

    ["Netherlord's Brimstone Wrathsteed"] = {
        { text = "Learn the Netherlord's Chaotic Wrathsteed (warlock class mount)" },
        { text = "Buy the Hellblazing Reins of the Brimstone Wrathsteed from Calydus in the Dreadscar Rift for 1,000 Order Resources",
          currencyID = 1220 },
    },

    ["Netherlord's Accursed Wrathsteed"] = {
        -- source: https://warcraft.wiki.gg/wiki/Netherlord%27s_Accursed_Wrathsteed
        { text = "Learn the Netherlord's Chaotic Wrathsteed (warlock class mount)" },
        { text = "Kill Lord Hel'nurath at the Dark Stockades on the Broken Shore - the Shadowy Reins of the Accursed Wrathsteed are a guaranteed drop" },
    },

    -- =====================================================================
    -- FALCOSAUR MOUNTS
    -- Each is the end of a ~14-day daily quest chain that only starts once you
    -- have that species' battle pet, which itself needs its zone world quest.
    -- source: https://warcraft.wiki.gg/wiki/Falcosaur
    -- source: https://warcraft.wiki.gg/wiki/Template:Raising_Your_Falcosaur
    -- =====================================================================

    ["Predatory Bloodgazer"] = {
        -- source: https://warcraft.wiki.gg/wiki/Predatory_Bloodgazer
        { text = "Complete the \"Bloodgazer Swarm!\" world quest in Azsuna and kill the Bloodgazer Matriarch" },
        { text = "Pick up the Bloodgazer Hatchling battle pet from the Orphaned Bloodgazer in Azsuna" },
        { text = "Complete the quest \"Raising Your Bloodgazer\"",          questID = 44990,
          start = "Starts from the Bloodgazer Hatchling pet, once summoned" },
        { text = "Work through the 14-day Bloodgazer daily quest chain (one quest per day)" },
        { text = "Complete the quest \"Bloodgazer Reunion\"",               questID = 45020,
          start = "Starts from the Bloodgazer Hatchling pet, once summoned" },
    },

    ["Brilliant Direbeak"] = {
        -- source: https://warcraft.wiki.gg/wiki/Brilliant_Direbeak
        { text = "Complete the \"Direbeak Swarm!\" world quest in Stormheim and kill the Direbeak Matriarch" },
        { text = "Pick up the Direbeak Hatchling battle pet from the Orphaned Direbeak in Stormheim" },
        { text = "Complete the quest \"Raising Your Direbeak\"",            questID = 44973,
          start = "Starts from the Direbeak Hatchling pet, once summoned" },
        { text = "Work through the 14-day Direbeak daily quest chain (one quest per day)" },
        { text = "Complete the quest \"Direbeak Reunion\"",                 questID = 44988,
          start = "Starts from the Direbeak Hatchling pet, once summoned" },
    },

    ["Viridian Sharptalon"] = {
        -- source: https://warcraft.wiki.gg/wiki/Viridian_Sharptalon
        { text = "Complete the \"Sharptalon Swarm!\" world quest in Val'sharah and kill the Sharptalon Matriarch" },
        { text = "Pick up the Sharptalon Hatchling battle pet from the Orphaned Sharptalon in Val'sharah" },
        { text = "Complete the quest \"Raising Your Sharptalon\"",          questID = 44989,
          start = "Starts from the Sharptalon Hatchling pet, once summoned" },
        { text = "Work through the 14-day Sharptalon daily quest chain (one quest per day)" },
        { text = "Complete the quest \"Sharptalon Reunion\"",               questID = 45019,
          start = "Starts from the Sharptalon Hatchling pet, once summoned" },
    },

    ["Snowfeather Hunter"] = {
        -- source: https://warcraft.wiki.gg/wiki/Snowfeather_Hunter
        { text = "Complete the \"Snowfeather Swarm!\" world quest in Highmountain and kill the Snowfeather Matriarch" },
        { text = "Pick up the Snowfeather Hatchling battle pet from the Orphaned Snowfeather in Highmountain" },
        { text = "Complete the quest \"Raising Your Snowfeather\"",         questID = 44948,
          start = "Starts from the Snowfeather Hatchling pet, once summoned" },
        { text = "Work through the 14-day Snowfeather daily quest chain (one quest per day)" },
        { text = "Complete the quest \"Snowfeather Reunion\"",              questID = 44969,
          start = "Starts from the Snowfeather Hatchling pet, once summoned" },
    },

    -- =====================================================================
    -- BROKEN ISLES PARAGON REPUTATION MOUNTS
    -- Exalted first, then keep earning reputation - every 10,000 past Exalted
    -- gives a paragon cache that can contain the mount.
    -- =====================================================================

    ["Highmountain Elderhorn"] = {
        -- source: https://warcraft.wiki.gg/wiki/Highmountain_Elderhorn
        { text = "Reach Exalted with the Highmountain Tribe",              factionID = 1828, reaction = 8 },
        { text = "Keep earning reputation past Exalted and open Highmountain Supplies paragon caches" },
    },

    ["Valarjar Stormwing"] = {
        -- source: https://warcraft.wiki.gg/wiki/Valarjar_Stormwing
        { text = "Reach Exalted with the Valarjar",                        factionID = 1948, reaction = 8 },
        { text = "Keep earning reputation past Exalted and open Valarjar Strongbox paragon caches" },
    },

    ["Cloudwing Hippogryph"] = {
        -- source: https://warcraft.wiki.gg/wiki/Cloudwing_Hippogryph
        { text = "Reach Exalted with the Court of Farondis",               factionID = 1900, reaction = 8 },
        { text = "Keep earning reputation past Exalted and open Farondis Chest paragon caches" },
    },

    ["Wild Dreamrunner"] = {
        -- source: https://warcraft.wiki.gg/wiki/Wild_Dreamrunner
        { text = "Reach Exalted with the Dreamweavers",                    factionID = 1883, reaction = 8 },
        { text = "Keep earning reputation past Exalted and open Dreamweaver Cache paragon caches" },
    },

    ["Leywoven Flying Carpet"] = {
        -- source: https://warcraft.wiki.gg/wiki/Leywoven_Flying_Carpet
        { text = "Reach Exalted with The Nightfallen",                     factionID = 1859, reaction = 8 },
        { text = "Keep earning reputation past Exalted and open Nightfallen Cache paragon caches" },
    },

    -- =====================================================================
    -- ARGUS REPUTATION MOUNTS (patch 7.3)
    -- =====================================================================

    ["Avenging Felcrusher"] = {
        -- source: https://warcraft.wiki.gg/wiki/Avenging_Felcrusher
        { text = "Reach Exalted with the Army of the Light",               factionID = 2165, reaction = 8 },
        { text = "Keep earning reputation past Exalted and open Gleaming Footlocker paragon caches" },
    },

    ["Blessed Felcrusher"] = {
        -- source: https://warcraft.wiki.gg/wiki/Blessed_Felcrusher
        { text = "Reach Exalted with the Army of the Light",               factionID = 2165, reaction = 8 },
        { text = "Keep earning reputation past Exalted and open Gleaming Footlocker paragon caches" },
    },

    ["Glorious Felcrusher"] = {
        -- source: https://warcraft.wiki.gg/wiki/Glorious_Felcrusher
        { text = "Reach Exalted with the Army of the Light",               factionID = 2165, reaction = 8 },
        { text = "Keep earning reputation past Exalted and open Gleaming Footlocker paragon caches" },
    },

    ["Lightforged Warframe"] = {
        -- source: https://warcraft.wiki.gg/wiki/Lightforged_Warframe_(mount)
        { text = "Reach Exalted with the Army of the Light",               factionID = 2165, reaction = 8 },
        { text = "Buy the Lightforged Warframe from Vindicator Jaelaana aboard the Vindicaar for 500,000 gold" },
    },

    ["Amethyst Ruinstrider"] = {
        -- source: https://warcraft.wiki.gg/wiki/Amethyst_Ruinstrider
        { text = "Reach Exalted with the Argussian Reach",                 factionID = 2170, reaction = 8 },
        { text = "Buy the Reins of the Amethyst Ruinstrider from Toraan the Revered aboard the Vindicaar for 10,000 gold" },
    },

    ["Beryl Ruinstrider"] = {
        -- source: https://warcraft.wiki.gg/wiki/Beryl_Ruinstrider
        { text = "Reach Exalted with the Argussian Reach",                 factionID = 2170, reaction = 8 },
        { text = "Buy the Reins of the Beryl Ruinstrider from Toraan the Revered aboard the Vindicaar for 10,000 gold" },
    },

    ["Cerulean Ruinstrider"] = {
        -- source: https://warcraft.wiki.gg/wiki/Cerulean_Ruinstrider
        { text = "Reach Exalted with the Argussian Reach",                 factionID = 2170, reaction = 8 },
        { text = "Buy the Reins of the Cerulean Ruinstrider from Toraan the Revered aboard the Vindicaar for 10,000 gold" },
    },

    ["Russet Ruinstrider"] = {
        -- source: https://warcraft.wiki.gg/wiki/Russet_Ruinstrider
        { text = "Reach Exalted with the Argussian Reach",                 factionID = 2170, reaction = 8 },
        { text = "Buy the Reins of the Russet Ruinstrider from Toraan the Revered aboard the Vindicaar for 10,000 gold" },
    },

    ["Sable Ruinstrider"] = {
        -- source: https://warcraft.wiki.gg/wiki/Sable_Ruinstrider
        { text = "Reach Exalted with the Argussian Reach",                 factionID = 2170, reaction = 8 },
        { text = "Buy the Reins of the Sable Ruinstrider from Toraan the Revered aboard the Vindicaar for 10,000 gold" },
    },

    ["Umber Ruinstrider"] = {
        -- source: https://warcraft.wiki.gg/wiki/Umber_Ruinstrider
        { text = "Reach Exalted with the Argussian Reach",                 factionID = 2170, reaction = 8 },
        { text = "Buy the Reins of the Umber Ruinstrider from Toraan the Revered aboard the Vindicaar for 10,000 gold" },
    },

    ["Bleakhoof Ruinstrider"] = {
        -- source: https://warcraft.wiki.gg/wiki/Bleakhoof_Ruinstrider
        { text = "Earn the achievement \"...And Chew Mana Buns\" - slay 2,000 non-trivial demons in Krokuun, Eredath and the Antoran Wastes",
          achievementID = 12103 },
    },

    -- =====================================================================
    -- OTHER REPUTATION MOUNTS
    -- =====================================================================

    ["Ivory Hawkstrider"] = {
        -- source: https://warcraft.wiki.gg/wiki/Ivory_Hawkstrider
        { text = "Complete at least one falcosaur quest chain and earn its mount (Predatory Bloodgazer, Brilliant Direbeak, Viridian Sharptalon or Snowfeather Hunter)" },
        { text = "Ride that falcosaur mount to Sylvan Falls in Highmountain and exhaust Aviana's dialogue to unlock the faction" },
        { text = "Kill enemy players while under the effect of an Ivory Talon or Ivory Feather and consume Marks of Prey (about 420) to reach Exalted with Talon's Vengeance",
          factionID = 2018, reaction = 8 },
        { text = "Buy the Ivory Hawkstrider from Trinket in Highmountain for 10,000 gold" },
    },

    ["Brinedeep Bottom-Feeder"] = {
        -- source: https://warcraft.wiki.gg/wiki/Brinedeep_Bottom-Feeder
        { text = "Fish Drowned Mana from the pond at Margoss's Retreat near Dalaran",   itemID = 138777 },
        { text = "Turn in Drowned Mana to Conjurer Margoss until you reach Best Friend status with him",
          factionID = 1975, reaction = 8 },
        { text = "Buy the Brinedeep Bottom-Feeder from Conjurer Margoss for 100 Drowned Mana",
          itemID = 138777, count = 100 },
    },

    -- =====================================================================
    -- ACHIEVEMENT MOUNTS
    -- =====================================================================

    ["Grove Defiler"] = {
        -- source: https://warcraft.wiki.gg/wiki/Grove_Defiler
        { text = "Earn the meta achievement \"Glory of the Legion Raider\" (Emerald Nightmare and Nighthold raid achievements)",
          achievementID = 11180 },
    },

    ["Leyfeather Hippogryph"] = {
        -- source: https://warcraft.wiki.gg/wiki/Leyfeather_Hippogryph
        { text = "Earn the meta achievement \"Glory of the Legion Hero\" (Legion Mythic dungeon achievements)",
          achievementID = 11163 },
    },

    ["Antoran Gloomhound"] = {
        -- source: https://warcraft.wiki.gg/wiki/Antoran_Gloomhound
        { text = "Earn the meta achievement \"Glory of the Argus Raider\" (Antorus, the Burning Throne achievements)",
          achievementID = 11987 },
    },

    ["Ratstallion"] = {
        -- source: https://warcraft.wiki.gg/wiki/Ratstallion
        { text = "Earn the achievement \"Underbelly Tycoon\" - loot 20,000 Sightless Eyes in Dalaran's Underbelly",
          achievementID = 11066 },
        { text = "Collect the mount from the mail Raethan sends you" },
    },

    ["Mechanized Lumber Extractor"] = {
        -- source: https://warcraft.wiki.gg/wiki/Mechanized_Lumber_Extractor
        { text = "Earn the achievement \"Remember to Share\" - collect 300 toys",
          achievementID = 11176 },
    },

    -- =====================================================================
    -- QUEST / STORYLINE MOUNTS
    -- =====================================================================

    ["Arcanist's Manasaber"] = {
        -- source: https://warcraft.wiki.gg/wiki/Arcanist%27s_Manasaber
        -- source: https://warcraft.wiki.gg/wiki/Fate_of_the_Nightborne
        { text = "Complete the quest \"Breaching the Sanctum\", the last step of the Suramar campaign",
          questID = 44719, start = "Starts from Chief Telemancer Oculeth in Shal'Aran, Suramar" },
        { text = "Finish the whole Suramar storyline (the \"Insurrection\" achievement)",  achievementID = 11340 },
        { text = "Complete the quest \"The Nighthold: Lord of the Shadow Council\"",  questID = 45417 },
        { text = "Complete the quest \"The Nighthold: The Eye of Aman'Thul\"",        questID = 45420,
          start = "Starts from Archmage Khadgar in the Nighthold" },
        { text = "Complete the quest \"Fate of the Nightborne\"",          questID = 45372,
          start = "Starts from Chief Telemancer Oculeth in Shal'Aran, Suramar" },
        -- Nightborne characters can buy it from First Arcanist Thalyssra in
        -- Shal'Aran for free instead.
    },

    ["Llothien Prowler"] = {
        -- source: https://warcraft.wiki.gg/wiki/Llothien_Prowler
        -- source: https://warcraft.wiki.gg/wiki/Torn_Invitation
        { text = "Loot a Torn Invitation from the Glimmering Treasure Chest at the end of Withered Army Training, or from a Nightfallen paragon cache",
          itemID = 140495, count = 1 },
        { text = "Complete the quest A \"Noble\" Event - four Order Hall missions",  questID = 44057,
          start = "Starts from the Torn Invitation item" },
        { text = "Complete the quest \"Volpin the Elusive\"",              questID = 44058,
          start = "Starts from your Order Hall specialists" },
    },

    ["Felsaber"] = {
        -- source: https://warcraft.wiki.gg/wiki/Felsaber_(mount)
        { text = "Play a demon hunter and complete the quest \"Enter the Illidari: Ashtongue\" in the starting experience",
          questID = 40378, start = "Starts from Kayn Sunfury in Mardum" },
    },

    ["Spirit of Eche'ro"] = {
        -- source: https://warcraft.wiki.gg/wiki/Spirit_of_Eche%27ro
        { text = "Train Legion Archaeology and work the Highmountain dig sites" },
        { text = "Complete the quest \"The Right Path\"",                  questID = 41192,
          start = "Starts from Dariness the Learned in Dalaran" },
        { text = "Complete the quest \"Laying to Rest\" - collect 600 Bone Fragments of Eche'ro",
          questID = 41193, start = "Starts from Lessah Moonwater in Thunder Totem, Highmountain" },
        -- The quest is only offered roughly once every six months per character.
    },

    -- =====================================================================
    -- SECRET / PUZZLE MOUNTS
    -- The step questIDs below are the game's own hidden tracking quests, taken
    -- from the progress-check macros on the wiki, and all confirmed to exist.
    -- =====================================================================

    ["Lucid Nightmare"] = {
        -- source: https://warcraft.wiki.gg/wiki/Riddle_of_the_Lucid_Nightmare
        { text = "Find the Inconspicuous Note upstairs in Curiosities & Moore, Dalaran (Broken Isles)",
          questID = 47826 },
        { text = "Solve the Scrapyard Lights puzzle in Ulduar (match Mimiron's sigil)",       questID = 47837 },
        { text = "Win the Mind Larva minigame past C'Thun's chamber in the Temple of Ahn'Qiraj",
          questID = 47841 },
        { text = "Wear a Shadoweave Mask, enter the Dark Fissure in the Crumbling Depths, Deepholm, and click the Strange Skull",
          questID = 47850 },
        { text = "Solve the Instructions puzzle in Gnomeregan",                               questID = 47852 },
        { text = "Solve the puzzle at Ash'theran in Val'sharah",                              questID = 47863 },
        { text = "Complete the maze under the Urn in the Tomb of Secrets, Kun-Lai Summit",     questID = 47881 },
        { text = "Loot the Puzzler's Desire in the Forgotten Crypt beneath Karazhan",          questID = 47885 },
    },

    ["Riddler's Mind-Worm"] = {
        -- source: https://warcraft.wiki.gg/wiki/Riddle_of_the_Mind-Seekers
        { text = "Find Page 9 on a bookshelf in the Legerdemain Lounge, Dalaran (Broken Isles)",  questID = 45470 },
        { text = "Find Page 78 by the moonwell in Twilight Grove, Duskwood",                      questID = 47207 },
        { text = "Find Page 161 on Ragnaros' platform in the Firelands",                          questID = 47208 },
        { text = "Find Page 655 east of the Lost City of the Tol'vir, Uldum",                     questID = 47209 },
        { text = "Find Page 845 in the back left corner of the Sha of Pride's room, Siege of Orgrimmar",
          questID = 47210 },
        { text = "Find Page 1127 on the border of the well in Well of Eternity (Caverns of Time)",
          questID = 47211 },
        { text = "Find Page 2351 on a statue base near the Shado-Pan Monastery, Kun-Lai Summit",
          questID = 47212 },
        { text = "Find Page 5555 on a statue base in Uldum",                                      questID = 47213 },
        { text = "Loot the Gift of the Mind-Seekers on the Longshore in Westfall" },
    },

    ["Long-Forgotten Hippogryph"] = {
        -- source: https://warcraft.wiki.gg/wiki/Long-Forgotten_Hippogryph
        { text = "Find and interact with all five Ephemeral Crystals in Azsuna before anyone else does - they spawn at random points across the zone and the first player to click all five gets the reins" },
    },

    ["Fathom Dweller"] = {
        -- source: https://warcraft.wiki.gg/wiki/Kosumoth_the_Hungering
        -- source: https://warcraft.wiki.gg/wiki/Fathom_Dweller
        { text = "Exhaust Drak'thul's dialogue at his camp on the southern tip of the Broken Shore" },
        { text = "Retrieve the Weathered Relic from the Mound of Dirt in Feldust Cavern on the Broken Shore, then talk to Drak'thul again" },
        { text = "Interact with all ten hidden Hungering Orbs across the Broken Isles, in order" },
        { text = "Complete the world quest \"DANGER: Kosumoth the Hungering\" in the Eye of Azshara",
          questID = 43798 },
        -- The world quest returns every two weeks and rewards either this mount
        -- or the Hungering Claw pet; which one is chosen region-wide.
    },

    ["Smoldering Ember Wyrm"] = {
        -- source: https://warcraft.wiki.gg/wiki/Nightbane_(Return_to_Karazhan_tactics)
        -- source: https://warcraft.wiki.gg/wiki/Smoldering_Ember_Wyrm
        { text = "Enter Return to Karazhan and open the door to start the hidden timer" },
        { text = "Collect all five Soul Fragments before the timer expires (Opera Hall, Guest Chambers, Banquet Hall, Servants' Quarters, and after The Curator)" },
        { text = "Speak to the Image of Medivh on the Master's Terrace to summon Nightbane" },
        { text = "Defeat Nightbane - the mount has a 20% chance to drop per eligible player" },
    },

    -- =====================================================================
    -- PROFESSION MOUNTS
    -- =====================================================================

    ["Great Northern Elderhorn"] = {
        -- source: https://warcraft.wiki.gg/wiki/Great_Northern_Elderhorn
        { text = "Learn Legion Leatherworking to skill 100" },
        { text = "Complete the leatherworking quest \"Mounting Made Easy\" for Pattern: Elderhorn Riding Harness",
          questID = 40215, start = "Starts from Namha Moonwater in Dalaran" },
        { text = "Learn Pattern: Elderhorn Riding Harness",                itemID = 141850, count = 1 },
        { text = "Craft the Elderhorn Riding Harness (50 Stonehide Leather, 25 Blood of Sargeras, 10 Felhide) - it is soulbound" },
    },

    ["Steelbound Devourer"] = {
        -- source: https://warcraft.wiki.gg/wiki/Steelbound_Devourer
        { text = "Learn Legion Blacksmithing to skill 100" },
        { text = "Learn Plans: Fel Core Hound Harness (drops from Tichondrius in the Nighthold, or buy it from the auction house)" },
        { text = "Craft the Steelbound Harness (100 Demonsteel Bar, 50 Blood of Sargeras, 10 Infernal Brimstone, 10 Felhide)" },
    },

    -- =====================================================================
    -- CURRENCY / GATED VENDOR MOUNTS
    -- =====================================================================

    ["Arcadian War Turtle"] = {
        -- source: https://warcraft.wiki.gg/wiki/Arcadian_War_Turtle
        { text = "Collect 150 Curious Coin from Broken Isles and Argus rares, treasures, emissary and paragon caches, Mythic+ caches and raid bosses",
          currencyID = 1275, count = 150 },
        { text = "Buy the mount from Xur'ios at the Antonidas Memorial in Dalaran - his stock rotates daily, so he does not always offer it" },
    },

    -- =====================================================================
    -- FEL-SPOTTED EGG MOUNTS (Argus)
    -- The egg itself is the gate: it must be held for five real-time days
    -- before it hatches, and you can only carry one at a time.
    -- source: https://warcraft.wiki.gg/wiki/Fel-Spotted_Egg
    -- source: https://warcraft.wiki.gg/wiki/Cracked_Fel-Spotted_Egg
    -- =====================================================================

    ["Darkspore Mana Ray"] = {
        { text = "Loot a Fel-Spotted Egg from Varga (Antoran Wastes), Sabuul (Eredath) or Naroua (Krokuun)",
          itemID = 153190, count = 1 },
        { text = "Keep the egg in your bags for five real-time days until it becomes a Cracked Fel-Spotted Egg",
          itemID = 153191, count = 1 },
        { text = "Open the Cracked Fel-Spotted Egg (7% chance per egg for this mount)" },
    },

    ["Vibrant Mana Ray"] = {
        { text = "Loot a Fel-Spotted Egg from Varga (Antoran Wastes), Sabuul (Eredath) or Naroua (Krokuun)",
          itemID = 153190, count = 1 },
        { text = "Keep the egg in your bags for five real-time days until it becomes a Cracked Fel-Spotted Egg",
          itemID = 153191, count = 1 },
        { text = "Open the Cracked Fel-Spotted Egg (7% chance per egg for this mount)" },
    },

    ["Felglow Mana Ray"] = {
        { text = "Loot a Fel-Spotted Egg from Varga (Antoran Wastes), Sabuul (Eredath) or Naroua (Krokuun)",
          itemID = 153190, count = 1 },
        { text = "Keep the egg in your bags for five real-time days until it becomes a Cracked Fel-Spotted Egg",
          itemID = 153191, count = 1 },
        { text = "Open the Cracked Fel-Spotted Egg (7% chance per egg for this mount)" },
    },

    ["Scintillating Mana Ray"] = {
        { text = "Loot a Fel-Spotted Egg from Varga (Antoran Wastes), Sabuul (Eredath) or Naroua (Krokuun)",
          itemID = 153190, count = 1 },
        { text = "Keep the egg in your bags for five real-time days until it becomes a Cracked Fel-Spotted Egg",
          itemID = 153191, count = 1 },
        { text = "Open the Cracked Fel-Spotted Egg (7% chance per egg for this mount)" },
    },

    -- =====================================================================
    -- VICIOUS (RATED PVP) MOUNTS ADDED IN LEGION
    -- Bought with Vicious Saddles, which are only awarded for filling the rated
    -- PvP progress bar again after that season's own mount has been earned.
    -- source: https://warcraft.wiki.gg/wiki/Vicious_Saddle
    -- source: https://warcraft.wiki.gg/wiki/Template:Vicious_mounts
    -- =====================================================================

    ["Vicious War Elekk"] = {
        { text = "Earn a Vicious Saddle from rated PvP" },
        { text = "Buy the mount from Necrolord Sipe in Old Town, Stormwind City (Alliance only)" },
    },

    ["Vicious Gilnean Warhorse"] = {
        { text = "Earn a Vicious Saddle from rated PvP" },
        { text = "Buy the mount from Necrolord Sipe in Old Town, Stormwind City (Alliance only)" },
    },

    ["Vicious War Lion"] = {
        { text = "Earn a Vicious Saddle from rated PvP" },
        { text = "Buy the mount from Necrolord Sipe in Old Town, Stormwind City (Alliance only)" },
    },

    ["Vicious Warstrider"] = {
        { text = "Earn a Vicious Saddle from rated PvP" },
        { text = "Buy the mount from Deathguard Netharian in the Valley of Strength, Orgrimmar (Horde only)" },
    },

    ["Vicious War Trike"] = {
        { text = "Earn a Vicious Saddle from rated PvP" },
        { text = "Buy the mount from Deathguard Netharian in the Valley of Strength, Orgrimmar (Horde only)" },
    },

    ["Vicious War Scorpion"] = {
        { text = "Earn a Vicious Saddle from rated PvP" },
        { text = "Buy the mount from Deathguard Netharian in the Valley of Strength, Orgrimmar (Horde only)" },
    },

    ["Vicious War Bear"] = {
        { text = "Earn a Vicious Saddle from rated PvP" },
        { text = "Buy the mount from Necrolord Sipe in Stormwind City or Deathguard Netharian in Orgrimmar" },
    },

    ["Vicious War Turtle"] = {
        { text = "Earn a Vicious Saddle from rated PvP" },
        { text = "Buy the mount from Necrolord Sipe in Stormwind City or Deathguard Netharian in Orgrimmar" },
    },

    ["Vicious War Fox"] = {
        { text = "Earn a Vicious Saddle from rated PvP" },
        { text = "Buy the mount from Necrolord Sipe in Stormwind City or Deathguard Netharian in Orgrimmar" },
    },

    -- =================================================================
    -- BATTLE FOR AZEROTH  (researched 2026-08-19)
    -- Keys taken straight from Mount.db2, so every name matches the
    -- journal exactly. Faction-split unlock quests carry NO questID on
    -- purpose - one ID would silently never tick for half of players -
    -- with both faction NPCs named in the start text instead.
    -- Sandy Nightsaber's currency is omitted: the client's own source
    -- text lists the same currency for both factions, which is almost
    -- certainly a Blizzard data error.
    -- =================================================================
    -- ==========================================================
    -- Kul Tiras / Zandalar reputation quartermasters
    -- ==========================================================

    ["Admiralty Stallion"] = {
        -- source: https://wago.tools/db2/Mount (ID 1010) + https://www.wowhead.com/faction=2160
        { text = "Reach Exalted with the Proudmoore Admiralty", factionID = 2160, reaction = 8 },
        { text = "Buy the mount from Provisioner Fray in Tiragarde Sound" },
    },

    ["Proudmoore Sea Scout"] = {
        -- source: https://wago.tools/db2/Mount (ID 1064) + https://www.wowhead.com/faction=2160
        { text = "Reach Exalted with the Proudmoore Admiralty", factionID = 2160, reaction = 8 },
        { text = "Buy the mount from Provisioner Fray in Tiragarde Sound" },
    },

    ["Smoky Charger"] = {
        -- source: https://wago.tools/db2/Mount (ID 1016) + https://www.wowhead.com/faction=2161
        { text = "Reach Exalted with the Order of Embers", factionID = 2161, reaction = 8 },
        { text = "Buy the mount from Quartermaster Alcorn in Drustvar" },
    },

    ["Dusky Waycrest Gryphon"] = {
        -- source: https://wago.tools/db2/Mount (ID 1062) + https://www.wowhead.com/faction=2161
        { text = "Reach Exalted with the Order of Embers", factionID = 2161, reaction = 8 },
        { text = "Buy the mount from Quartermaster Alcorn in Drustvar" },
    },

    ["Dapple Gray"] = {
        -- source: https://wago.tools/db2/Mount (ID 1015) + https://www.wowhead.com/faction=2162
        { text = "Reach Exalted with Storm's Wake", factionID = 2162, reaction = 8 },
        { text = "Buy the mount from Sister Lilyana in Stormsong Valley" },
    },

    ["Stormsong Coastwatcher"] = {
        -- source: https://wago.tools/db2/Mount (ID 1063) + https://www.wowhead.com/faction=2162
        { text = "Reach Exalted with Storm's Wake", factionID = 2162, reaction = 8 },
        { text = "Buy the mount from Sister Lilyana in Stormsong Valley" },
    },

    ["Cobalt Pterrordax"] = {
        -- source: https://wago.tools/db2/Mount (ID 1058) + https://www.wowhead.com/faction=2103
        { text = "Reach Exalted with the Zandalari Empire", factionID = 2103, reaction = 8 },
        { text = "Buy the mount from Natal'hakata in Zuldazar" },
    },

    ["Spectral Pterrorwing"] = {
        -- source: https://wago.tools/db2/Mount (ID 958) + https://www.wowhead.com/faction=2103
        { text = "Reach Exalted with the Zandalari Empire", factionID = 2103, reaction = 8 },
        { text = "Buy the mount from Natal'hakata in Zuldazar" },
    },

    ["Expedition Bloodswarmer"] = {
        -- source: https://wago.tools/db2/Mount (ID 1061) + https://www.wowhead.com/faction=2156
        { text = "Reach Exalted with Talanji's Expedition", factionID = 2156, reaction = 8 },
        { text = "Buy the mount from Provisioner Lija in Nazmir" },
    },

    ["Captured Swampstalker"] = {
        -- source: https://wago.tools/db2/Mount (ID 1059) + https://www.wowhead.com/faction=2156
        { text = "Reach Exalted with Talanji's Expedition", factionID = 2156, reaction = 8 },
        { text = "Buy the mount from Provisioner Lija in Nazmir" },
    },

    ["Alabaster Hyena"] = {
        -- source: https://wago.tools/db2/Mount (ID 926) + https://www.wowhead.com/faction=2158
        { text = "Reach Exalted with the Voldunai", factionID = 2158, reaction = 8 },
        { text = "Buy the mount from Hoarder Jena in Vol'dun" },
    },

    ["Voldunai Dunescraper"] = {
        -- source: https://wago.tools/db2/Mount (ID 1060) + https://www.wowhead.com/faction=2158
        { text = "Reach Exalted with the Voldunai", factionID = 2158, reaction = 8 },
        { text = "Buy the mount from Hoarder Jena in Vol'dun" },
    },

    -- ==========================================================
    -- Nazjatar / Mechagon (patch 8.2)
    -- ==========================================================

    ["Rustbolt Resistor"] = {
        -- source: https://wago.tools/db2/Mount (ID 1254) + https://www.wowhead.com/faction=2391
        { text = "Unlock Nazjatar by completing the \"Send the Fleet\" intro questline",
          start = "Starts from Nathanos Blightcaller in Zuldazar (Horde) or Genn Greymane in Boralus, Tiragarde Sound (Alliance)" },
        { text = "Unlock Mechagon Island with the quest \"The Legend of Mechagon\"",
          start = "Starts from Gazlowe in Dazar'alor (Horde) or Tinkmaster Overspark in Boralus, Tiragarde Sound (Alliance)" },
        { text = "Reach Exalted with the Rustbolt Resistance", factionID = 2391, reaction = 8 },
        { text = "Buy the mount from the Stolen Royal Vendorbot in Mechagon" },
    },

    ["Unshackled Waveray"] = {
        -- source: https://wago.tools/db2/Mount (ID 1230) + https://www.wowhead.com/faction=2373
        -- Horde-side Nazjatar faction; the addon detects the faction restriction itself.
        { text = "Unlock Nazjatar by completing the \"Send the Fleet\" intro questline",
          start = "Starts from Nathanos Blightcaller in Zuldazar" },
        { text = "Reach Exalted with The Unshackled", factionID = 2373, reaction = 8 },
        { text = "Save up 250 Prismatic Manapearls", currencyID = 1721, amount = 250 },
        { text = "Buy the mount from Finder Pruc in Nazjatar" },
    },

    ["Ankoan Waveray"] = {
        -- source: https://wago.tools/db2/Mount (ID 1231) + https://www.wowhead.com/faction=2400
        -- Alliance-side Nazjatar faction; the addon detects the faction restriction itself.
        { text = "Unlock Nazjatar by completing the \"Send the Fleet\" intro questline",
          start = "Starts from Genn Greymane in Boralus, Tiragarde Sound" },
        { text = "Reach Exalted with the Waveblade Ankoan", factionID = 2400, reaction = 8 },
        { text = "Save up 250 Prismatic Manapearls", currencyID = 1721, amount = 250 },
        { text = "Buy the mount from Artisan Okata in Nazjatar" },
    },

    ["Royal Snapdragon"] = {
        -- source: https://wago.tools/db2/Mount (ID 1237) + https://www.wowhead.com/item=169939
        --         + https://www.wowhead.com/item=169940
        { text = "Unlock Nazjatar by completing the \"Send the Fleet\" intro questline" },
        { text = "Reach Exalted with the Waveblade Ankoan (Alliance)", factionID = 2400, reaction = 8 },
        { text = "Reach Exalted with The Unshackled (Horde)", factionID = 2373, reaction = 8 },
        { text = "Keep earning reputation past Exalted for the paragon quest \"Supplies from the Waveblade Ankoan\" (Alliance)",
          questID = 55976 },
        { text = "Keep earning reputation past Exalted for the paragon quest \"Supplies from the Unshackled\" (Horde)",
          questID = 53982 },
        { text = "Open paragon caches until the mount drops - Ankoan Supplies (Alliance)", itemID = 169939, count = 1 },
        { text = "Open paragon caches until the mount drops - Unshackled Supplies (Horde)", itemID = 169940, count = 1 },
    },

    ["Deepcoral Snapdragon"] = {
        -- source: https://www.wowhead.com/quest=56217/wild-tame
        -- Alliance only.
        { text = "Unlock Nazjatar by completing the \"Send the Fleet\" intro questline",
          start = "Starts from Genn Greymane in Boralus, Tiragarde Sound" },
        { text = "Unlock the Nazjatar follower (bodyguard) system and recruit Hunter Akana" },
        { text = "Raise Hunter Akana's friendship to its highest rank by using her as your bodyguard" },
        { text = "Complete the quest \"Wild Tame\"", questID = 56217,
          start = "Starts from the Waveblade Hunter in Nazjatar" },
    },

    ["Snapdragon Kelpstalker"] = {
        -- source: https://www.wowhead.com/quest=56214/good-girl
        -- Horde only.
        { text = "Unlock Nazjatar by completing the \"Send the Fleet\" intro questline",
          start = "Starts from Nathanos Blightcaller in Zuldazar" },
        { text = "Unlock the Nazjatar follower (bodyguard) system and recruit Neri Sharpfin" },
        { text = "Raise Neri Sharpfin's friendship to its highest rank by using her as your bodyguard" },
        { text = "Complete the quest \"Good Girl\"", questID = 56214,
          start = "Starts from the Kelfin Scout in Nazjatar" },
    },

    ["Crimson Tidestallion"] = {
        -- source: https://wago.tools/db2/Mount (ID 1260) - Mrrl's Secret Stash, Nazjatar
        { text = "Unlock Nazjatar by completing the \"Send the Fleet\" intro questline" },
        { text = "Find Mrrl's Secret Stash in the Chitterspine Caverns of Nazjatar" },
        { text = "Barter 4 Cultist Pinky Fingers", itemID = 169783, count = 4 },
        { text = "Barter 2 Pulsating Blood Stones", itemID = 169780, count = 2 },
        { text = "Barter 1 Hungry Herald's Tentacle Taco", itemID = 170100, count = 1 },
    },

    ["Inkscale Deepseeker"] = {
        -- source: https://wago.tools/db2/Mount (ID 1262) + https://www.wowhead.com/item=168802
        { text = "Unlock Nazjatar by completing the \"Send the Fleet\" intro questline" },
        { text = "Fight in the Battle for Nazjatar with War Mode enabled to earn Nazjatar Battle Commendations" },
        { text = "Save up 150 Nazjatar Battle Commendations", itemID = 168802, count = 150 },
        { text = "Buy the mount from Crafticus Mindbender or Dazzerian in Nazjatar" },
    },

    ["Fabious"] = {
        -- source: https://www.wowhead.com/item=169201/fabious
        { text = "Unlock Nazjatar by completing the \"Send the Fleet\" intro questline" },
        { text = "Obtain a S.E.L.F.I.E. Camera or S.E.L.F.I.E. Camera MkII (Engineering) and place it on your action bar" },
        { text = "Find the rare Fabious swimming along the outer edge of Nazjatar and photograph him with the camera" },
    },

    ["Scrapforged Mechaspider"] = {
        -- source: https://www.wowhead.com/quest=55622/drive-it-away-today
        { text = "Unlock Mechagon Island with the quest \"The Legend of Mechagon\"",
          start = "Starts from Gazlowe in Dazar'alor (Horde) or Tinkmaster Overspark in Boralus, Tiragarde Sound (Alliance)" },
        { text = "Work through Recycler Kerchunk's repeatable Shop Project quests until you have a 500S-Cybergenic Powercore",
          itemID = 167064, count = 1 },
        { text = "Complete the quest \"Drive It Away Today\"", questID = 55622,
          start = "Starts from Recycler Kerchunk in Mechagon" },
    },

    ["X-995 Mechanocat"] = {
        -- source: https://www.wowhead.com/item=167751/mechanocat-laser-pointer
        --         + https://www.wowhead.com/item=167787/blueprint-mechanocat-laser-pointer
        { text = "Unlock Mechagon Island with the quest \"The Legend of Mechagon\"" },
        { text = "Unlock Junkyard Tinkering with Pascal-K1N6 in Mechagon" },
        { text = "Buy Blueprint: Mechanocat Laser Pointer from Cork Stuttguard in Mechagon", itemID = 167787, count = 1 },
        { text = "Learn the blueprint", questID = 55056 },
        { text = "Gather 8 S.P.A.R.E. Crates, 4 Chain Ignitercoils and 5 Energy Cells, then craft the Mechanocat Laser Pointer at Pascal-K1N6",
          itemID = 167751, count = 1 },
    },

    -- ==========================================================
    -- Visions of N'Zoth (patch 8.3)
    -- ==========================================================

    ["Wastewander Skyterror"] = {
        -- source: https://wago.tools/db2/Mount (ID 1318) + https://www.wowhead.com/faction=2417
        { text = "Complete the Visions of N'Zoth introduction questline to open the Uldum assaults",
          start = "Starts with \"A Titanic Problem\" from Magni Bronzebeard in the Chamber of Heart" },
        { text = "Reach Exalted with the Uldum Accord", factionID = 2417, reaction = 8 },
        { text = "Buy the mount from Provisioner Qorra in Uldum" },
    },

    ["Shadowbarb Drone"] = {
        -- source: https://www.wowhead.com/quest=58866/my-own-drone
        { text = "Complete the Visions of N'Zoth introduction questline to open the Uldum assaults",
          start = "Starts with \"A Titanic Problem\" from Magni Bronzebeard in the Chamber of Heart" },
        { text = "Find the Voidtouched Egg in Uldum during an Aqir Assault and complete \"The Incredible Egg\"",
          questID = 58802, start = "Starts from the Voidtouched Egg object in Uldum" },
        { text = "Raise the hatched drone through H'partho Ardoros' follow-up quests in Ramkahen" },
        { text = "Complete the quest \"My Own Drone\"", questID = 58866,
          start = "Starts from Blacksmith Abasi in Uldum" },
    },

    ["Springfur Alpaca"] = {
        -- source: https://www.wowhead.com/quest=58887/alpaca-it-in
        { text = "Complete the Visions of N'Zoth introduction questline to open the Uldum assaults" },
        { text = "Pick Gersahl Greens along the river in Uldum", itemID = 174858, count = 1 },
        { text = "Find a Friendly Alpaca in Uldum and feed it, completing the daily \"Alpaca It Up\" seven times" },
        { text = "Complete the quest \"Alpaca It In\"", questID = 58887,
          start = "Starts from the Friendly Alpaca in Uldum" },
    },

    ["Elusive Quickhoof"] = {
        -- source: https://www.wowhead.com/item=174860/reins-of-the-elusive-quickhoof
        { text = "Cook or buy a Seaside Leafy Greens Mix", itemID = 161128, count = 1 },
        { text = "Track down the roaming Elusive Quickhoof in Vol'dun and feed it the Seaside Leafy Greens Mix" },
    },

    ["Wicked Swarmer"] = {
        -- source: https://wago.tools/db2/Mount (ID 1321) - Wrathion, Chamber of Heart
        { text = "Complete the Visions of N'Zoth introduction questline",
          start = "Starts with \"A Titanic Problem\" from Magni Bronzebeard in the Chamber of Heart" },
        { text = "Earn the legendary cloak Ashjra'kamas, Shroud of Resolve and unlock Horrific Visions" },
        { text = "Save up 100,000 Corrupted Mementos from Horrific Visions", currencyID = 1719, amount = 100000 },
        { text = "Buy the mount from Wrathion in the Chamber of Heart" },
    },

    ["Mail Muncher"] = {
        -- source: https://wago.tools/db2/Mount (ID 1315) - drop inside Horrific Visions
        { text = "Complete the Visions of N'Zoth introduction questline" },
        { text = "Earn the legendary cloak Ashjra'kamas, Shroud of Resolve and unlock Horrific Visions" },
        { text = "Find and kill the rare Mail Muncher inside a Horrific Vision of Stormwind or Orgrimmar" },
    },

    -- ==========================================================
    -- Long-form quest chains
    -- ==========================================================

    ["Kua'fon"] = {
        -- source: https://www.wowhead.com/achievement=13030/how-to-ptrain-your-pterrordax
        -- Horde only.
        { text = "Loot a Pterrordax Egg from pterrordax in Zandalar", itemID = 157782, count = 1 },
        { text = "Complete the quest \"A Child of Pa'ku\"", questID = 50393,
          start = "Starts from the Pterrordax Egg itself; turned in at Pa'ku at Pterror Rise in Zuldazar" },
        { text = "Complete the quest \"Nature Versus Nurture\"", questID = 52305,
          start = "Starts from Wingminder Goja at Warbeast Kraal in Zuldazar" },
        { text = "Complete the quest \"Room To Grow\"", questID = 52447 },
        { text = "Complete the quest \"Eyes on the Skies\"", questID = 52748 },
        { text = "Complete the quest \"Down, But Not Out\"", questID = 50944,
          start = "Starts from Kua'fon at Warbeast Kraal in Zuldazar" },
        { text = "Earn \"How to Ptrain Your Pterrordax\"", achievementID = 13030 },
    },

    ["Child of Torcali"] = {
        -- source: https://www.wowhead.com/achievement=13542/how-to-train-your-direhorn
        -- Horde only.
        { text = "Complete the quest \"Naptime\"", questID = 47310,
          start = "Starts from Beastlord L'kala at Warbeast Kraal in Zuldazar" },
        { text = "Complete the quest \"Held For Observation\"", questID = 52857 },
        { text = "Complete the quest \"Sleep, Eat, Repeat\"", questID = 55258 },
        { text = "Complete the quest \"Torcali's Blessing\"", questID = 55507 },
        { text = "Complete the quest \"Wander Not Alone\"", questID = 55798,
          start = "Starts from Jo'nok, Bulwark of Torcali in Nazmir" },
        { text = "Earn \"How to Train Your Direhorn\"", achievementID = 13542 },
    },

    ["Honeyback Harvester"] = {
        -- source: https://www.wowhead.com/quest=56108/leaving-the-hive
        --         + https://www.wowhead.com/faction=2395
        -- Alliance only.
        { text = "Get a bee battle pet - Bumbles from the Stormsong Valley quest chain, or Seabreeze Bumblebee from the Storm's Wake quartermaster" },
        { text = "Summon the bee pet and speak to Barry near Mildenhall Meadery in Stormsong Valley to unlock the Honeyback Hive" },
        { text = "Reach Exalted with the Honeyback Hive", factionID = 2395, reaction = 8 },
        { text = "Fill your Honeyback Harvester's friendship bar by feeding it jelly until it matures" },
        { text = "Complete the quest \"Leaving the Hive\"", questID = 56108,
          start = "Starts from the Honeyback Harvester in the Honeyback Hatchery, Stormsong Valley" },
    },

    ["The Hivemind"] = {
        -- source: https://www.wowhead.com/guide/the-hivemind
        { text = "Buy the Talisman of True Treasure Tracking from Griftah in Shattrath City" },
        { text = "Work through the multi-stage Hivemind secret puzzle chain (glowing mushrooms, cipher, hidden altars)" },
        { text = "Gather four other players who have also finished the chain and perform the Hivemind ritual together" },
    },

    -- ==========================================================
    -- War Campaign service medals (patch 8.1)
    -- ==========================================================

    ["Bloodthirsty Dreadwing"] = {
        -- source: https://wago.tools/db2/Mount (ID 1210) - currency 1716
        -- Horde only.
        { text = "Unlock the War Campaign and The Honorbound on Kul Tiras" },
        { text = "Save up 750 Honorbound Service Medals", currencyID = 1716, amount = 750 },
        { text = "Buy the mount from Provisioner Mukra in Zuldazar" },
    },

    ["Rubyshell Krolusk"] = {
        -- source: https://wago.tools/db2/Mount (ID 1215) - currency 1716
        -- Horde only.
        { text = "Unlock the War Campaign and The Honorbound on Kul Tiras" },
        { text = "Save up 200 Honorbound Service Medals", currencyID = 1716, amount = 200 },
        { text = "Buy the mount from Provisioner Mukra in Zuldazar" },
    },

    ["Priestess' Moonsaber"] = {
        -- source: https://wago.tools/db2/Mount (ID 1216) - currency 1717
        -- Alliance only.
        { text = "Unlock the War Campaign and the 7th Legion on Zandalar" },
        { text = "Save up 750 7th Legion Service Medals", currencyID = 1717, amount = 750 },
        { text = "Buy the mount from Provisioner Stoutforge in Tiragarde Sound" },
    },

    ["Azureshell Krolusk"] = {
        -- source: https://wago.tools/db2/Mount (ID 1214) - currency 1717
        -- Alliance only.
        { text = "Unlock the War Campaign and the 7th Legion on Zandalar" },
        { text = "Save up 200 7th Legion Service Medals", currencyID = 1717, amount = 200 },
        { text = "Buy the mount from Provisioner Stoutforge in Tiragarde Sound" },
    },

    ["Sandy Nightsaber"] = {
        -- source: https://wago.tools/db2/Mount (ID 1204) - sold by both faction provisioners.
        -- The client source text lists currency 1717 for both vendors, which is almost
        -- certainly a data error for the Horde vendor, so no currencyID is claimed here.
        { text = "Unlock your faction's War Campaign on the opposing continent" },
        { text = "Save up 350 Service Medals (7th Legion for Alliance, Honorbound for Horde)" },
        { text = "Buy the mount from Provisioner Stoutforge in Tiragarde Sound or Provisioner Mukra in Zuldazar" },
    },

    -- ==========================================================
    -- Island Expedition currency vendors
    -- ==========================================================

    ["Saltwater Seahorse"] = {
        -- source: https://wago.tools/db2/Mount (ID 1208) - currency 1710
        { text = "Unlock Island Expeditions through your faction's War Campaign" },
        { text = "Save up 500 Seafarer's Dubloons", currencyID = 1710, amount = 500 },
        { text = "Buy the mount from Captain Klarisa in Tiragarde Sound (Alliance) or Captain Zen'taga in Zuldazar (Horde)" },
    },

    ["Siltwing Albatross"] = {
        -- source: https://wago.tools/db2/Mount (ID 1042) - currency 1710
        { text = "Unlock Island Expeditions through your faction's War Campaign" },
        { text = "Save up 1000 Seafarer's Dubloons", currencyID = 1710, amount = 1000 },
        { text = "Buy the mount from Captain Klarisa in Tiragarde Sound (Alliance) or Captain Zen'taga in Zuldazar (Horde)" },
    },

    -- ==========================================================
    -- Meta achievements
    -- ==========================================================

    ["Obsidian Krolusk"] = {
        -- source: https://www.wowhead.com/achievement=12812/glory-of-the-wartorn-hero
        { text = "Complete all 27 Battle for Azeroth Mythic dungeon achievements" },
        { text = "Earn \"Glory of the Wartorn Hero\"", achievementID = 12812 },
    },

    ["Bloodgorged Crawg"] = {
        -- source: https://www.wowhead.com/achievement=12806/glory-of-the-uldir-raider
        { text = "Complete every Uldir raid achievement" },
        { text = "Earn \"Glory of the Uldir Raider\"", achievementID = 12806 },
    },

    ["Dazar'alor Windreaver"] = {
        -- source: https://www.wowhead.com/achievement=13315/glory-of-the-dazaralor-raider
        { text = "Complete every Battle of Dazar'alor raid achievement" },
        { text = "Earn \"Glory of the Dazar'alor Raider\"", achievementID = 13315 },
    },

    ["Azshari Bloatray"] = {
        -- source: https://www.wowhead.com/achievement=13687/glory-of-the-eternal-raider
        { text = "Complete every Eternal Palace raid achievement" },
        { text = "Earn \"Glory of the Eternal Raider\"", achievementID = 13687 },
    },

    ["Wriggling Parasite"] = {
        -- source: https://www.wowhead.com/achievement=14146/glory-of-the-nyalotha-raider
        { text = "Complete every Ny'alotha, the Waking City raid achievement" },
        { text = "Earn \"Glory of the Ny'alotha Raider\"", achievementID = 14146 },
    },

    ["Ironclad Frostclaw"] = {
        -- source: https://www.wowhead.com/achievement=13517/two-sides-to-every-tale
        -- Needs BOTH faction war campaigns, so it takes an Alliance and a Horde character.
        { text = "Complete the Alliance war campaign - \"A Nation United\"", achievementID = 12891 },
        { text = "Complete the Horde war campaign - \"Zandalar Forever!\"", achievementID = 12479 },
        { text = "Complete the Alliance Tides of Vengeance campaign", achievementID = 13467 },
        { text = "Complete the Horde Tides of Vengeance campaign", achievementID = 13466 },
        { text = "Earn \"Two Sides to Every Tale\"", achievementID = 13517 },
    },

    ["Bloodflank Charger"] = {
        -- source: https://www.wowhead.com/achievement=13517/two-sides-to-every-tale
        -- Needs BOTH faction war campaigns, so it takes an Alliance and a Horde character.
        { text = "Complete the Alliance war campaign - \"A Nation United\"", achievementID = 12891 },
        { text = "Complete the Horde war campaign - \"Zandalar Forever!\"", achievementID = 12479 },
        { text = "Complete the Alliance Tides of Vengeance campaign", achievementID = 13467 },
        { text = "Complete the Horde Tides of Vengeance campaign", achievementID = 13466 },
        { text = "Earn \"Two Sides to Every Tale\"", achievementID = 13517 },
    },

    ["Snapback Scuttler"] = {
        -- source: https://www.wowhead.com/achievement=13638/undersea-usurper
        { text = "Unlock Nazjatar by completing the \"Send the Fleet\" intro questline" },
        { text = "Explore Nazjatar", achievementID = 13712 },
        { text = "Complete the remaining 15 Nazjatar achievements, including Exalted with your Nazjatar faction" },
        { text = "Earn \"Undersea Usurper\"", achievementID = 13638 },
    },

    ["Mechacycle Model W"] = {
        -- source: https://www.wowhead.com/achievement=13541/mecha-done
        { text = "Unlock Mechagon Island with the quest \"The Legend of Mechagon\"" },
        { text = "Complete the 10 Mechagon achievements, including the Junkyard Tinkering ones" },
        { text = "Earn \"Mecha-Done\"", achievementID = 13541 },
    },

    ["Wonderwing 2.0"] = {
        -- source: https://www.wowhead.com/achievement=13250/battle-for-azeroth-pathfinder-part-two
        { text = "Earn \"Battle for Azeroth Pathfinder, Part One\"", achievementID = 12989 },
        { text = "Explore Nazjatar", achievementID = 13712 },
        { text = "Explore Mechagon", achievementID = 13776 },
        { text = "Reach Revered with your Nazjatar faction - The Unshackled (Horde)", factionID = 2373, reaction = 7 },
        { text = "Reach Revered with your Nazjatar faction - Waveblade Ankoan (Alliance)", factionID = 2400, reaction = 7 },
        { text = "Reach Revered with the Rustbolt Resistance", factionID = 2391, reaction = 7 },
        { text = "Earn \"Battle for Azeroth Pathfinder, Part Two\"", achievementID = 13250 },
    },

    ["Black Serpent of N'Zoth"] = {
        -- source: https://www.wowhead.com/achievement=13994/through-the-depths-of-visions
        { text = "Earn the legendary cloak Ashjra'kamas, Shroud of Resolve and unlock Horrific Visions" },
        { text = "Clear a full Horrific Vision with all five masks active" },
        { text = "Earn \"Through the Depths of Visions\"", achievementID = 13994 },
    },

    ["Conqueror's Scythemaw"] = {
        -- source: https://www.wowhead.com/achievement=12604/conqueror-of-azeroth
        { text = "Turn on War Mode and complete the six \"Tour of Duty\" zone achievements in Zandalar and Kul Tiras" },
        { text = "Complete \"Band of Brothers\", \"War Supplied\" and \"Bounty Hunting\"" },
        { text = "Earn \"Conqueror of Azeroth\" (Horde)", achievementID = 12604 },
        { text = "Earn \"Conqueror of Azeroth\" (Alliance)", achievementID = 12605 },
    },

    ["Pureheart Courser"] = {
        -- source: https://www.wowhead.com/achievement=12866/100-exalted-reputations
        { text = "Raise 100 reputations to Exalted", achievementID = 12866 },
    },

    ["Frostshard Infernal"] = {
        -- source: https://www.wowhead.com/achievement=12931/no-stable-big-enough
        { text = "Collect 350 mounts - \"No Stable Big Enough\" (Horde)", achievementID = 12931 },
        { text = "Collect 350 mounts - \"No Stable Big Enough\" (Alliance)", achievementID = 12932 },
    },

    ["Frenzied Feltalon"] = {
        -- source: https://www.wowhead.com/achievement=12933/a-horde-of-hoofbeats
        { text = "Collect 400 mounts - \"A Horde of Hoofbeats\" (Horde)", achievementID = 12933 },
        { text = "Collect 400 mounts - \"A Horde of Hoofbeats\" (Alliance)", achievementID = 12934 },
    },

    ["Prestigious Bloodforged Courser"] = {
        -- source: https://www.wowhead.com/achievement=12917/honor-level-500
        { text = "Reach Honor Level 500", achievementID = 12917 },
    },

    ["Honeyback Hivemother"] = {
        -- source: https://www.wowhead.com/achievement=40956/im-on-island-time
        { text = "Earn Loremaster of Zandalar and Loremaster of Kul Tiras" },
        { text = "Earn Battle for Azeroth Explorer", achievementID = 12988 },
        { text = "Complete the rest of the \"I'm On Island Time\" achievements" },
        { text = "Earn \"I'm On Island Time\"", achievementID = 40956 },
    },

    -- ==========================================================
    -- Event-gated
    -- ==========================================================

    ["Obsidian Worldbreaker"] = {
        -- source: https://www.wowhead.com/achievement=13931/memories-of-fel-frost-and-fire
        availability = "WoW Anniversary",
        { text = "Defeat Chromie's Memory: Burning Crusade" },
        { text = "Defeat Chromie's Memory: Wrath of the Lich King" },
        { text = "Defeat Chromie's Memory: Cataclysm" },
        { text = "Complete the quest \"How Things 'Really' Happened...\"", questID = 57298 },
        { text = "Earn \"Memories of Fel, Frost and Fire\"", achievementID = 13931 },
    },

    ["Frostwolf Snarler"] = {
        -- source: https://www.wowhead.com/achievement=13930/alterac-valley-of-olde
        -- Horde only.
        availability = "WoW Anniversary (Korrak's Revenge)",
        { text = "Earn 200 Timewarped Badges from Korrak's Revenge quests and matches", currencyID = 1166, amount = 200 },
        { text = "Earn \"Alterac Valley of Olde\"", achievementID = 13930 },
    },

    ["Stormpike Battle Ram"] = {
        -- source: https://www.wowhead.com/achievement=13928/alterac-valley-of-olde
        -- Alliance only.
        availability = "WoW Anniversary (Korrak's Revenge)",
        { text = "Earn 200 Timewarped Badges from Korrak's Revenge quests and matches", currencyID = 1166, amount = 200 },
        { text = "Earn \"Alterac Valley of Olde\"", achievementID = 13928 },
    },

    ["Beastlord's Irontusk"] = {
        -- source: https://wago.tools/db2/Mount (ID 1242) - currency 1166
        availability = "Warlords of Draenor Timewalking",
        { text = "Save up 5000 Timewarped Badges", currencyID = 1166, amount = 5000 },
        { text = "Buy the mount from Kronnus in Warspear (Horde) or Tempra in Stormshield (Alliance)" },
    },

    ["Beastlord's Warwolf"] = {
        -- source: https://wago.tools/db2/Mount (ID 1243) - currency 1166
        availability = "Warlords of Draenor Timewalking",
        { text = "Save up 5000 Timewarped Badges", currencyID = 1166, amount = 5000 },
        { text = "Buy the mount from Kronnus in Warspear (Horde) or Tempra in Stormshield (Alliance)" },
    },

    -- ==========================================================
    -- Allied race unlocks
    -- ==========================================================

    ["Kul Tiran Charger"] = {
        -- source: https://www.wowhead.com/achievement=13163/allied-races-kul-tiran
        -- Alliance only.
        { text = "Meet the Kul Tiran unlock requirements (Tides of Vengeance campaign and Kul Tiras reputations)",
          achievementID = 13160 },
        { text = "Recruit the Kul Tiran allied race and level one to max level", achievementID = 13163 },
    },

    ["Mechagon Mechanostrider"] = {
        -- source: https://www.wowhead.com/achievement=14013/allied-races-mechagnome
        -- Alliance only.
        { text = "Meet the Mechagnome unlock requirements (Mechagon storyline and Rustbolt Resistance reputation)",
          achievementID = 13991 },
        { text = "Recruit the Mechagnome allied race and level one to max level", achievementID = 14013 },
    },

    ["Dark Iron Core Hound"] = {
        -- source: https://www.wowhead.com/achievement=12515/allied-races-dark-iron-dwarf
        -- Alliance only.
        { text = "Meet the Dark Iron Dwarf unlock requirements (Ready for War and the Dark Iron recruitment scenario)",
          achievementID = 13089 },
        { text = "Recruit the Dark Iron Dwarf allied race and level one to max level", achievementID = 12515 },
    },

    ["Mag'har Direwolf"] = {
        -- source: https://www.wowhead.com/achievement=12518/allied-races-maghar-orc
        -- Horde only.
        { text = "Meet the Mag'har Orc unlock requirements (Ready for War and the Mag'har recruitment scenario)",
          achievementID = 13092 },
        { text = "Recruit the Mag'har Orc allied race and level one to max level", achievementID = 12518 },
    },

    ["Caravan Hyena"] = {
        -- source: https://www.wowhead.com/achievement=13206/allied-races-vulpera
        -- Horde only.
        { text = "Meet the Vulpera unlock requirements (Vol'dun storyline and Voldunai reputation)",
          achievementID = 13993 },
        { text = "Recruit the Vulpera allied race and level one to max level", achievementID = 13206 },
    },

    ["Zandalari Direhorn"] = {
        -- source: https://www.wowhead.com/achievement=13161/allied-races-zandalari-troll
        -- Horde only.
        { text = "Meet the Zandalari Troll unlock requirements (Tides of Vengeance campaign and Zandalar reputations)",
          achievementID = 13159 },
        { text = "Recruit the Zandalari Troll allied race and level one to max level", achievementID = 13161 },
    },

    ["Crusader's Direhorn"] = {
        -- source: https://wago.tools/db2/Mount (ID 1225) - Zandalari Troll Paladin class mount
        { text = "Unlock the Zandalari Troll allied race", achievementID = 13161 },
        { text = "Create a Zandalari Troll Paladin and reach level 10" },
    },

    ["Darkforge Ram"] = {
        -- source: https://wago.tools/db2/Mount (ID 1046) - Dark Iron Dwarf Paladin class mount
        { text = "Unlock the Dark Iron Dwarf allied race", achievementID = 12515 },
        { text = "Create a Dark Iron Dwarf Paladin and reach level 10" },
    },

    -- =================================================================
    -- WARLORDS OF DRAENOR  (researched 2026-08-22)
    -- Keys taken straight from Mount.db2. Draenor Pathfinder's two
    -- faction-split sub-achievements (Securing Draenor, Loremaster of
    -- Draenor) carry no achievementID on purpose - one ID would silently
    -- never tick for half of players.
    -- =================================================================

    -- source: https://wago.tools/db2/Mount/csv (ID 647) + https://www.wowhead.com/quest=36914 + https://www.wowhead.com/quest=37028
    ["Trained Snarler"] = {
        { text = "Tame a young wolf with the Wolf Lasso (Wrangling a Wolf)", questID = 36914, start = "Automatically offered at your Garrison Stables once built (Level 1+)" },
        { text = "Complete the Wolf Training daily chain, ending in defeating Maimclaw", questID = 37028 },
    },
    -- source: https://wago.tools/db2/Mount/csv (ID 615) + https://www.wowhead.com/quest=36915 + https://www.wowhead.com/quest=37021
    ["Trained Meadowstomper"] = {
        { text = "Tame a young elekk with the Elekk Lasso (Entangling an Elekk)", questID = 36915, start = "Automatically offered at your Garrison Stables once built (Level 1+)" },
        { text = "Complete the Elekk Training daily chain, ending in defeating Maimclaw", questID = 37021 },
    },
    -- source: https://wago.tools/db2/Mount/csv (ID 629) + https://www.wowhead.com/quest=36945 + https://www.wowhead.com/quest=37079
    ["Trained Riverwallow"] = {
        { text = "Tame a young riverbeast with the Riverbeast Lasso (Requisition a Riverbeast)", questID = 36945, start = "Automatically offered at your Garrison Stables once built (Level 1+)" },
        { text = "Complete the Riverbeast Training daily chain, ending in defeating Maimclaw", questID = 37079 },
    },
    -- source: https://wago.tools/db2/Mount/csv (ID 628) + https://www.wowhead.com/quest=36913 + https://www.wowhead.com/quest=37004
    ["Trained Rocktusk"] = {
        { text = "Tame a young boar with the Boar Lasso (Besting a Boar)", questID = 36913, start = "Automatically offered at your Garrison Stables once built (Level 1+)" },
        { text = "Complete the Boar Training daily chain, ending in defeating Maimclaw", questID = 37004 },
    },
    -- source: https://wago.tools/db2/Mount/csv (ID 637) + https://www.wowhead.com/quest=36911 + https://www.wowhead.com/quest=37104
    ["Trained Silverpelt"] = {
        { text = "Tame a young talbuk with the Talbuk Lasso (Taming a Talbuk)", questID = 36911, start = "Automatically offered at your Garrison Stables once built (Level 1+)" },
        { text = "Complete the Talbuk Training daily chain, ending in defeating Maimclaw", questID = 37104 },
    },
    -- source: https://wago.tools/db2/Mount/csv (ID 609) + https://www.wowhead.com/quest=36912 + https://www.wowhead.com/quest=37059
    ["Trained Icehoof"] = {
        { text = "Tame a young clefthoof with the Clefthoof Lasso (Capturing a Clefthoof)", questID = 36912, start = "Automatically offered at your Garrison Stables once built (Level 1+)" },
        { text = "Complete the Clefthoof Training daily chain, ending in defeating Maimclaw", questID = 37059 },
    },

    -- source: https://wago.tools/db2/Mount/csv (ID 488) + https://wago.tools/db2/Faction/csv (Nat Pagle = 1358) + https://nether.wowhead.com/tooltip/item/117397
    ["Crimson Water Strider"] = {
        { text = "Reach Honored with Nat Pagle", factionID = 1358, reaction = 6 },
        { text = "Collect 100 Nat's Lucky Coins from Garrison Fishing Shack Lunker turn-ins", itemID = 117397, count = 100 },
    },

    -- source: https://wago.tools/db2/Mount/csv (ID 617) + https://wago.tools/db2/Faction/csv (Council of Exarchs = 1731) + https://wago.tools/db2/CurrencyTypes/csv (Apexis Crystal = 823)
    ["Dusty Rockhide"] = {
        { text = "Reach Exalted with Council of Exarchs", factionID = 1731, reaction = 8 },
        { text = "Save up 5,000 Apexis Crystals", currencyID = 823, amount = 5000 },
    },
    -- source: https://wago.tools/db2/Mount/csv (ID 618) + https://wago.tools/db2/Faction/csv (Sha'tari Defense = 1710)
    ["Armored Irontusk"] = {
        { text = "Reach Exalted with Sha'tari Defense", factionID = 1710, reaction = 8 },
        { text = "Save up 5,000 Apexis Crystals", currencyID = 823, amount = 5000 },
    },
    -- source: https://wago.tools/db2/Mount/csv (ID 625) + https://wago.tools/db2/Faction/csv (Steamwheedle Preservation Society = 1711)
    ["Domesticated Razorback"] = {
        { text = "Reach Exalted with Steamwheedle Preservation Society", factionID = 1711, reaction = 8 },
        { text = "Save up 5,000 Apexis Crystals", currencyID = 823, amount = 5000 },
    },
    -- source: https://wago.tools/db2/Mount/csv (ID 635) + https://wago.tools/db2/Faction/csv (Arakkoa Outcasts = 1515)
    ["Shadowmane Charger"] = {
        { text = "Reach Exalted with Arakkoa Outcasts", factionID = 1515, reaction = 8 },
        { text = "Save up 5,000 Apexis Crystals", currencyID = 823, amount = 5000 },
    },
    -- source: https://wago.tools/db2/Mount/csv (ID 638) + https://wago.tools/db2/Faction/csv (Vol'jin's Spear = 1681)
    ["Breezestrider Stallion"] = {
        { text = "Reach Exalted with Vol'jin's Spear", factionID = 1681, reaction = 8 },
        { text = "Save up 5,000 Apexis Crystals", currencyID = 823, amount = 5000 },
    },
    -- source: https://wago.tools/db2/Mount/csv (ID 639) + https://wago.tools/db2/Faction/csv (Wrynn's Vanguard = 1682)
    ["Pale Thorngrazer"] = {
        { text = "Reach Exalted with Wrynn's Vanguard", factionID = 1682, reaction = 8 },
        { text = "Save up 5,000 Apexis Crystals", currencyID = 823, amount = 5000 },
    },
    -- source: https://wago.tools/db2/Mount/csv (ID 645) + https://wago.tools/db2/Faction/csv (Laughing Skull Orcs = 1708)
    ["Ironside Warwolf"] = {
        { text = "Reach Exalted with Laughing Skull Orcs", factionID = 1708, reaction = 8 },
        { text = "Save up 5,000 Apexis Crystals", currencyID = 823, amount = 5000 },
    },
    -- source: https://wago.tools/db2/Mount/csv (ID 648) + https://wago.tools/db2/Faction/csv (Frostwolf Orcs = 1445)
    ["Swift Frostwolf"] = {
        { text = "Reach Exalted with Frostwolf Orcs", factionID = 1445, reaction = 8 },
        { text = "Save up 5,000 Apexis Crystals", currencyID = 823, amount = 5000 },
    },

    -- source: https://wago.tools/db2/Mount/csv (ID 624) + https://wago.tools/db2/Faction/csv (The Saberstalkers = 1850) + https://nether.wowhead.com/tooltip/item/124099
    ["Wild Goretusk"] = {
        { text = "Reach Honored with The Saberstalkers", factionID = 1850, reaction = 6 },
        { text = "Collect 1,000 Blackfang Claws in Tanaan Jungle", itemID = 124099, count = 1000 },
    },
    -- source: https://wago.tools/db2/Mount/csv (ID 765) + https://wago.tools/db2/Faction/csv (The Saberstalkers = 1850)
    ["Bristling Hellboar"] = {
        { text = "Reach Exalted with The Saberstalkers", factionID = 1850, reaction = 8 },
        { text = "Collect 5,000 Blackfang Claws in Tanaan Jungle", itemID = 124099, count = 5000 },
    },

    -- source: https://wago.tools/db2/Mount/csv (ID 753) + https://wago.tools/db2/Faction/csv (Order of the Awakened = 1849)
    ["Corrupted Dreadwing"] = {
        { text = "Reach Friendly with Order of the Awakened", factionID = 1849, reaction = 5 },
        { text = "Save up 150,000 Apexis Crystals", currencyID = 823, amount = 150000 },
    },

    -- source: https://wago.tools/db2/Mount/csv (ID 768) + https://wago.tools/db2/Faction/csv (Vol'jin's Headhunters = 1848, Hand of the Prophet = 1847)
    ["Deathtusk Felboar"] = {
        { text = "Reach Exalted with Vol'jin's Headhunters (Horde)", factionID = 1848, reaction = 8 },
        { text = "Reach Exalted with Hand of the Prophet (Alliance)", factionID = 1847, reaction = 8 },
    },

    -- source: https://wago.tools/db2/Mount/csv (ID 772) + https://nether.wowhead.com/tooltip/achievement/10018 (meta) + component achievements 8935/9562-9564/9833/10349/10348
    ["Soaring Skyterror"] = {
        { text = "Complete Draenor Explorer (discover all 6 Draenor zones)", achievementID = 8935 },
        { text = "Complete Securing Draenor (finish all 12 Draenor bonus objectives) - achievement ID differs by faction, shown unticked here" },
        { text = "Complete Loremaster of Draenor (finish the main storyline in every Draenor zone) - achievement ID differs by faction, shown unticked here" },
        { text = "Complete Tanaan Diplomat (Revered with all 3 Tanaan Jungle factions)", achievementID = 10349 },
        { text = "Complete Master Treasure Hunter (find 100 Draenor treasures, excluding Tanaan Jungle)", achievementID = 10348 },
        { text = "Earn the Draenor Pathfinder meta-achievement", achievementID = 10018 },
    },

    -- source: https://wago.tools/db2/Mount/csv (IDs 640, 641, 755, 756) + https://nether.wowhead.com/tooltip/item/103533
    ["Vicious War Raptor"] = {
        { text = "Earn a Vicious Saddle through rated PvP and turn it in to the mount quartermaster", itemID = 103533, count = 1 },
    },
    ["Vicious War Kodo"] = {
        { text = "Earn a Vicious Saddle through rated PvP and turn it in to the mount quartermaster", itemID = 103533, count = 1 },
    },
    ["Vicious War Ram"] = {
        { text = "Earn a Vicious Saddle through rated PvP and turn it in to the mount quartermaster", itemID = 103533, count = 1 },
    },
    ["Vicious War Mechanostrider"] = {
        { text = "Earn a Vicious Saddle through rated PvP and turn it in to the mount quartermaster", itemID = 103533, count = 1 },
    },

    -- source: https://wago.tools/db2/Mount/csv (ID 769) + https://www.wowhead.com/quest=39651 + https://nether.wowhead.com/tooltip/item/128659
    ["Minion of Grumpus"] = {
        availability = "Feast of Winter Veil",
        { text = "Have a level 3 Garrison" },
        { text = "Complete the daily Winter Veil quests in Frostfire Ridge for Merry Supplies", questID = 39651, start = "Winter Veil NPCs in Frostfire Ridge (Horde or Alliance garrison zone)" },
        { text = "Buy Savage Gifts of Winter Veil from Izzy Hollyfizzle (Garrison Events Coordinator) for 5 Merry Supplies each and open them for a chance at the mount" },
    },

    -- =================================================================
    -- MISTS OF PANDARIA  (researched 2026-08-22)
    -- Several MoP quests exist as separate Horde/Alliance IDs for the same
    -- effective step. Where both were verified, the Horde ID is used as
    -- the primary questID (ticks correctly for Horde, shows unticked for
    -- Alliance - never a false tick either way) and the Alliance ID is
    -- left in a comment.
    -- =================================================================

    -- source: https://www.wowhead.com/quest=31810/riding-the-skies (Order of the Cloud Serpent questline)
    ["Jade Cloud Serpent"] = {
        { text = "Pick up the Order of the Cloud Serpent breadcrumb", questID = 80311, start = "Toortle Wider in The Jade Forest" },
        { text = "Turn in Order of the Cloud Serpent", questID = 80311, start = "Elder Anli at The Arboretum, The Jade Forest" },
        { text = "Do Wild Things", questID = 30134, start = "Elder Anli at The Arboretum, The Jade Forest" },
        { text = "Do Beating the Odds", questID = 30135, start = "Instructor Tong at Windward Isle, The Jade Forest" },
        { text = "Do Empty Nests", questID = 30136, start = "Instructor Tong at Windward Isle, The Jade Forest" },
        { text = "Do Egg Collection", questID = 30137, start = "Instructor Tong at Windward Isle, The Jade Forest" },
        { text = "Choose the egg that hatches into a Jade Cloud Serpent (Choosing the One)", questID = 30138, start = "Instructor Tong at Windward Isle, The Jade Forest" },
        { text = "Complete The Rider's Journey", questID = 30139, start = "Instructor Skythorn at The Arboretum, The Jade Forest" },
        { text = "Reach Exalted with Order of the Cloud Serpent", factionID = 1271, reaction = 8 },
        { text = "Turn in Riding the Skies to claim your Jade Cloud Serpent", questID = 31810, start = "Elder Anli at The Arboretum, The Jade Forest" },
    },

    -- source: https://www.wowhead.com/quest=31810/riding-the-skies (Order of the Cloud Serpent questline)
    ["Azure Cloud Serpent"] = {
        { text = "Pick up the Order of the Cloud Serpent breadcrumb", questID = 80311, start = "Toortle Wider in The Jade Forest" },
        { text = "Turn in Order of the Cloud Serpent", questID = 80311, start = "Elder Anli at The Arboretum, The Jade Forest" },
        { text = "Do Wild Things", questID = 30134, start = "Elder Anli at The Arboretum, The Jade Forest" },
        { text = "Do Beating the Odds", questID = 30135, start = "Instructor Tong at Windward Isle, The Jade Forest" },
        { text = "Do Empty Nests", questID = 30136, start = "Instructor Tong at Windward Isle, The Jade Forest" },
        { text = "Do Egg Collection", questID = 30137, start = "Instructor Tong at Windward Isle, The Jade Forest" },
        { text = "Choose the egg that hatches into an Azure Cloud Serpent (Choosing the One)", questID = 30138, start = "Instructor Tong at Windward Isle, The Jade Forest" },
        { text = "Complete The Rider's Journey", questID = 30139, start = "Instructor Skythorn at The Arboretum, The Jade Forest" },
        { text = "Reach Exalted with Order of the Cloud Serpent", factionID = 1271, reaction = 8 },
        { text = "Turn in Riding the Skies to claim your Azure Cloud Serpent", questID = 31810, start = "Elder Anli at The Arboretum, The Jade Forest" },
    },

    -- source: https://www.wowhead.com/quest=31810/riding-the-skies (Order of the Cloud Serpent questline)
    ["Golden Cloud Serpent"] = {
        { text = "Pick up the Order of the Cloud Serpent breadcrumb", questID = 80311, start = "Toortle Wider in The Jade Forest" },
        { text = "Turn in Order of the Cloud Serpent", questID = 80311, start = "Elder Anli at The Arboretum, The Jade Forest" },
        { text = "Do Wild Things", questID = 30134, start = "Elder Anli at The Arboretum, The Jade Forest" },
        { text = "Do Beating the Odds", questID = 30135, start = "Instructor Tong at Windward Isle, The Jade Forest" },
        { text = "Do Empty Nests", questID = 30136, start = "Instructor Tong at Windward Isle, The Jade Forest" },
        { text = "Do Egg Collection", questID = 30137, start = "Instructor Tong at Windward Isle, The Jade Forest" },
        { text = "Choose the egg that hatches into a Golden Cloud Serpent (Choosing the One)", questID = 30138, start = "Instructor Tong at Windward Isle, The Jade Forest" },
        { text = "Complete The Rider's Journey", questID = 30139, start = "Instructor Skythorn at The Arboretum, The Jade Forest" },
        { text = "Reach Exalted with Order of the Cloud Serpent", factionID = 1271, reaction = 8 },
        { text = "Turn in Riding the Skies to claim your Golden Cloud Serpent", questID = 31810, start = "Elder Anli at The Arboretum, The Jade Forest" },
    },

    -- source: https://www.wowhead.com/quest=31277/surprise-attack (Shado-Pan induction finale)
    ["Onyx Cloud Serpent"] = {
        { text = "Start the Shado-Pan storyline with Defense of Shado-Pan Fallback", questID = 30665, start = "Shado-Master Chong in Kun-Lai Summit" },
        { text = "Continue the Shado-Pan storyline through Kun-Lai Summit into Townlong Steppes to the Shado-Pan Garrison" },
        { text = "Do Mogu Incursions", questID = 31266, start = "Master Snowdrift at the Shado-Pan Garrison, Townlong Steppes" },
        { text = "Complete Surprise Attack! to be inducted into the Shado-Pan and claim your Onyx Cloud Serpent", questID = 31277, start = "Master Snowdrift at the Shado-Pan Garrison, Townlong Steppes" },
    },

    -- source: https://www.wowhead.com/npc=64941/jaluu-the-generous (Golden Lotus reputation vendor)
    ["Azure Riding Crane"] = {
        { text = "Do A Celestial Experience", questID = 31394, start = "Your faction's emissary at the Temple of the White Tiger, Kun-Lai Summit" },
        { text = "Do A Witness to History", questID = 31511, start = "Temple of the White Tiger, Kun-Lai Summit" }, -- Alliance variant: questID 31512
        { text = "Do The Ruins of Guo-Lai", questID = 30632, start = "Anji Autumnlight at the Ruins of Guo-Lai, Vale of Eternal Blossoms" },
        { text = "Continue the Golden Lotus storyline (Out With the Scouts, Barring Entry, Killing the Quilen, Stones of Power, The Guo-Lai Halls) to open the Golden Pagoda daily hub" },
        { text = "Reach Exalted with Golden Lotus", factionID = 1269, reaction = 8 },
    },

    -- source: https://www.wowhead.com/npc=64941/jaluu-the-generous (Golden Lotus reputation vendor)
    ["Golden Riding Crane"] = {
        { text = "Do A Celestial Experience", questID = 31394, start = "Your faction's emissary at the Temple of the White Tiger, Kun-Lai Summit" },
        { text = "Do A Witness to History", questID = 31511, start = "Temple of the White Tiger, Kun-Lai Summit" }, -- Alliance variant: questID 31512
        { text = "Do The Ruins of Guo-Lai", questID = 30632, start = "Anji Autumnlight at the Ruins of Guo-Lai, Vale of Eternal Blossoms" },
        { text = "Continue the Golden Lotus storyline (Out With the Scouts, Barring Entry, Killing the Quilen, Stones of Power, The Guo-Lai Halls) to open the Golden Pagoda daily hub" },
        { text = "Reach Exalted with Golden Lotus", factionID = 1269, reaction = 8 },
    },

    -- source: https://www.wowhead.com/npc=64941/jaluu-the-generous (Golden Lotus reputation vendor)
    ["Regal Riding Crane"] = {
        { text = "Do A Celestial Experience", questID = 31394, start = "Your faction's emissary at the Temple of the White Tiger, Kun-Lai Summit" },
        { text = "Do A Witness to History", questID = 31511, start = "Temple of the White Tiger, Kun-Lai Summit" }, -- Alliance variant: questID 31512
        { text = "Do The Ruins of Guo-Lai", questID = 30632, start = "Anji Autumnlight at the Ruins of Guo-Lai, Vale of Eternal Blossoms" },
        { text = "Continue the Golden Lotus storyline (Out With the Scouts, Barring Entry, Killing the Quilen, Stones of Power, The Guo-Lai Halls) to open the Golden Pagoda daily hub" },
        { text = "Reach Exalted with Golden Lotus", factionID = 1269, reaction = 8 },
    },

    -- source: https://www.wowhead.com/npc=64596/rushi-the-fox (Shado-Pan reputation vendor)
    ["Green Shado-Pan Riding Tiger"] = {
        { text = "Start the Shado-Pan storyline with Defense of Shado-Pan Fallback", questID = 30665, start = "Shado-Master Chong in Kun-Lai Summit" },
        { text = "Continue the Shado-Pan storyline through Kun-Lai Summit into Townlong Steppes, culminating in Mogu Incursions / Surprise Attack! at the Shado-Pan Garrison" },
        { text = "Reach Exalted with Shado-Pan", factionID = 1270, reaction = 8 },
    },

    -- source: https://www.wowhead.com/npc=64596/rushi-the-fox (Shado-Pan reputation vendor)
    ["Blue Shado-Pan Riding Tiger"] = {
        { text = "Start the Shado-Pan storyline with Defense of Shado-Pan Fallback", questID = 30665, start = "Shado-Master Chong in Kun-Lai Summit" },
        { text = "Continue the Shado-Pan storyline through Kun-Lai Summit into Townlong Steppes, culminating in Mogu Incursions / Surprise Attack! at the Shado-Pan Garrison" },
        { text = "Reach Exalted with Shado-Pan", factionID = 1270, reaction = 8 },
    },

    -- source: https://www.wowhead.com/npc=64596/rushi-the-fox (Shado-Pan reputation vendor)
    ["Red Shado-Pan Riding Tiger"] = {
        { text = "Start the Shado-Pan storyline with Defense of Shado-Pan Fallback", questID = 30665, start = "Shado-Master Chong in Kun-Lai Summit" },
        { text = "Continue the Shado-Pan storyline through Kun-Lai Summit into Townlong Steppes, culminating in Mogu Incursions / Surprise Attack! at the Shado-Pan Garrison" },
        { text = "Reach Exalted with Shado-Pan", factionID = 1270, reaction = 8 },
    },

    -- source: https://www.wowhead.com/guide/reputation/guide-to-the-august-celestials
    ["Thundering August Cloud Serpent"] = {
        { text = "Do A Celestial Experience", questID = 31394, start = "Your faction's emissary at the Temple of the White Tiger, Kun-Lai Summit" },
        { text = "Do A Witness to History", questID = 31511, start = "Temple of the White Tiger, Kun-Lai Summit" }, -- Alliance variant: questID 31512
        { text = "Complete the rotating Celestial trial dailies (Trial At The Temple of the White Tiger, Challenge At The Temple of the Red Crane, Attack At The Temple of the Jade Serpent, Defense At Niuzao Temple) dispatched from the Shrine of Seven Stars (Alliance) / Shrine of Two Moons (Horde)" },
        { text = "Reach Exalted with The August Celestials", factionID = 1341, reaction = 8 },
    },

    -- source: https://www.wowhead.com/quest=31003/psycho-mantid
    ["Amber Scorpion"] = {
        { text = "Do Falling Down", questID = 31001, start = "Bowmistress Li near the Gate of the Setting Sun, Vale of Eternal Blossoms" },
        { text = "Do Nope", questID = 31002, start = "Bowmistress Li near the Gate of the Setting Sun, Vale of Eternal Blossoms" },
        { text = "Do Psycho Mantid", questID = 31003, start = "Marksman Lann in the Dread Wastes" },
        { text = "Continue the Klaxxi storyline in the Dread Wastes to unlock their daily quests" },
        { text = "Reach Exalted with The Klaxxi", factionID = 1337, reaction = 8 },
    },

    -- source: https://www.wowhead.com/npc=63845/gina-mudclaw (Tillers reputation vendor)
    ["Brown Riding Goat"] = {
        { text = "Do The Tillers", questID = 31374, start = "Farmhand Dooka in the Vale of Eternal Blossoms" }, -- Alliance variant: questID 31372, given by Tang Ironhoe
        { text = "Do A Helping Hand", questID = 30252, start = "Farmer Yoon at Sunsong Ranch, Valley of the Four Winds" },
        { text = "Grow your farm and continue helping the Tillers (Learn and Grow questlines)" },
        { text = "Reach Exalted with The Tillers", factionID = 1272, reaction = 8 },
    },

    -- source: https://www.wowhead.com/npc=63845/gina-mudclaw (Tillers reputation vendor)
    ["White Riding Goat"] = {
        { text = "Do The Tillers", questID = 31374, start = "Farmhand Dooka in the Vale of Eternal Blossoms" }, -- Alliance variant: questID 31372, given by Tang Ironhoe
        { text = "Do A Helping Hand", questID = 30252, start = "Farmer Yoon at Sunsong Ranch, Valley of the Four Winds" },
        { text = "Grow your farm and continue helping the Tillers (Learn and Grow questlines)" },
        { text = "Reach Exalted with The Tillers", factionID = 1272, reaction = 8 },
    },

    -- source: https://www.wowhead.com/npc=63845/gina-mudclaw (Tillers reputation vendor)
    ["Black Riding Goat"] = {
        { text = "Do The Tillers", questID = 31374, start = "Farmhand Dooka in the Vale of Eternal Blossoms" }, -- Alliance variant: questID 31372, given by Tang Ironhoe
        { text = "Do A Helping Hand", questID = 30252, start = "Farmer Yoon at Sunsong Ranch, Valley of the Four Winds" },
        { text = "Grow your farm and continue helping the Tillers (Learn and Grow questlines)" },
        { text = "Reach Exalted with The Tillers", factionID = 1272, reaction = 8 },
    },

    -- source: https://www.wowhead.com/npc=64694/nat-pagle (Anglers reputation vendor)
    ["Azure Water Strider"] = {
        { text = "Do The Anglers", questID = 31370, start = "Master Angler Karu at Angler's Wharf, Krasarang Wilds" }, -- Alliance variant: questID 31369, given by Master Angler Marina
        { text = "Complete the introductory fishing dailies at Angler's Wharf to unlock the daily quest hub" },
        { text = "Reach Exalted with The Anglers", factionID = 1302, reaction = 8 },
    },

    -- source: https://www.wowhead.com/quest=31016/the-lorewalkers
    ["Red Flying Cloud"] = {
        { text = "Do The Lorewalkers", questID = 31016, start = "A letter from Lorewalker Cho; turn in at the Seat of Knowledge, Vale of Eternal Blossoms" },
        { text = "Do Your Private Collection", start = "Lorewalker Cho at the Seat of Knowledge, Vale of Eternal Blossoms" },
        { text = "Grind Lorewalkers reputation via their scenario and artifact-collection quests" },
        { text = "Reach Exalted with The Lorewalkers", factionID = 1345, reaction = 8 },
    },

    -- source: https://www.wowhead.com/quest=32680/the-storm-gathers (Isle of Thunder intro chain)
    ["Golden Primal Direhorn"] = {
        { text = "Pick up Thunder Calls (auto-added at max level)", questID = 32679, start = "Automatically added to your quest log" }, -- Horde variant: questID 32678, reports to Scout Captain Elsia instead
        { text = "Report in at the Shado-Pan Garrison, Townlong Steppes", start = "Vereesa Windrunner at the Shado-Pan Garrison, Townlong Steppes" }, -- Horde: Scout Captain Elsia
        { text = "Do The Storm Gathers and travel to the Isle of Thunder", questID = 32680, start = "Scout Captain Elsia at the Shado-Pan Garrison, Townlong Steppes" }, -- confirmed Horde ID; Alliance equivalent exists but its questID was not verified
        { text = "Grind Isle of Thunder dailies for reputation" },
        { text = "Reach Exalted with Kirin Tor Offensive (Alliance) / Sunreaver Onslaught (Horde)", factionID = 1387, reaction = 8 }, -- Horde equivalent factionID: 1388
    },

    -- source: https://warcraft.wiki.gg/wiki/Journey_to_the_Timeless_Isle ; https://www.wowhead.com/quest=33335/the-last-emperor
    ["Heavenly Golden Cloud Serpent"] = {
        { text = "Do Journey to the Timeless Isle", questID = 33232, start = "Chromie near the Seat of Knowledge, Vale of Eternal Blossoms" }, -- Alliance variant: questID 33231
        { text = "Do The Last Emperor", questID = 33335, start = "Emperor Shaohao on the Timeless Isle" },
        { text = "Do Timeless Nutriment", questID = 33340, start = "Emperor Shaohao on the Timeless Isle" },
        { text = "Do Wayshrines of the Celestials", questID = 33341, start = "Emperor Shaohao on the Timeless Isle" },
        { text = "Do Drive Back the Flame (unlocks at Honored with Emperor Shaohao)", questID = 33342, start = "Emperor Shaohao on the Timeless Isle" },
        { text = "Do The Archiereus of Flame", questID = 33343, start = "Emperor Shaohao on the Timeless Isle" },
        { text = "Farm Ordon yaungol at Firewalker Ruins / Blazing Way, and/or run the repeatable Path of the Mistwalker daily", questID = 33374, start = "Emperor Shaohao on the Timeless Isle" },
        { text = "Reach Exalted with Emperor Shaohao", factionID = 1492, reaction = 8 },
    },

    -- source: https://www.wowhead.com/guide/events/brawlers-guild-overview
    ["Brawler's Burly Mushan Beast"] = {
        { text = "Obtain a Blood-Soaked Invitation to join the Brawler's Guild (rare drop from various world rares, or purchased from the Black Market Auction House)" },
        { text = "Gain entry to Brawl'gar Arena (Horde) / Deeprun Tram brawler pit (Alliance) using the invitation" },
    },

    -- source: https://www.wowhead.com/guide/events/brawlers-guild-overview
    ["Brawler's Burly Basilisk"] = {
        { text = "Obtain a Blood-Soaked Invitation to join the Brawler's Guild (rare drop from various world rares, or purchased from the Black Market Auction House)" },
        { text = "Gain entry to Brawl'gar Arena (Horde) / Deeprun Tram brawler pit (Alliance) using the invitation" },
    },

    -- =================================================================
    -- CATACLYSM  (researched 2026-08-22)
    -- Only mounts with a real gate BEFORE acquisition are listed here.
    -- Plain rare-mob drops (Aeonaxx, Poseidus, Dormus the Camel-Hoarder),
    -- plain dungeon/raid boss drops, the Landro Longshot fishing gambling
    -- pool, and straightforward achievement rewards with no earlier
    -- gating are deliberately absent - the client's own source text and
    -- the game's native achievement tracking already cover them.
    -- "Drake of the West Wind" is a single shared Mount Journal entry
    -- buyable by either faction (Alliance via Baradin's Wardens, Horde
    -- via Hellscream's Reach); a single factionID cannot express that OR,
    -- so that reputation step is left text-only on purpose.
    -- =================================================================

    ["Brown Riding Camel"] = {
        -- source: https://wago.tools/db2/Mount/csv (Mount ID 398); https://wago.tools/db2/Faction/csv (Ramkahen ID 1173)
        { text = "Reach Exalted with Ramkahen", factionID = 1173, reaction = 8 },
        { text = "Buy the mount from Blacksmith Abasi in Ramkahen, Uldum, for gold" },
    },

    ["Tan Riding Camel"] = {
        -- source: https://wago.tools/db2/Mount/csv (Mount ID 399); https://wago.tools/db2/Faction/csv (Ramkahen ID 1173)
        { text = "Reach Exalted with Ramkahen", factionID = 1173, reaction = 8 },
        { text = "Buy the mount from Blacksmith Abasi in Ramkahen, Uldum, for gold" },
    },

    ["Drake of the West Wind"] = {
        -- source: https://wago.tools/db2/Mount/csv (Mount ID 394); vendor cost per https://www.wowhead.com/item=65356/reins-of-the-drake-of-the-west-wind
        { text = "Reach Exalted with Baradin's Wardens (Alliance) or Hellscream's Reach (Horde)" },
        { text = "Save up 200 Tol Barad Commendations", currencyID = 391, amount = 200 },
        { text = "Buy the mount from Quartermaster Brazie (Alliance) or Pogg (Horde) in Tol Barad Peninsula" },
    },

    ["Spectral Steed"] = {
        -- source: https://wago.tools/db2/Mount/csv (Mount ID 405); https://wago.tools/db2/Faction/csv (Baradin's Wardens ID 1177)
        { text = "Reach Exalted with Baradin's Wardens", factionID = 1177, reaction = 8 },
        { text = "Save up 165 Tol Barad Commendations", currencyID = 391, amount = 165 },
        { text = "Buy the mount from Quartermaster Brazie in Tol Barad Peninsula" },
    },

    ["Spectral Wolf"] = {
        -- source: https://wago.tools/db2/Mount/csv (Mount ID 406); https://wago.tools/db2/Faction/csv (Hellscream's Reach ID 1178)
        { text = "Reach Exalted with Hellscream's Reach", factionID = 1178, reaction = 8 },
        { text = "Save up 165 Tol Barad Commendations", currencyID = 391, amount = 165 },
        { text = "Buy the mount from Pogg in Tol Barad Peninsula" },
    },

    ["Dark Phoenix"] = {
        -- source: https://www.wowhead.com/achievement=4988/guild-glory-of-the-cataclysm-raider ; https://wago.tools/db2/Mount/csv (Mount ID 401)
        -- "Guild Glory of the Cataclysm Raider" is a GUILD achievement, tracked
        -- separately from personal achievement completion, so no achievementID is
        -- attached here - it would never auto-tick off the player achievement API.
        { text = "Have your guild clear Blackwing Descent, The Bastion of Twilight, and Throne of the Four Winds together for the guild achievement \"Guild Glory of the Cataclysm Raider\"" },
        { text = "Reach Exalted reputation with your guild", factionID = 1168, reaction = 8 },
        { text = "Buy the mount from your Guild Vendor for 3000 gold" },
    },

    -- =================================================================
    -- WRATH OF THE LICH KING  (researched 2026-08-22)
    -- Argent Tournament mounts hide a huge gate the Mount Journal never
    -- shows: the vendor selling them is unusable until you've earned that
    -- city's "Champion of <City>" achievement via the Tournament's daily
    -- quest chain. Argent Charger/Warhorse need the harder "Crusader"
    -- title instead (Exalted Champion of all 5 of your faction's
    -- cities) - mutually exclusive by faction, so left text-only.
    -- =================================================================

    ["Stormwind Steed"] = {
        -- source: https://wago.tools/db2/Mount/csv (ID 294, SourceSpellID 63232)
        -- source: https://wago.tools/db2/Achievement/csv (ID 2781, "Champion of Stormwind")
        -- source: https://wago.tools/db2/CurrencyTypes/csv (ID 241, Champion's Seal)
        { text = "Earn Champion of Stormwind via the Argent Tournament daily quest chain (starts from Justicar Mariel Trueheart at the Argent Tournament, Icecrown)", achievementID = 2781 },
        { text = "Buy from Corporal Arthur Flew in Icecrown for 100 Champion's Seals", currencyID = 241, amount = 100 },
    },
    ["Swift Gray Steed"] = {
        -- source: https://wago.tools/db2/Mount/csv (ID 321, SourceSpellID 65640)
        -- source: https://wago.tools/db2/Achievement/csv (ID 2781, "Champion of Stormwind")
        { text = "Earn Champion of Stormwind via the Argent Tournament daily quest chain (starts from Justicar Mariel Trueheart at the Argent Tournament, Icecrown)", achievementID = 2781 },
        { text = "Buy from Corporal Arthur Flew in Icecrown for 500g" },
    },
    ["Ironforge Ram"] = {
        -- source: https://wago.tools/db2/Mount/csv (ID 296, SourceSpellID 63636)
        -- source: https://wago.tools/db2/Achievement/csv (ID 2780, "Champion of Ironforge")
        { text = "Earn Champion of Ironforge via the Argent Tournament daily quest chain (starts from Justicar Mariel Trueheart at the Argent Tournament, Icecrown)", achievementID = 2780 },
        { text = "Buy from Derrick Brindlebeard in Icecrown for 100 Champion's Seals", currencyID = 241, amount = 100 },
    },
    ["Swift Violet Ram"] = {
        -- source: https://wago.tools/db2/Mount/csv (ID 324, SourceSpellID 65643)
        -- source: https://wago.tools/db2/Achievement/csv (ID 2780, "Champion of Ironforge")
        { text = "Earn Champion of Ironforge via the Argent Tournament daily quest chain (starts from Justicar Mariel Trueheart at the Argent Tournament, Icecrown)", achievementID = 2780 },
        { text = "Buy from Derrick Brindlebeard in Icecrown for 500g" },
    },
    ["Darnassian Nightsaber"] = {
        -- source: https://wago.tools/db2/Mount/csv (ID 297, SourceSpellID 63637)
        -- source: https://wago.tools/db2/Achievement/csv (ID 2777, "Champion of Darnassus")
        { text = "Earn Champion of Darnassus via the Argent Tournament daily quest chain (starts from Justicar Mariel Trueheart at the Argent Tournament, Icecrown)", achievementID = 2777 },
        { text = "Buy from Rook Hawkfist in Icecrown for 100 Champion's Seals", currencyID = 241, amount = 100 },
    },
    ["Swift Moonsaber"] = {
        -- source: https://wago.tools/db2/Mount/csv (ID 319, SourceSpellID 65638)
        -- source: https://wago.tools/db2/Achievement/csv (ID 2777, "Champion of Darnassus")
        { text = "Earn Champion of Darnassus via the Argent Tournament daily quest chain (starts from Justicar Mariel Trueheart at the Argent Tournament, Icecrown)", achievementID = 2777 },
        { text = "Buy from Rook Hawkfist in Icecrown for 500g" },
    },
    ["Gnomeregan Mechanostrider"] = {
        -- source: https://wago.tools/db2/Mount/csv (ID 298, SourceSpellID 63638)
        -- source: https://wago.tools/db2/Achievement/csv (ID 2779, "Champion of Gnomeregan")
        { text = "Earn Champion of Gnomeregan via the Argent Tournament daily quest chain (starts from Justicar Mariel Trueheart at the Argent Tournament, Icecrown)", achievementID = 2779 },
        { text = "Buy from Rillie Spindlenut in Icecrown for 100 Champion's Seals", currencyID = 241, amount = 100 },
    },
    ["Turbostrider"] = {
        -- source: https://wago.tools/db2/Mount/csv (ID 323, SourceSpellID 65642)
        -- source: https://wago.tools/db2/Achievement/csv (ID 2779, "Champion of Gnomeregan")
        { text = "Earn Champion of Gnomeregan via the Argent Tournament daily quest chain (starts from Justicar Mariel Trueheart at the Argent Tournament, Icecrown)", achievementID = 2779 },
        { text = "Buy from Rillie Spindlenut in Icecrown for 500g" },
    },
    ["Exodar Elekk"] = {
        -- source: https://wago.tools/db2/Mount/csv (ID 299, SourceSpellID 63639)
        -- source: https://wago.tools/db2/Achievement/csv (ID 2778, "Champion of the Exodar")
        { text = "Earn Champion of the Exodar via the Argent Tournament daily quest chain (starts from Justicar Mariel Trueheart at the Argent Tournament, Icecrown)", achievementID = 2778 },
        { text = "Buy from Irisee in Icecrown for 100 Champion's Seals", currencyID = 241, amount = 100 },
    },
    ["Great Red Elekk"] = {
        -- source: https://wago.tools/db2/Mount/csv (ID 318, SourceSpellID 65637)
        -- source: https://wago.tools/db2/Achievement/csv (ID 2778, "Champion of the Exodar")
        { text = "Earn Champion of the Exodar via the Argent Tournament daily quest chain (starts from Justicar Mariel Trueheart at the Argent Tournament, Icecrown)", achievementID = 2778 },
        { text = "Buy from Irisee in Icecrown for 500g" },
    },
    ["Orgrimmar Wolf"] = {
        -- source: https://wago.tools/db2/Mount/csv (ID 300, SourceSpellID 63640)
        -- source: https://wago.tools/db2/Achievement/csv (ID 2783, "Champion of Orgrimmar")
        { text = "Earn Champion of Orgrimmar via the Argent Tournament daily quest chain (starts from Justicar Mariel Trueheart at the Argent Tournament, Icecrown)", achievementID = 2783 },
        { text = "Buy from Freka Bloodaxe in Icecrown for 100 Champion's Seals", currencyID = 241, amount = 100 },
    },
    ["Swift Burgundy Wolf"] = {
        -- source: https://wago.tools/db2/Mount/csv (ID 327, SourceSpellID 65646)
        -- source: https://wago.tools/db2/Achievement/csv (ID 2783, "Champion of Orgrimmar")
        { text = "Earn Champion of Orgrimmar via the Argent Tournament daily quest chain (starts from Justicar Mariel Trueheart at the Argent Tournament, Icecrown)", achievementID = 2783 },
        { text = "Buy from Freka Bloodaxe in Icecrown for 500g" },
    },
    ["Thunder Bluff Kodo"] = {
        -- source: https://wago.tools/db2/Mount/csv (ID 301, SourceSpellID 63641)
        -- source: https://wago.tools/db2/Achievement/csv (ID 2786, "Champion of Thunder Bluff")
        { text = "Earn Champion of Thunder Bluff via the Argent Tournament daily quest chain (starts from Justicar Mariel Trueheart at the Argent Tournament, Icecrown)", achievementID = 2786 },
        { text = "Buy from Doru Thunderhorn in Icecrown for 100 Champion's Seals", currencyID = 241, amount = 100 },
    },
    ["Great Golden Kodo"] = {
        -- source: https://wago.tools/db2/Mount/csv (ID 322, SourceSpellID 65641)
        -- source: https://wago.tools/db2/Achievement/csv (ID 2786, "Champion of Thunder Bluff")
        { text = "Earn Champion of Thunder Bluff via the Argent Tournament daily quest chain (starts from Justicar Mariel Trueheart at the Argent Tournament, Icecrown)", achievementID = 2786 },
        { text = "Buy from Doru Thunderhorn in Icecrown for 500g" },
    },
    ["Silvermoon Hawkstrider"] = {
        -- source: https://wago.tools/db2/Mount/csv (ID 302, SourceSpellID 63642)
        -- source: https://wago.tools/db2/Achievement/csv (ID 2785, "Champion of Silvermoon City")
        { text = "Earn Champion of Silvermoon City via the Argent Tournament daily quest chain (starts from Justicar Mariel Trueheart at the Argent Tournament, Icecrown)", achievementID = 2785 },
        { text = "Buy from Trellis Morningsun in Icecrown for 100 Champion's Seals", currencyID = 241, amount = 100 },
    },
    ["Swift Red Hawkstrider"] = {
        -- source: https://wago.tools/db2/Mount/csv (ID 320, SourceSpellID 65639)
        -- source: https://wago.tools/db2/Achievement/csv (ID 2785, "Champion of Silvermoon City")
        { text = "Earn Champion of Silvermoon City via the Argent Tournament daily quest chain (starts from Justicar Mariel Trueheart at the Argent Tournament, Icecrown)", achievementID = 2785 },
        { text = "Buy from Trellis Morningsun in Icecrown for 500g" },
    },
    ["Forsaken Warhorse"] = {
        -- source: https://wago.tools/db2/Mount/csv (ID 303, SourceSpellID 63643)
        -- source: https://wago.tools/db2/Achievement/csv (ID 2787, "Champion of the Undercity")
        { text = "Earn Champion of the Undercity via the Argent Tournament daily quest chain (starts from Justicar Mariel Trueheart at the Argent Tournament, Icecrown)", achievementID = 2787 },
        { text = "Buy from Eliza Killian in Icecrown for 100 Champion's Seals", currencyID = 241, amount = 100 },
    },
    ["White Skeletal Warhorse"] = {
        -- source: https://wago.tools/db2/Mount/csv (ID 326, SourceSpellID 65645)
        -- source: https://wago.tools/db2/Achievement/csv (ID 2787, "Champion of the Undercity")
        { text = "Earn Champion of the Undercity via the Argent Tournament daily quest chain (starts from Justicar Mariel Trueheart at the Argent Tournament, Icecrown)", achievementID = 2787 },
        { text = "Buy from Eliza Killian in Icecrown for 500g" },
    },
    ["Darkspear Raptor"] = {
        -- source: https://wago.tools/db2/Mount/csv (ID 295, SourceSpellID 63635)
        -- source: https://wago.tools/db2/Achievement/csv (ID 2784, "Champion of Sen'jin")
        { text = "Earn Champion of Sen'jin via the Argent Tournament daily quest chain (starts from Justicar Mariel Trueheart at the Argent Tournament, Icecrown)", achievementID = 2784 },
        { text = "Buy from Samamba in Icecrown for 100 Champion's Seals", currencyID = 241, amount = 100 },
    },
    ["Swift Purple Raptor"] = {
        -- source: https://wago.tools/db2/Mount/csv (ID 325, SourceSpellID 65644)
        -- source: https://wago.tools/db2/Achievement/csv (ID 2784, "Champion of Sen'jin")
        { text = "Earn Champion of Sen'jin via the Argent Tournament daily quest chain (starts from Justicar Mariel Trueheart at the Argent Tournament, Icecrown)", achievementID = 2784 },
        { text = "Buy from Samamba in Icecrown for 500g" },
    },

    ["Argent Hippogryph"] = {
        -- source: https://wago.tools/db2/Mount/csv (ID 305, SourceSpellID 63844)
        -- Requires Champion status with at least one of the 10 capital-city
        -- factions to unlock the tournament quartermasters at all. Any one
        -- of achievement IDs 2777-2788 satisfies this - left text-only
        -- since it can't be pinned to a single ID without knowing which
        -- city the player championed first.
        { text = "Earn Champion status with any one capital city via the Argent Tournament daily quest chain (starts from Justicar Mariel Trueheart at the Argent Tournament, Icecrown)" },
        { text = "Buy from any faction quartermaster in Icecrown for 150 Champion's Seals", currencyID = 241, amount = 150 },
    },
    ["Argent Charger"] = {
        -- source: https://nether.wowhead.com/tooltip/item/47179 (Paladin only)
        -- Sold by Dame Evniki Kapsalis, the Crusaders' Quartermaster, who only
        -- trades with characters holding the "Crusader" title - earned via
        -- Exalted Argent Champion of the Alliance (achievement 2817) or
        -- Exalted Argent Champion of the Horde (achievement 2816), i.e.
        -- Exalted Champion status with all 5 of your faction's capital
        -- cities. Mutually exclusive by faction, so left text-only.
        { text = "Earn the Crusader title (Exalted Champion of all 5 of your faction's capital cities via the Argent Tournament)" },
        { text = "Buy from Dame Evniki Kapsalis in Icecrown for 100 Champion's Seals (Paladin only)", currencyID = 241, amount = 100 },
    },
    ["Argent Warhorse"] = {
        -- source: https://nether.wowhead.com/tooltip/item/47180
        -- Same Crusaders' Quartermaster gate as Argent Charger above.
        { text = "Earn the Crusader title (Exalted Champion of all 5 of your faction's capital cities via the Argent Tournament)" },
        { text = "Buy from Dame Evniki Kapsalis in Icecrown for 100 Champion's Seals", currencyID = 241, amount = 100 },
    },

    ["Ice Mammoth"] = {
        -- source: https://wago.tools/db2/Mount/csv (ID 258/259, SourceSpellID 59797/59799)
        -- source: https://www.wowhead.com/quest=12843/they-took-our-men (chain start)
        -- source: https://www.wowhead.com/quest=12900/making-a-harness (chain end, unlocks Sons of Hodir dailies)
        -- source: https://wago.tools/db2/Faction/csv (ID 1119, The Sons of Hodir)
        { text = "Do the Sons of Hodir unlock chain, starting with \"They Took Our Men!\" from Gretchen Fizzlespark at K3, The Storm Peaks", questID = 12843, start = "Gretchen Fizzlespark at K3, The Storm Peaks" },
        { text = "Finish the unlock chain with \"Making a Harness\" from Astrid Bjornrittar in Brunnhildar Village to open Sons of Hodir dailies", questID = 12900, start = "Astrid Bjornrittar in Brunnhildar Village, The Storm Peaks" },
        { text = "Reach Revered with The Sons of Hodir", factionID = 1119, reaction = 7 },
        { text = "Buy from Lillehoff in The Storm Peaks for 1000g" },
    },
    ["Grand Ice Mammoth"] = {
        -- source: https://wago.tools/db2/Mount/csv (ID 288/289, SourceSpellID 61469/61470)
        -- source: https://www.wowhead.com/quest=12843/they-took-our-men (chain start)
        -- source: https://www.wowhead.com/quest=12900/making-a-harness (chain end, unlocks Sons of Hodir dailies)
        -- source: https://wago.tools/db2/Faction/csv (ID 1119, The Sons of Hodir)
        { text = "Do the Sons of Hodir unlock chain, starting with \"They Took Our Men!\" from Gretchen Fizzlespark at K3, The Storm Peaks", questID = 12843, start = "Gretchen Fizzlespark at K3, The Storm Peaks" },
        { text = "Finish the unlock chain with \"Making a Harness\" from Astrid Bjornrittar in Brunnhildar Village to open Sons of Hodir dailies", questID = 12900, start = "Astrid Bjornrittar in Brunnhildar Village, The Storm Peaks" },
        { text = "Reach Exalted with The Sons of Hodir", factionID = 1119, reaction = 8 },
        { text = "Buy from Lillehoff in The Storm Peaks for 10000g" },
    },

    ["Mekgineer's Chopper"] = {
        -- source: https://wago.tools/db2/Mount/csv (ID 275, SourceSpellID 60424)
        -- source: https://nether.wowhead.com/tooltip/item/44503 (Schematic: Mekgineer's Chopper)
        -- source: https://wago.tools/db2/Faction/csv (ID 1037, Alliance Vanguard)
        { text = "Reach Exalted with Alliance Vanguard", factionID = 1037, reaction = 8 },
        { text = "Learn Northrend Engineering to skill 375+ and buy Schematic: Mekgineer's Chopper from Logistics Officer Brighton (Valgarde, Howling Fjord) or Logistics Officer Silverstone (Valiance Keep, Borean Tundra) for 400g" },
        { text = "Have 12x Titansteel Bar", itemID = 37663, count = 12 },
        { text = "Have 40x Handful of Cobalt Bolts", itemID = 39681, count = 40 },
        { text = "Have 2x Arctic Fur", itemID = 44128, count = 2 },
        { text = "Have 1x Salvaged Iron Golem Parts", itemID = 44499, count = 1 },
        { text = "Have 8x Goblin-Machined Piston", itemID = 44501, count = 8 },
        { text = "Have 1x Elementium-Plated Exhaust Pipe", itemID = 44500, count = 1 },
        { text = "Craft the Mekgineer's Chopper" },
    },
    ["Mechano-Hog"] = {
        -- source: https://wago.tools/db2/Mount/csv (ID 240, SourceSpellID 55531)
        -- source: https://nether.wowhead.com/tooltip/item/44502 (Schematic: Mechano-Hog)
        -- source: https://wago.tools/db2/Faction/csv (ID 1052, Horde Expedition)
        { text = "Reach Exalted with Horde Expedition", factionID = 1052, reaction = 8 },
        { text = "Learn Northrend Engineering to skill 375+ and buy Schematic: Mechano-Hog from Gara Skullcrush (Warsong Hold, Borean Tundra) or Sebastian Crane (Vengeance Landing, Howling Fjord) for 400g" },
        { text = "Have 12x Titansteel Bar", itemID = 37663, count = 12 },
        { text = "Have 40x Handful of Cobalt Bolts", itemID = 39681, count = 40 },
        { text = "Have 2x Arctic Fur", itemID = 44128, count = 2 },
        { text = "Have 1x Salvaged Iron Golem Parts", itemID = 44499, count = 1 },
        { text = "Have 8x Goblin-Machined Piston", itemID = 44501, count = 8 },
        { text = "Have 1x Elementium-Plated Exhaust Pipe", itemID = 44500, count = 1 },
        { text = "Craft the Mechano-Hog" },
    },

    -- =================================================================
    -- CLASSIC / VANILLA ERA  (researched 2026-08-22, retail-verified)
    -- Sourced only from plain wowhead.com pages (no /classic/ or /wotlk/
    -- ruleset prefix), nether.wowhead.com tooltips, and wago.tools DB2 -
    -- all retail-client data. A first pass on this expansion sourced from
    -- Classic-ruleset pages and was thrown out entirely: Charger and
    -- Dreadsteed's old escort-quest chains were removed from the game in
    -- patch 4.0.1 (both are auto-learned from the class trainer now, no
    -- entry needed), Stormpike/Frostwolf/Black War mounts dropped their
    -- old reputation gates for a flat Mark of Honor cost in patch 7.0.3,
    -- and Winterspring Frostsaber became a short cub-raising quest chain
    -- at Cataclysm rather than an Exalted-reputation grind.
    -- =================================================================

    ["Stormpike Battle Charger"] = {
        -- source: https://www.wowhead.com/item=19030/stormpike-battle-charger ; https://nether.wowhead.com/tooltip/item/137642
        { text = "Collect 15 Marks of Honor from any Battleground or Arena", itemID = 137642, count = 15 },
        { text = "Buy the mount from Thanthaldis Snowgleam (Hillsbrad Foothills) or Gaelden Hammersmith (Alterac Valley)" },
    },

    ["Frostwolf Howler"] = {
        -- source: https://www.wowhead.com/item=19029/horn-of-the-frostwolf-howler ; https://nether.wowhead.com/tooltip/item/137642
        { text = "Collect 15 Marks of Honor from any Battleground or Arena", itemID = 137642, count = 15 },
        { text = "Buy the mount from Jorek Ironside (Hillsbrad Foothills) or Grunnda Wolfheart (Alterac Valley)" },
    },

    ["Winterspring Frostsaber"] = {
        -- source: https://www.wowhead.com/quest=29032/get-them-while-theyre-young ; https://www.wowhead.com/quest=29034/they-grow-up-so-fast
        -- Alliance only.
        { text = "Gather 8 Frostsaber Cubs from dens around Frostsaber Rock", questID = 29032, start = "Rivern Frostwind, Frostsaber Rock, Winterspring" },
        { text = "Care for your Winterspring Cub's daily quests for 20 days until you have 20 Winterspring Cub Whiskers, then turn in the whiskers with 20 Runecloth, 20 Rugged Leather, and 80g", questID = 29034, start = "Rivern Frostwind, Frostsaber Rock, Winterspring" },
    },

    ["Black War Steed"] = {
        -- source: https://www.wowhead.com/item=29468/black-war-steed-bridle ; https://nether.wowhead.com/tooltip/item/137642
        { text = "Collect 15 Marks of Honor from any Battleground or Arena", itemID = 137642, count = 15 },
        { text = "Buy the mount from Lieutenant Karter, War Mount Quartermaster, Stormwind City" },
    },
    ["Black War Ram"] = {
        -- source: https://www.wowhead.com/item=29467/black-war-ram
        { text = "Collect 15 Marks of Honor from any Battleground or Arena", itemID = 137642, count = 15 },
        { text = "Buy the mount from Lieutenant Karter, War Mount Quartermaster, Stormwind City" },
    },
    ["Black War Tiger"] = {
        -- source: https://www.wowhead.com/item=29471/reins-of-the-black-war-tiger
        { text = "Collect 15 Marks of Honor from any Battleground or Arena", itemID = 137642, count = 15 },
        { text = "Buy the mount from Lieutenant Karter, War Mount Quartermaster, Stormwind City" },
    },
    ["Black War Kodo"] = {
        -- source: https://www.wowhead.com/item=29466/black-war-kodo
        { text = "Collect 15 Marks of Honor from any Battleground or Arena", itemID = 137642, count = 15 },
        { text = "Buy the mount from Raider Bork, War Mount Quartermaster, Orgrimmar" },
    },
    ["Black War Raptor"] = {
        -- source: https://www.wowhead.com/item=29472/whistle-of-the-black-war-raptor
        { text = "Collect 15 Marks of Honor from any Battleground or Arena", itemID = 137642, count = 15 },
        { text = "Buy the mount from Raider Bork, War Mount Quartermaster, Orgrimmar" },
    },
    ["Black War Wolf"] = {
        -- source: https://www.wowhead.com/item=29469/horn-of-the-black-war-wolf
        { text = "Collect 15 Marks of Honor from any Battleground or Arena", itemID = 137642, count = 15 },
        { text = "Buy the mount from Raider Bork, War Mount Quartermaster, Orgrimmar" },
    },

    -- =================================================================
    -- THE BURNING CRUSADE  (researched 2026-08-22, retail-verified)
    -- A first pass on this expansion sourced its raid/dungeon-attunement
    -- claims from TBC Classic Anniversary phase data - a different game
    -- mode - and was thrown out entirely. Ashes of Al'ar, Raven Lord and
    -- the Swift White Hawkstrider all lost their old attunement/key gates
    -- years ago in retail and need no entry now (plain drops). Cenarion
    -- War Hippogryph and the 8 regular Kurenai/Mag'har Talbuks were also
    -- checked and left out - the client's own source text already shows
    -- their vendor/zone/faction/cost in full, nothing hidden to add.
    -- =================================================================

    ["Onyx Netherwing Drake"] = {
        -- source: https://www.wowhead.com/quest=10804/kindness ; https://nether.wowhead.com/tooltip/quest/10870 ; https://wago.tools/db2/Faction/csv (Netherwing = 1015)
        { text = "Reach level 70 with an existing flying mount (300 riding is required to progress past the initial neutral reputation stage)" },
        { text = "Start the Netherwing infiltration questline", questID = 10804, start = "Mordenai at the Netherwing Fields, Shadowmoon Valley" },
        { text = "Complete the rest of the chain: Seek Out Neltharaku, Neltharaku's Tale, Infiltrating Dragonmaw Fortress, To Netherwing Ledge!, The Force of Neltharaku, Karynaku, Zuluhed the Whacked" },
        { text = "Finish the chain and unlock the Netherwing dailies hub", questID = 10870 },
        { text = "Reach Exalted with Netherwing", factionID = 1015, reaction = 8 },
    },
    ["Azure Netherwing Drake"] = {
        { text = "Reach level 70 with an existing flying mount (300 riding is required to progress past the initial neutral reputation stage)" },
        { text = "Start the Netherwing infiltration questline", questID = 10804, start = "Mordenai at the Netherwing Fields, Shadowmoon Valley" },
        { text = "Complete the rest of the chain: Seek Out Neltharaku, Neltharaku's Tale, Infiltrating Dragonmaw Fortress, To Netherwing Ledge!, The Force of Neltharaku, Karynaku, Zuluhed the Whacked" },
        { text = "Finish the chain and unlock the Netherwing dailies hub", questID = 10870 },
        { text = "Reach Exalted with Netherwing", factionID = 1015, reaction = 8 },
    },
    ["Cobalt Netherwing Drake"] = {
        { text = "Reach level 70 with an existing flying mount (300 riding is required to progress past the initial neutral reputation stage)" },
        { text = "Start the Netherwing infiltration questline", questID = 10804, start = "Mordenai at the Netherwing Fields, Shadowmoon Valley" },
        { text = "Complete the rest of the chain: Seek Out Neltharaku, Neltharaku's Tale, Infiltrating Dragonmaw Fortress, To Netherwing Ledge!, The Force of Neltharaku, Karynaku, Zuluhed the Whacked" },
        { text = "Finish the chain and unlock the Netherwing dailies hub", questID = 10870 },
        { text = "Reach Exalted with Netherwing", factionID = 1015, reaction = 8 },
    },
    ["Purple Netherwing Drake"] = {
        { text = "Reach level 70 with an existing flying mount (300 riding is required to progress past the initial neutral reputation stage)" },
        { text = "Start the Netherwing infiltration questline", questID = 10804, start = "Mordenai at the Netherwing Fields, Shadowmoon Valley" },
        { text = "Complete the rest of the chain: Seek Out Neltharaku, Neltharaku's Tale, Infiltrating Dragonmaw Fortress, To Netherwing Ledge!, The Force of Neltharaku, Karynaku, Zuluhed the Whacked" },
        { text = "Finish the chain and unlock the Netherwing dailies hub", questID = 10870 },
        { text = "Reach Exalted with Netherwing", factionID = 1015, reaction = 8 },
    },
    ["Veridian Netherwing Drake"] = {
        { text = "Reach level 70 with an existing flying mount (300 riding is required to progress past the initial neutral reputation stage)" },
        { text = "Start the Netherwing infiltration questline", questID = 10804, start = "Mordenai at the Netherwing Fields, Shadowmoon Valley" },
        { text = "Complete the rest of the chain: Seek Out Neltharaku, Neltharaku's Tale, Infiltrating Dragonmaw Fortress, To Netherwing Ledge!, The Force of Neltharaku, Karynaku, Zuluhed the Whacked" },
        { text = "Finish the chain and unlock the Netherwing dailies hub", questID = 10870 },
        { text = "Reach Exalted with Netherwing", factionID = 1015, reaction = 8 },
    },
    ["Violet Netherwing Drake"] = {
        { text = "Reach level 70 with an existing flying mount (300 riding is required to progress past the initial neutral reputation stage)" },
        { text = "Start the Netherwing infiltration questline", questID = 10804, start = "Mordenai at the Netherwing Fields, Shadowmoon Valley" },
        { text = "Complete the rest of the chain: Seek Out Neltharaku, Neltharaku's Tale, Infiltrating Dragonmaw Fortress, To Netherwing Ledge!, The Force of Neltharaku, Karynaku, Zuluhed the Whacked" },
        { text = "Finish the chain and unlock the Netherwing dailies hub", questID = 10870 },
        { text = "Reach Exalted with Netherwing", factionID = 1015, reaction = 8 },
    },

    ["Green Riding Nether Ray"] = {
        -- source: https://www.wowhead.com/quest=11096/threat-from-above ; https://www.wowhead.com/quest=11098/to-skettis ; https://wago.tools/db2/Faction/csv (Sha'tari Skyguard = 1031)
        { text = "Start the Sha'tari Skyguard questline", questID = 11096, start = "Yuula in Shattrath City (near the flight master)" },
        { text = "Continue with To Skettis! - this unlocks the Fires over Skettis daily hub", questID = 11098, start = "Yuula in Shattrath City" },
        { text = "Reach Exalted with Sha'tari Skyguard", factionID = 1031, reaction = 8 },
    },
    ["Red Riding Nether Ray"] = {
        { text = "Start the Sha'tari Skyguard questline", questID = 11096, start = "Yuula in Shattrath City (near the flight master)" },
        { text = "Continue with To Skettis! - this unlocks the Fires over Skettis daily hub", questID = 11098, start = "Yuula in Shattrath City" },
        { text = "Reach Exalted with Sha'tari Skyguard", factionID = 1031, reaction = 8 },
    },
    ["Purple Riding Nether Ray"] = {
        { text = "Start the Sha'tari Skyguard questline", questID = 11096, start = "Yuula in Shattrath City (near the flight master)" },
        { text = "Continue with To Skettis! - this unlocks the Fires over Skettis daily hub", questID = 11098, start = "Yuula in Shattrath City" },
        { text = "Reach Exalted with Sha'tari Skyguard", factionID = 1031, reaction = 8 },
    },
    ["Silver Riding Nether Ray"] = {
        { text = "Start the Sha'tari Skyguard questline", questID = 11096, start = "Yuula in Shattrath City (near the flight master)" },
        { text = "Continue with To Skettis! - this unlocks the Fires over Skettis daily hub", questID = 11098, start = "Yuula in Shattrath City" },
        { text = "Reach Exalted with Sha'tari Skyguard", factionID = 1031, reaction = 8 },
    },
    ["Blue Riding Nether Ray"] = {
        { text = "Start the Sha'tari Skyguard questline", questID = 11096, start = "Yuula in Shattrath City (near the flight master)" },
        { text = "Continue with To Skettis! - this unlocks the Fires over Skettis daily hub", questID = 11098, start = "Yuula in Shattrath City" },
        { text = "Reach Exalted with Sha'tari Skyguard", factionID = 1031, reaction = 8 },
    },

    ["Dark War Talbuk"] = {
        -- source: https://www.wowhead.com/item=26045/halaa-battle-token ; https://www.wowhead.com/item=26044/halaa-research-token
        { text = "Collect 100 Halaa Battle Tokens (earned for kills at Halaa while your faction holds or contests it)", itemID = 26045, count = 100 },
        { text = "Collect 20 Halaa Research Tokens (turned in from Oshu'gun Crystal Powder at Halaa)", itemID = 26044, count = 20 },
        { text = "Buy from Aldraan (Alliance) or Coreiel (Horde) at Halaa, Nagrand - only available while your faction currently controls Halaa" },
    },
    ["Dark Riding Talbuk"] = {
        { text = "Collect 70 Halaa Battle Tokens (earned for kills at Halaa while your faction holds or contests it)", itemID = 26045, count = 70 },
        { text = "Collect 15 Halaa Research Tokens (turned in from Oshu'gun Crystal Powder at Halaa)", itemID = 26044, count = 15 },
        { text = "Buy from Aldraan (Alliance) or Coreiel (Horde) at Halaa, Nagrand - only available while your faction currently controls Halaa" },
    },

    ["Red Hawkstrider"] = {
        -- source: https://www.wowhead.com/item=29224/swift-purple-hawkstrider ; https://wago.tools/db2/Faction/csv (Silvermoon City = 911)
        -- Race-conditional: free/cheap if already a Blood Elf; the source text omits this check entirely for other races.
        { text = "Only required if you are not already a Blood Elf: reach Exalted with Silvermoon City", factionID = 911, reaction = 8 },
    },
    ["Purple Hawkstrider"] = {
        { text = "Only required if you are not already a Blood Elf: reach Exalted with Silvermoon City", factionID = 911, reaction = 8 },
    },
    ["Blue Hawkstrider"] = {
        { text = "Only required if you are not already a Blood Elf: reach Exalted with Silvermoon City", factionID = 911, reaction = 8 },
    },
    ["Black Hawkstrider"] = {
        { text = "Only required if you are not already a Blood Elf: reach Exalted with Silvermoon City", factionID = 911, reaction = 8 },
    },
    ["Swift Green Hawkstrider"] = {
        { text = "Only required if you are not already a Blood Elf: reach Exalted with Silvermoon City", factionID = 911, reaction = 8 },
    },
    ["Swift Purple Hawkstrider"] = {
        { text = "Only required if you are not already a Blood Elf: reach Exalted with Silvermoon City", factionID = 911, reaction = 8 },
    },

    ["Brown Elekk"] = {
        -- source: https://wago.tools/db2/Faction/csv (The Exodar = 930)
        -- Race-conditional: free/cheap if already a Draenei; the source text omits this check for other races.
        { text = "Only required if you are not already a Draenei: reach Exalted with The Exodar", factionID = 930, reaction = 8 },
    },
    ["Gray Elekk"] = {
        { text = "Only required if you are not already a Draenei: reach Exalted with The Exodar", factionID = 930, reaction = 8 },
    },
    ["Purple Elekk"] = {
        { text = "Only required if you are not already a Draenei: reach Exalted with The Exodar", factionID = 930, reaction = 8 },
    },
    ["Great Green Elekk"] = {
        { text = "Only required if you are not already a Draenei: reach Exalted with The Exodar", factionID = 930, reaction = 8 },
    },
    ["Great Blue Elekk"] = {
        { text = "Only required if you are not already a Draenei: reach Exalted with The Exodar", factionID = 930, reaction = 8 },
    },
    ["Great Purple Elekk"] = {
        { text = "Only required if you are not already a Draenei: reach Exalted with The Exodar", factionID = 930, reaction = 8 },
    },
}
