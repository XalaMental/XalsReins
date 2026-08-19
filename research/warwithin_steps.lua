-- The War Within mount prerequisite research
-- Researched 2026-08-18. Sources noted per mount.
--
-- SCOPE: The War Within only (11.0 Khaz Algar, 11.0.5, 11.0.7 Siren Isle,
-- 11.1 Undermine, 11.1.5 Horrific Visions Revisited, 11.1.7, 11.2 Ghosts of
-- K'aresh, 11.2.7 Midnight Prologue).
-- Only mounts with a real gate BEFORE acquisition are listed here.
-- Plain rare-mob drops, plain raid/dungeon boss drops, Trading Post, shop and
-- promo mounts are deliberately absent -- they need no steps.
--
-- ID POLICY: every questID / achievementID / itemID / currencyID below was
-- read out of a Wowhead URL and then re-fetched to confirm the number returns
-- the expected name. Where an ID could not be verified the field is omitted
-- and only `text` is given.
--
-- Renown-track factions intentionally carry NO factionID, because Renown level
-- does not map onto the 5-8 reaction values.
--
-- Verified currencies used below:
--   Resonance Crystals  currencyID 2815  https://www.wowhead.com/currency=2815/resonance-crystals
--   Kej                 currencyID 3056  https://www.wowhead.com/currency=3056/kej
--   Untethered Coin     currencyID 3303  https://www.wowhead.com/currency=3303/untethered-coin

return {

    ----------------------------------------------------------------------
    -- DELVES
    ----------------------------------------------------------------------

    ["Ivory Goliathus"] = {
        -- source: https://www.wowhead.com/achievement=40438/glory-of-the-delver
        -- NOTE: the achievement's real name is "Glory of the War Within Delver".
        { text = "Earn the achievement \"Glory of the War Within Delver\"", achievementID = 40438 },
    },

    ["Delver's Dirigible"] = {
        -- source: https://www.wowhead.com/quest=81510 (Ship It!, rewards the mount)
        { text = "Complete the quest \"Bountiful Delves\" for Brann Bronzebeard", questID = 81514 },
        { text = "Complete the follow-up quest \"Ship It!\"",                    questID = 81510 },
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
        -- source: https://www.wowhead.com/quest=83722 (Consolation Flies, rewards the mount)
        { text = "Defeat the rare Tka'ktath in Azj-Kahet and loot the vial he drops" },
        { text = "Complete the quest \"The Beginning of Something Beautiful\"", questID = 83627 },
        { text = "Complete the quest \"Those Are Chitin Words\" (1,500 Nerubian Chitin)", questID = 83719 },
        { text = "Complete the quest \"Venom? More Like Get 'Em\" (1,000 Nerubian Venom)", questID = 83720 },
        { text = "Complete the quest \"A Small Ocean's Worth of Blood\" (500 Nerubian Blood)", questID = 83721 },
        { text = "Complete the quest \"Witnessing Brilliance\"", questID = 84246 },
        { text = "Complete the quest \"Consolation Flies\" for Shalba", questID = 83722 },
    },

    ["Thrayir, Eyes of the Siren"] = {
        -- source: https://www.wowhead.com/quest=85811
        { text = "Collect the five Runekeys from Siren Isle rares, fishing and activities" },
        { text = "During a storm, activate all five runestones at the Forgotten Vault" },
        { text = "Complete the quest \"Thrayir, Eyes of the Siren\"", questID = 85811 },
    },

    ["Prismatic Snapdragon"] = {
        -- source: https://www.wowhead.com/quest=86485 (A Loyal Friend, rewards the mount)
        { text = "Find the Starving Snapdragon Runt on Siren Isle and complete \"A Lifeline\"", questID = 86482 },
        { text = "Complete the daily \"Hungry, Hungry Snapdragon\" until the runt matures" },
        { text = "Complete the quest \"A Loyal Friend\"", questID = 86485 },
    },

    ["Resplendent K'arroc"] = {
        -- source: https://www.wowhead.com/quest=88976 (The Hope of K'aresh, rewards the mount)
        { text = "Complete the Ghosts of K'aresh campaign chapter \"Shadows En Garde\"" },
        { text = "Fully integrate all seven Oasis species", achievementID = 41811 },
        { text = "Complete the quest \"The Hope of K'aresh\" for Ve'nari",  questID = 88976 },
    },

    ["K'arroc Swiftwing"] = {
        -- source: https://www.wowhead.com/quest=85213 (Off to Tazavesh, Again)
        { text = "Complete the Midnight Prologue questline on K'aresh" },
        { text = "Complete the quest \"Off to Tazavesh, Again\" for Ve'nari", questID = 85213 },
    },

    ["Blue Barry"] = {
        -- source: https://www.wowhead.com/quest=90769/a-blue-for-you
        { text = "Reach Renown 9 with The K'aresh Trust to unlock \"Ba'eth's Request\"" },
        { text = "Complete the quest \"Stealing What is Ours\"", questID = 90663 },
        { text = "Work through the daily-gated chain over the following days" },
        { text = "Complete the quest \"A Blue for You\" for Griftah",  questID = 90769 },
    },

    ["The Bone Freezer"] = {
        -- source: https://www.wowhead.com/quest=91954 (Freezing Over, rewards the mount)
        { text = "Reach Renown 14 with the Manaforge Vandals by running Manaforge Omega" },
        { text = "Complete the quest \"Freezing Over\" at Shadow Point, K'aresh", questID = 91954 },
    },

    ["Xy Trustee's Gearglider"] = {
        -- source: https://www.wowhead.com/quest=92082 (Someone Like Me, rewards the mount)
        { text = "Reach Renown 8 with the Manaforge Vandals" },
        { text = "Obtain the scribe-made buffs Deal: Cartel Ba, Deal: Cartel Zo and Deal: Cartel Om" },
        { text = "Loot all three cartel Dead Drops inside Manaforge Omega, one per buff" },
        { text = "Complete the quest \"Someone Like Me\"", questID = 92082 },
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

}
