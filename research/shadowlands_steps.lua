-- Shadowlands mount prerequisite research
--
-- Mount names below are the exact in-game journal names, taken from the live
-- Mount.db2 client table (https://wago.tools/db2/Mount/csv) by mapping each
-- Wowhead mount item -> ItemXItemEffect -> ItemEffect -> Mount.SourceSpellID.
-- Many differ from the item name ("Blanchy's Reins" -> "Sinrunner Blanchy").
--
-- Faction IDs verified against https://wago.tools/db2/Faction/csv
-- Achievement IDs verified against https://wago.tools/db2/Achievement/csv
-- Currency IDs verified against https://wago.tools/db2/CurrencyTypes/csv
-- Quest IDs + quest givers verified on warcraft.wiki.gg (which prints the
-- quest ID on the page, so the ID and the giver come from the same source).
--
-- Ve'nari, The Archivists' Codex, Court of Night, Marasmius and The Countess
-- are friendship-style reputations (FriendshipRepID is set on them), so they
-- are written as plain text with no factionID/reaction - the 5..8 reaction
-- scale does not describe them.  Covenant Renown is likewise plain text.

return {

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
}
