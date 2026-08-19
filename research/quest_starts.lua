-- quest_starts.lua
-- Quest start / chain research for MountSteps.lua  (researched 2026-08-18)
--
-- Every "Start:" NPC below was read straight off the Wowhead quest page's
-- Quick Facts panel, and every NPC's zone off that NPC's own Wowhead page.
-- Chain quests were taken from the Wowhead "Storyline" / "series" panels, so
-- every questID added here is a real ID copied from a Wowhead URL, never typed
-- from memory.
--
-- Where Wowhead lists no Start NPC at all (the quest is item-started, offered
-- automatically, or an emissary/system quest) the `start` field is deliberately
-- OMITTED rather than filled with a guess. Mounts whose every quest step fell
-- into that bucket are not listed here at all, because nothing could be added:
--   Spirit of Tok'jara            (96305 has no quest giver on Wowhead)
--   Thrayir, Eyes of the Siren    (85811's giver has no recorded location)
--   Royal Voidwing                (91413 has no Start entry - item/auto)
--   Bronze Goblin Waveshredder    (85808 is an emissary quest, no giver)
--   Big Slick in the City         (75598 has no Start entry)
--
-- Each list below is a COMPLETE replacement for that mount's step list.

return {

    -- =================================================================
    -- MIDNIGHT
    -- =================================================================

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

    -- =================================================================
    -- THE WAR WITHIN
    -- =================================================================

    ["Delver's Dirigible"] = {
        -- source: https://www.wowhead.com/quest=81514/bountiful-delves
        -- source: https://www.wowhead.com/quest=81510/ship-it
        { text = "Complete the quest \"Bountiful Delves\" for Brann Bronzebeard", questID = 81514,
          start = "Starts from Brann Bronzebeard at the Delver's Headquarters in Dornogal" },
        { text = "Complete the follow-up quest \"Ship It!\"",                    questID = 81510,
          start = "Starts from Brann Bronzebeard at the Delver's Headquarters in Dornogal" },
    },

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

    -- =================================================================
    -- DRAGONFLIGHT
    -- =================================================================

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

    -- Elianna's six Dream Infusion recolours all gate on the same quest.
    -- Wowhead lists Melsysra as the giver of 78386 and Elianna as the turn-in.

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
}
