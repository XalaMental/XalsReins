-- Legion mount prerequisite research
-- Scope: mounts introduced in the original Legion expansion (7.0 - 7.3.5) that
-- have something you must do BEFORE the mount can be obtained.
-- Deliberately EXCLUDED: plain boss/rare drops with no prerequisite (Living
-- Infernal Core, Fiendish Hellfire Core, Abyss Worm, Antoran Charhound,
-- Shackled Ur'zul, Felsteel Annihilator, Midnight, Crimson Slavermaw, Vile Fiend,
-- Biletooth Gnasher, Acid Belcher, Lambent Mana Ray, Maddened Chaosrunner,
-- Pond Nettle, Great Sea Ray, Bloodfang Widow), the WoW Remix: Legion event,
-- and retired/unobtainable rewards (Violet Spellwing, Prestigious mounts,
-- Gladiator's Storm Dragons).
--
-- Every ID below was verified against wowhead's live tooltip data
-- (nether.wowhead.com/tooltip/<type>/<id>). No ID is guessed.
-- Mount names are the mount-journal names, confirmed from the mount spell name.

return {

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

}
