-- Midnight mount prerequisite research
-- Researched 2026-08-18. Sources noted per mount.
--
-- SCOPE: Midnight (12.0 / 12.0.5 / 12.0.7 / 12.1) only.
-- Only mounts with a real gate BEFORE acquisition are listed here.
-- Plain rare-mob drops, plain raid/dungeon boss drops, fishing, Trading Post
-- and shop/promo mounts are deliberately absent -- they need no steps.
--
-- ID POLICY: every questID / achievementID / itemID / currencyID / factionID
-- below was read out of a Wowhead URL. Where an ID could not be verified the
-- field is omitted and only `text` is given.
--
-- Renown-track factions intentionally carry NO factionID, because Renown level
-- does not map onto the 5-8 reaction values. Only the classic Exalted-style
-- reputation (Slayer's Duellum) uses factionID + reaction.

return {

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
        { text = "Complete the quest \"Relinquishing Relics\" during Arator's Journey", questID = 86902 },
    },

    ["Emerald Hawkstrider"] = {
        -- source: https://www.wowhead.com/quest=88769/the-battle-of-the-bridge
        { text = "Complete the quest \"The Battle of the Bridge\"", questID = 88769 },
    },

    ["Peridot Dragonhawk"] = {
        -- source: https://www.wowhead.com/quest=90867/from-darkness-light
        { text = "Complete the quest \"From Darkness, Light\"", questID = 90867 },
    },

    ["Dusk Grimlynx"] = {
        -- source: https://www.wowhead.com/quest=92899/history-lesson
        { text = "Complete the quest \"History Lesson\"", questID = 92899 },
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
        { text = "Complete the quest \"Tales of the Sky\" in Harandar", questID = 90467 },
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
}
