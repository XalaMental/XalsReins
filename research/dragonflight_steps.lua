-- Dragonflight mount prerequisite research
-- Researched 2026-08-18. Sources noted per mount.
--
-- SCOPE: Dragonflight (10.0 - 10.2.7) only.
-- Only mounts with a real gate BEFORE acquisition are listed here.
-- Plain rare-mob drops, plain raid/dungeon boss drops, gold-only vendor
-- mounts, Trading Post, Battle.net shop, promo and Recruit-A-Friend mounts
-- are deliberately absent -- they need no steps.
--
-- Dragonriding / skyriding DRAKEWATCHER MANUSCRIPTS are customisations, not
-- mount-journal mounts, so none of them appear here. The eight customisable
-- drakes themselves ARE real mounts and are included where quest-gated.
--
-- ID POLICY: every questID / achievementID / itemID / currencyID below was
-- read out of a Wowhead URL and the fetched page's name was checked against
-- the expected name. Where an ID could not be verified the field is omitted
-- and only `text` is given.
--
-- Dragonflight factions are Renown-based. Renown does NOT map onto the 5-8
-- reaction values, so NO factionID/reaction is emitted anywhere in this file.
-- Renown requirements are plain text.

return {

    ----------------------------------------------------------------------
    -- CAMPAIGN / STORY DRAKES
    ----------------------------------------------------------------------

    ["Renewed Proto-Drake"] = {
        -- source: https://www.wowhead.com/quest=68795
        { text = "Reach the Dragon Isles and progress the Waking Shores campaign to the Ruby Lifeshrine" },
        { text = "Complete the quest \"Skyriding\" (named \"Dragonriding\" in Dragonflight)", questID = 68795 },
    },

    ["Windborne Velocidrake"] = {
        -- source: https://www.wowhead.com/quest=70220
        { text = "Finish the Waking Shores campaign and travel to the Ohn'ahran Plains" },
        { text = "Progress the Ohn'ahran Plains story to chapter 4" },
        { text = "Complete the quest \"Shady Sanctuary\"", questID = 70220 },
    },

    ["Highland Drake"] = {
        -- source: https://www.wowhead.com/quest=66027
        { text = "Finish the Ohn'ahran Plains campaign and travel to The Azure Span" },
        { text = "Progress the Azure Span story to the Vakthros chapter" },
        { text = "Complete the quest \"Calling the Blue Dragons\"", questID = 66027 },
    },

    ["Cliffside Wylderdrake"] = {
        -- source: https://www.wowhead.com/quest=66040
        { text = "Finish the Azure Span campaign and travel to Thaldraszus" },
        { text = "Progress the Thaldraszus story to its finale" },
        { text = "Complete the quest \"Back to the Future\"", questID = 66040 },
    },

    ["Winding Slitherdrake"] = {
        -- source: https://www.wowhead.com/quest=74563
        { text = "Complete the Dragonflight level 70 campaign to unlock Zaralek Cavern" },
        { text = "Progress the Embers of Neltharion campaign to chapter 4" },
        { text = "Complete the quest \"Worst of the Worst\"", questID = 74563 },
    },

    ["Flourishing Whimsydrake"] = {
        -- source: https://www.wowhead.com/quest=76318
        { text = "Complete the Fury Incarnate campaign to unlock the Guardians of the Dream campaign" },
        { text = "Complete the quest \"Call of the Dream\" at the Ancient Bough in the Ohn'ahran Plains", questID = 76317 },
        { text = "Complete the quest \"Emerald Welcome\"", questID = 76318 },
    },

    ["Grotto Netherwing Drake"] = {
        -- source: https://www.wowhead.com/quest=76465
        -- Note: originally a July 2023 Traveler's Log reward. The questline
        -- below is the permanent 10.2 route, so long-time collectors may
        -- already own it without any of these steps.
        { text = "Progress the Guardians of the Dream campaign far enough to reach Wrathion in the Emerald Dream" },
        { text = "Start the Misfit Dragons chain with \"A Dragon in Hand is Worth Two in the Roost\"", questID = 76460 },
        { text = "Work through the Misfit Dragons chain (Draconic Diplomacy, Cavern Cleaning, A Whelping Hand, Delectable Delicacies, Home in Time for Tea, The Thorignir)" },
        { text = "Complete the quest \"Dragon Keeping\"", questID = 76465 },
    },

    ["Tarecgosa's Visage"] = {
        -- source: https://www.wowhead.com/quest=73199
        { text = "Own the Cataclysm legendary staff Dragonwrath, Tarecgosa's Rest" },
        { text = "Complete the Veiled Ossuary blue dragonflight questline in Thaldraszus" },
        { text = "Complete the quest \"Rhapsody in Blue\" for the Lingering Echo of Tarecgosa", questID = 73199 },
    },

    ["Gilnean Prowler"] = {
        -- source: https://www.wowhead.com/quest=78189
        { text = "Play through The Gilneas Reclamation storyline" },
        { text = "Complete the quest \"Beginning a New Dawn\"", questID = 78189 },
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
        { text = "Take \"To Tame A Thunderspine\" from Initiate Radiya at Ohn'iri Springs, Ohn'ahran Plains", questID = 71196 },
        { text = "Complete the remaining four daily stages, one per day, at 150 Dragon Isles Supplies each" },
        { text = "Complete the quest \"Beast of the Plains\" for Lizi's Reins", questID = 71209 },
    },

    ["Divine Kiss of Ohn'ahra"] = {
        -- source: https://www.wowhead.com/quest=72512
        { text = "Reach Renown 25 with the Maruuk Centaur" },
        { text = "Complete the quest \"The Highest Honor\"", questID = 71091 },
        { text = "Obtain the mount Lizi, Thunderspine Tramper" },
        { text = "Collect 3 Stolen Breath of Ohn'ahra from Balakar Khan in The Nokhud Offensive" },
        { text = "Obtain an Exultant Incense (alchemy craft, also sold on the Auction House)" },
        { text = "Buy an Essence of Awakening from Quartermaster Huseng" },
        { text = "Complete the quest \"A Whispering Breeze\" from Godoloto at Ohn'ahra's Roost", questID = 72512 },
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
        { text = "Find the Smoldering Sprout in the Emerald Dream and interact with it to douse it and brush off the soot" },
        { text = "Complete the quest \"Some Water...\"", questID = 77677 },
        { text = "Work through the time-gated \"A Mix of Hope, Care, and Patience\" chain with Professor Ash, roughly three weeks of real time" },
        { text = "Complete the quest \"A Little Hope is Never Without Worth\"", questID = 77762 },
    },

    ----------------------------------------------------------------------
    -- ELIANNA - DREAM INFUSION RECOLOURS
    -- Each needs a same-model mount already in your collection.
    ----------------------------------------------------------------------

    ["Delugen"] = {
        -- source: https://warcraft.wiki.gg/wiki/Elianna
        { text = "Reach Renown 5 with the Dream Wardens" },
        { text = "Complete the quest \"Emerald Reawakening\" from Elianna", questID = 78386 },
        { text = "Already own another ottuk mount" },
        { text = "Fill the Dream Energy bar to 100% for 1 Dream Infusion", currencyID = 2777, amount = 1 },
        { text = "Buy Delugen from Elianna at the Central Encampment, Emerald Dream" },
    },

    ["Stargrazer"] = {
        -- source: https://www.warcraftmounts.com/mounts/stargrazer.php
        { text = "Reach Renown 5 with the Dream Wardens" },
        { text = "Complete the quest \"Emerald Reawakening\" from Elianna", questID = 78386 },
        { text = "Already own another dreamstag mount" },
        { text = "Fill the Dream Energy bar to 100% for 1 Dream Infusion", currencyID = 2777, amount = 1 },
        { text = "Buy Stargrazer from Elianna at the Central Encampment, Emerald Dream" },
    },

    ["Talont"] = {
        -- source: https://warcraft.wiki.gg/wiki/Elianna
        { text = "Reach Renown 5 with the Dream Wardens" },
        { text = "Complete the quest \"Emerald Reawakening\" from Elianna", questID = 78386 },
        { text = "Already own another dreamtalon mount" },
        { text = "Fill the Dream Energy bar to 100% for 1 Dream Infusion", currencyID = 2777, amount = 1 },
        { text = "Buy Talont from Elianna at the Central Encampment, Emerald Dream" },
    },

    ["Mammyth"] = {
        -- source: https://warcraft.wiki.gg/wiki/Elianna
        { text = "Reach Renown 5 with the Dream Wardens" },
        { text = "Complete the quest \"Emerald Reawakening\" from Elianna", questID = 78386 },
        { text = "Already own another magmammoth mount" },
        { text = "Fill the Dream Energy bar to 100% for 1 Dream Infusion", currencyID = 2777, amount = 1 },
        { text = "Buy Mammyth from Elianna at the Central Encampment, Emerald Dream" },
    },

    ["Imagiwing"] = {
        -- source: https://warcraft.wiki.gg/wiki/Elianna
        { text = "Reach Renown 5 with the Dream Wardens" },
        { text = "Complete the quest \"Emerald Reawakening\" from Elianna", questID = 78386 },
        { text = "Already own another shalewing mount" },
        { text = "Fill the Dream Energy bar to 100% for 1 Dream Infusion", currencyID = 2777, amount = 1 },
        { text = "Buy Imagiwing from Elianna at the Central Encampment, Emerald Dream" },
    },

    ["Salatrancer"] = {
        -- source: https://www.warcraftmounts.com/mounts/salatrancer.php
        { text = "Reach Renown 5 with the Dream Wardens" },
        { text = "Complete the quest \"Emerald Reawakening\" from Elianna", questID = 78386 },
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
