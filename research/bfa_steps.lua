-- Battle for Azeroth mount prerequisite research
--
-- Scope: mounts added in Battle for Azeroth ONLY, and only those with a real
-- prerequisite (quest chain, reputation, achievement, allied race unlock,
-- gated currency, key item, or an activity that must be unlocked first).
-- Plain boss/rare drops with no prerequisite are deliberately NOT listed.
--
-- Mount names were taken from the live Mount.db2 Name_lang column
-- (https://wago.tools/db2/Mount) so they match the Mount Journal exactly.
-- Faction / currency / achievement IDs likewise come from Faction.db2,
-- CurrencyTypes.db2 and Achievement.db2 on wago.tools.
-- Quest IDs and quest givers were read from Wowhead's rendered Quick Facts
-- panel and cross-checked against the Wowhead tooltip API
-- (https://nether.wowhead.com/tooltip/quest/<id>).
--
-- Verified faction IDs used below:
--   2103 Zandalari Empire   2156 Talanji's Expedition  2158 Voldunai
--   2160 Proudmoore Admiralty  2161 Order of Embers    2162 Storm's Wake
--   2373 The Unshackled     2391 Rustbolt Resistance   2395 Honeyback Hive
--   2400 Waveblade Ankoan   2417 Uldum Accord
-- Verified currency IDs used below:
--   1166 Timewarped Badge   1710 Seafarer's Dubloon    1716 Honorbound Service Medal
--   1717 7th Legion Service Medal  1719 Corrupted Mementos  1721 Prismatic Manapearl

return {

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
}
