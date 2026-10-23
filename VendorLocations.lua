-- VendorLocations.lua
-- Shared cross-addon reference: which map and coordinates each vendor
-- NPC stands at, keyed by npcID. Any Xal's addon can copy this file in
-- (see D:\WoW_Addons\Dev\Assets\ - the shared fonts/icons library, same
-- convention here) instead of re-researching vendor coordinates from
-- scratch.
--
-- SOURCE: extracted from VendorMap (Andrew Defee), MIT licensed - see
-- VendorMap/LICENSE in the live AddOns folder. This file carries over the
-- required copyright/license notice per those terms. Only the factual
-- coordinate data is reused here (npcID/mapID/x/y/type), not VendorMap's
-- own code or UI.
--
-- MIT License - Copyright (c) 2026 Andrew Defee. Permission is hereby
-- granted, free of charge, to any person obtaining a copy of this data,
-- to deal in it without restriction, provided this notice is kept.
--
-- FIELDS per entry: name, mapID (a real C_Map mapID - use with
-- C_Map.SetUserWaypoint / C_SuperTrack for a native "track this" pin,
-- no TomTom dependency needed), x/y (0-1 normalized map position),
-- faction ("Alliance"/"Horde"/"Neutral"), types (a list of tags this
-- vendor sells - "transmog" is the one Xal's Armoire cares about, but
-- "general"/"food"/"faction" etc. are kept too since this file is meant
-- for any addon to use), repFactionID/minStanding (reputation-gated
-- vendors only), note.
--
-- COVERAGE: 2082 vendor NPCs across every expansion.
--   Legion (Broken Isles)                         152 NPCs
--   Warlords of Draenor                           70 NPCs
--   Dragonflight (Dragon Isles)                   169 NPCs
--   Eastern Kingdoms (incl. Cataclysm revamp)     414 NPCs
--   Kalimdor (incl. Cataclysm revamp)             397 NPCs
--   The War Within / Midnight (Khaz Algar)        144 NPCs
--   Battle for Azeroth (Kul Tiras)                51 NPCs
--   Battle for Azeroth (Zandalar)                 55 NPCs
--   Cataclysm (Maelstrom)                         9 NPCs
--   Wrath of the Lich King (Northrend)            189 NPCs
--   The Burning Crusade (Outland)                 186 NPCs
--   Mists of Pandaria                             89 NPCs
--   Shadowlands                                   96 NPCs
--   Instances / misc                              31 NPCs
--   Midnight vendors added by hand (2026-09-29/30) 30 NPCs
--     (VendorMap's own data hadn't caught up to Midnight's newest zones -
--     Undermine, Dornogal, Val/Naigtal, The Coiled Isle, Voidstorm,
--     Harandar, Masters' Perch/Slayer's Rise, Eversong Woods, Silvermoon
--     City, Zul'Aman, Twilight Highlands, Alterac Valley, Valdrakken -
--     pulled directly from each NPC's own Wowhead page instead of waiting)

-- Plain global (not scoped to any one addon's own addonTable) so any
-- addon that copies this file in and loads it via its own .toc gets
-- XalsVendorLocations[npcID] without extra wiring - same idea as a
-- LibStub-style shared library, just data instead of code.
XalsVendorLocations = XalsVendorLocations or {}
local VendorLocations = XalsVendorLocations

------------------------------------------------------------------
-- Legion (Broken Isles)
------------------------------------------------------------------

VendorLocations[34382] = {
    name = "Chapman",
    mapID = 627,
    x = 0.339, y = 0.393,
    faction = "Neutral",
    types = { "food", "transmog" },
}

VendorLocations[89939] = {
    name = "Berazus",
    mapID = 630,
    x = 0.478, y = 0.233,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[90866] = {
    name = "Tinkmaster Overspark",
    mapID = 634,
    x = 0.336, y = 0.508,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[91079] = {
    name = "Vashti the Wandering Merchant",
    mapID = 630,
    x = 0.652, y = 0.364,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — Can be found pathing up and down the road between Felblaze Ingress and The Ruined Sanctum in Azsuna, Broken Isles.",
}

VendorLocations[92184] = {
    name = "Imindril Spearsong",
    mapID = 627,
    x = 0.4619, y = 0.2694,
    faction = "Horde",
    types = { "repair", "food", "profession" },
}

VendorLocations[92194] = {
    name = "Timofey Oshenko",
    mapID = 627,
    x = 0.3827, y = 0.2612,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[92195] = {
    name = "Professor Pallin",
    mapID = 627,
    x = 0.415, y = 0.373,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[92265] = {
    name = "Urael",
    mapID = 680,
    x = 0.3, y = 0.532,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[92457] = {
    name = "Patricia Egan",
    mapID = 627,
    x = 0.4188, y = 0.321,
    faction = "Horde",
    types = { "reagents", "profession" },
}

VendorLocations[92489] = {
    name = "Mei Francis",
    mapID = 627,
    x = 0.5768, y = 0.4177,
    faction = "Horde",
    types = { "food", "mounts" },
}

VendorLocations[92936] = {
    name = "Aimee",
    mapID = 627,
    x = 0.5067, y = 0.2925,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[93520] = {
    name = "Didi the Wrench",
    mapID = 627,
    x = 0.3864, y = 0.2474,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[93521] = {
    name = "Ranid Glowergold",
    mapID = 627,
    x = 0.346, y = 0.286,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[93524] = {
    name = "Lalla Brightweave",
    mapID = 627,
    x = 0.361, y = 0.333,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[93526] = {
    name = "Tiffany Cartier",
    mapID = 627,
    x = 0.3986, y = 0.3477,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[93528] = {
    name = "Angelique Butler",
    mapID = 627,
    x = 0.366, y = 0.376,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[93530] = {
    name = "Ildine Sorrowspear",
    mapID = 627,
    x = 0.385, y = 0.412,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[93538] = {
    name = "Dariness the Learned",
    mapID = 627,
    x = 0.4107, y = 0.2644,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[93539] = {
    name = "Hobart Grapplehammer",
    mapID = 627,
    x = 0.3845, y = 0.2464,
    faction = "Horde",
    types = { "repair", "reagents", "transmog", "profession" },
}

VendorLocations[93543] = {
    name = "Sminx Glasseye",
    mapID = 627,
    x = 0.396, y = 0.351,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[93544] = {
    name = "Jang Quillpaw",
    mapID = 627,
    x = 0.414, y = 0.367,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[93550] = {
    name = "Quartermaster Ozorg",
    mapID = 647,
    x = 0.442, y = 0.375,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 1859,
    minStanding = 9000,
}

VendorLocations[93971] = {
    name = "Leyweaver Inondra",
    mapID = 680,
    x = 0.402, y = 0.696,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[93973] = {
    name = "Leyweaver Phaxondus",
    mapID = 630,
    x = 0.29, y = 0.46,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[93974] = {
    name = "Leyweaver Erenyi",
    mapID = 641,
    x = 0.704, y = 0.466,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[93975] = {
    name = "Leyweaver Yaphisteia",
    mapID = 650,
    x = 0.294, y = 0.262,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[93979] = {
    name = "Leyweaver Jorjana",
    mapID = 680,
    x = 0.494, y = 0.758,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[94100] = {
    name = "Lucas Sigmund",
    mapID = 650,
    x = 0.399, y = 0.523,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[95844] = {
    name = "Marcia Chase",
    mapID = 627,
    x = 0.5255, y = 0.6555,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[96479] = {
    name = "Breanni",
    mapID = 627,
    x = 0.5823, y = 0.3948,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[96483] = {
    name = "Jepetto Joybuzz",
    mapID = 627,
    x = 0.436, y = 0.456,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[96484] = {
    name = "Clockwork Assistant",
    mapID = 627,
    x = 0.434, y = 0.457,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[96507] = {
    name = "Tassia Whisperglen",
    mapID = 627,
    x = 0.5911, y = 0.3773,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[96778] = {
    name = "Aemara",
    mapID = 627,
    x = 0.6, y = 0.526,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[96779] = {
    name = "Dagna Flintlock",
    mapID = 627,
    x = 0.598, y = 0.522,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[96780] = {
    name = "Aerith Primrose",
    mapID = 627,
    x = 0.5692, y = 0.5367,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[96784] = {
    name = "Fialla Sweetberry",
    mapID = 627,
    x = 0.5257, y = 0.348,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[96785] = {
    name = "Christi Stockton",
    mapID = 627,
    x = 0.538, y = 0.326,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[96812] = {
    name = "Elizabeth Ross",
    mapID = 627,
    x = 0.508, y = 0.556,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[96835] = {
    name = "Grindle Firespark",
    mapID = 627,
    x = 0.4995, y = 0.3256,
    faction = "Horde",
    types = { "barber" },
}

VendorLocations[96975] = {
    name = "Paldesse",
    mapID = 627,
    x = 0.375, y = 0.561,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[96976] = {
    name = "Cloth Merchant",
    mapID = 627,
    x = 0.373, y = 0.563,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[96977] = {
    name = "Valerie Langrom",
    mapID = 627,
    x = 0.5111, y = 0.7247,
    faction = "Horde",
    types = { "repair", "transmog", "profession" },
}

VendorLocations[96978] = {
    name = "Rafael Langrom",
    mapID = 627,
    x = 0.5089, y = 0.7187,
    faction = "Horde",
    types = { "repair", "reagents", "transmog", "profession" },
}

VendorLocations[96979] = {
    name = "Bragund Brightlink",
    mapID = 627,
    x = 0.51, y = 0.735,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[96980] = {
    name = "Matilda Brightlink",
    mapID = 627,
    x = 0.5143, y = 0.734,
    faction = "Horde",
    types = { "repair", "reagents", "profession" },
}

VendorLocations[96987] = {
    name = "Norvin Alderman",
    mapID = 627,
    x = 0.369, y = 0.558,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[96990] = {
    name = "Applebough",
    mapID = 627,
    x = 0.4295, y = 0.5678,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[97001] = {
    name = "Orton Bennet",
    mapID = 627,
    x = 0.5147, y = 0.5541,
    faction = "Horde",
    types = { "transmog", "profession" },
}

VendorLocations[97005] = {
    name = "Debbi Moore",
    mapID = 627,
    x = 0.492, y = 0.5599,
    faction = "Horde",
    types = { "transmog", "profession" },
}

VendorLocations[97007] = {
    name = "Kerta the Bold",
    mapID = 627,
    x = 0.544, y = 0.63,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[97009] = {
    name = "Jawknee",
    mapID = 627,
    x = 0.538, y = 0.616,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[97011] = {
    name = "Valaden Silverblade",
    mapID = 627,
    x = 0.541, y = 0.632,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[97012] = {
    name = "Wanda Chanter",
    mapID = 627,
    x = 0.4855, y = 0.7378,
    faction = "Horde",
    types = { "repair", "transmog", "profession" },
}

VendorLocations[97331] = {
    name = "Icks",
    mapID = 627,
    x = 0.49, y = 0.73,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[97332] = {
    name = "Richard Hatstock",
    mapID = 627,
    x = 0.372, y = 0.556,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[97339] = {
    name = "Cho Ironpalm",
    mapID = 627,
    x = 0.531, y = 0.628,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[97342] = {
    name = "Salan Sunthread",
    mapID = 627,
    x = 0.377, y = 0.556,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[97360] = {
    name = "Matthew Rabis",
    mapID = 628,
    x = 0.47, y = 0.566,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[97361] = {
    name = "Oxana Demonslay",
    mapID = 628,
    x = 0.674, y = 0.181,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[97362] = {
    name = "Dazzik \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"Proudmoore\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"",
    mapID = 628,
    x = 0.662, y = 0.748,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[97363] = {
    name = "K'huta",
    mapID = 628,
    x = 0.66, y = 0.799,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[97364] = {
    name = "Laura Malley",
    mapID = 628,
    x = 0.58, y = 0.581,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[97366] = {
    name = "The Widow",
    mapID = 628,
    x = 0.715, y = 0.24,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[98367] = {
    name = "Tigrid the Charmer",
    mapID = 634,
    x = 0.394, y = 0.426,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[98723] = {
    name = "Tiffy Trapspring",
    mapID = 627,
    x = 0.592, y = 0.399,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[98724] = {
    name = "Giada Goldleash",
    mapID = 627,
    x = 0.5824, y = 0.3805,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[98725] = {
    name = "Lio the Lioness",
    mapID = 627,
    x = 0.592, y = 0.396,
    faction = "Alliance",
    types = { "food" },
    note = "ATT — You can also buy 25 Bandages for 5 Polished Pet Charms from most Battle Pet Vendors.",
}

VendorLocations[98969] = {
    name = "Stalriss Dawnrunner",
    mapID = 680,
    x = 0.266, y = 0.716,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[99154] = {
    name = "Mei Chele",
    mapID = 709,
    x = 0.549, y = 0.624,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[99574] = {
    name = "Slyhoof the Shameless Shaman",
    mapID = 750,
    x = 0.609, y = 0.595,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[99863] = {
    name = "Jenri",
    mapID = 626,
    x = 0.543, y = 0.41,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[100500] = {
    name = "Jabrul",
    mapID = 627,
    x = 0.396, y = 0.345,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[100661] = {
    name = "Pan the Kind Hand",
    mapID = 739,
    x = 0.588, y = 0.318,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[100986] = {
    name = "Madam Goya",
    mapID = 628,
    x = 0.7137, y = 0.1793,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[101097] = {
    name = "Calydus",
    mapID = 717,
    x = 0.377, y = 0.31,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[102196] = {
    name = "Fargo Flintlocke",
    mapID = 630,
    x = 0.43, y = 0.6284,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[103325] = {
    name = "Uthrok",
    mapID = 739,
    x = 0.589, y = 0.501,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[103693] = {
    name = "Outfitter Reynolds",
    mapID = 739,
    x = 0.446, y = 0.488,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 1859,
    minStanding = 9000,
}

VendorLocations[103792] = {
    name = "Griftah",
    mapID = 626,
    x = 0.454, y = 0.276,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[104091] = {
    name = "Kirin Tor Guardian",
    mapID = 627,
    x = 0.3741, y = 0.2815,
    faction = "Horde",
    types = { "barber" },
}

VendorLocations[105333] = {
    name = "Val'zuun",
    mapID = 628,
    x = 0.674, y = 0.631,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[105982] = {
    name = "Smudge Thunderwood",
    mapID = 626,
    x = 0.646, y = 0.442,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[105986] = {
    name = "Kelsey Steelspark",
    mapID = 626,
    x = 0.269, y = 0.369,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 1859,
    minStanding = 9000,
}

VendorLocations[106054] = {
    name = "Kareth",
    mapID = 628,
    x = 0.752, y = 0.57,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[106056] = {
    name = "Charles Seaton",
    mapID = 628,
    x = 0.742, y = 0.548,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[106655] = {
    name = "Arcanomancer Vridiel",
    mapID = 627,
    x = 0.454, y = 0.2862,
    faction = "Horde",
    types = { "repair", "food", "transmog" },
}

VendorLocations[106887] = {
    name = "Cravitz Lorent",
    mapID = 628,
    x = 0.516, y = 0.406,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — This vendor is not always present. It can appear in either version of Dalaran.",
}

VendorLocations[106901] = {
    name = "Sylvia Hartshorn",
    mapID = 641,
    x = 0.546, y = 0.732,
    faction = "Neutral",
    types = { "food", "transmog", "faction" },
    repFactionID = 1883,
    minStanding = 3000,
}

VendorLocations[106902] = {
    name = "Ransa Greyfeather",
    mapID = 750,
    x = 0.383, y = 0.458,
    faction = "Neutral",
    types = { "food", "transmog", "faction" },
    repFactionID = 1828,
    minStanding = 3000,
}

VendorLocations[106904] = {
    name = "Valdemar Stormseeker",
    mapID = 634,
    x = 0.602, y = 0.512,
    faction = "Neutral",
    types = { "food", "transmog", "faction" },
    repFactionID = 1948,
    minStanding = 9000,
}

VendorLocations[106930] = {
    name = "Lieutenant Surtees",
    mapID = 627,
    x = 0.294, y = 0.756,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[107109] = {
    name = "Xur'ios",
    mapID = 627,
    x = 0.488, y = 0.135,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[107139] = {
    name = "Enchantress Ilanya",
    mapID = 630,
    x = 0.468, y = 0.408,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[107326] = {
    name = "Draemus",
    mapID = 627,
    x = 0.587, y = 0.393,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[107376] = {
    name = "Veridis Fallon",
    mapID = 630,
    x = 0.469, y = 0.414,
    faction = "Neutral",
    types = { "food", "transmog", "faction" },
    repFactionID = 1900,
    minStanding = 9000,
}

VendorLocations[107379] = {
    name = "Marin Bladewing",
    mapID = 630,
    x = 0.482, y = 0.739,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 1894,
    minStanding = 9000,
}

VendorLocations[107467] = {
    name = "Jacin",
    mapID = 680,
    x = 0.49, y = 0.816,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[107760] = {
    name = "Strap Bucklebolt",
    mapID = 628,
    x = 0.658, y = 0.808,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[107963] = {
    name = "Kharmeera",
    mapID = 630,
    x = 0.472, y = 0.266,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[108017] = {
    name = "Torv Dubstomp",
    mapID = 652,
    x = 0.549, y = 0.781,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[108468] = {
    name = "The Mad Merchant",
    mapID = 627,
    x = 0.432, y = 0.466,
    faction = "Horde",
    types = { "general" },
    note = "ATT — This vendor is not always present.",
}

VendorLocations[108537] = {
    name = "Crafty Palu",
    mapID = 650,
    x = 0.416, y = 0.106,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[109306] = {
    name = "Myria Glenbrook",
    mapID = 641,
    x = 0.602, y = 0.849,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[109562] = {
    name = "Sundries Merchant",
    mapID = 680,
    x = 0.5, y = 0.773,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[112059] = {
    name = "Sasunne Dameuse",
    mapID = 680,
    x = 0.512, y = 0.5,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[112064] = {
    name = "Dolse Shimmersong",
    mapID = 680,
    x = 0.512, y = 0.498,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[112226] = {
    name = "Markus Hjolbruk",
    mapID = 680,
    x = 0.716, y = 0.488,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[112323] = {
    name = "Amurra Thistledew",
    mapID = 747,
    x = 0.4, y = 0.248,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 1859,
    minStanding = 42000,
}

VendorLocations[112338] = {
    name = "Caydori Brightstar",
    mapID = 709,
    x = 0.503, y = 0.59,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 1859,
    minStanding = 9000,
}

VendorLocations[112392] = {
    name = "Quartermaster Durnolf",
    mapID = 695,
    x = 0.561, y = 0.27,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 1859,
    minStanding = 9000,
}

VendorLocations[112401] = {
    name = "Meridelle Lightspark",
    mapID = 702,
    x = 0.39, y = 0.246,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 1859,
    minStanding = 9000,
}

VendorLocations[112407] = {
    name = "Falara Nightsong",
    mapID = 720,
    x = 0.578, y = 0.435,
    faction = "Alliance",
    types = { "transmog", "faction" },
    repFactionID = 1859,
    minStanding = 9000,
}

VendorLocations[112434] = {
    name = "Gigi Gigavoid",
    mapID = 717,
    x = 0.587, y = 0.327,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 1859,
    minStanding = 42000,
}

VendorLocations[112440] = {
    name = "Jackson Watkins",
    mapID = 735,
    x = 0.456, y = 0.576,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 1859,
    minStanding = 9000,
}

VendorLocations[112634] = {
    name = "Hilseth Travelstride",
    mapID = 641,
    x = 0.564, y = 0.806,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[112716] = {
    name = "Rasil Fireborne",
    mapID = 627,
    x = 0.431, y = 0.491,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[113843] = {
    name = "Kieule",
    mapID = 680,
    x = 0.504, y = 0.53,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[115264] = {
    name = "Illnea Bloodthorn",
    mapID = 627,
    x = 0.447, y = 0.322,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[115287] = {
    name = "Serr'ah",
    mapID = 627,
    x = 0.5868, y = 0.3773,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[115710] = {
    name = "Chief Telemancer Oculeth",
    mapID = 680,
    x = 0.37, y = 0.466,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[115736] = {
    name = "First Arcanist Thalyssra",
    mapID = 680,
    x = 0.364, y = 0.468,
    faction = "Neutral",
    types = { "food", "transmog", "faction" },
    repFactionID = 1859,
    minStanding = 3000,
}

VendorLocations[115887] = {
    name = "Trinket",
    mapID = 650,
    x = 0.324, y = 0.668,
    faction = "Neutral",
    types = { "food", "faction" },
    repFactionID = 2018,
}

VendorLocations[116621] = {
    name = "Demissya Gladestrider",
    mapID = 720,
    x = 0.593, y = 0.424,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[118403] = {
    name = "Syaith",
    mapID = 646,
    x = 0.49, y = 0.558,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — /kiss her during the Where There is a Whip... WQ.",
}

VendorLocations[119486] = {
    name = "Apothecary Lee",
    mapID = 627,
    x = 0.565, y = 0.281,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[120076] = {
    name = "Treasure Master Iks'reeged",
    mapID = 646,
    x = 0.478, y = 0.674,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[120687] = {
    name = "Violet Shadowmend",
    mapID = 627,
    x = 0.596, y = 0.252,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[120898] = {
    name = "Warmage Kath'leen",
    mapID = 646,
    x = 0.444, y = 0.622,
    faction = "Neutral",
    types = { "food", "transmog", "faction" },
    repFactionID = 2045,
    note = "ATT — Can be used to summon rare elite mobs from Unstable Nether Portals while the Nether Disruptor is up. You can only kill 5",
}

VendorLocations[120906] = {
    name = "Marshal Frazer",
    mapID = 627,
    x = 0.334, y = 0.74,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[121282] = {
    name = "Zan Shivsproket",
    mapID = 626,
    x = 0.425, y = 0.822,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[121589] = {
    name = "Thaumaturge Vashreen",
    mapID = 831,
    x = 0.464, y = 0.718,
    faction = "Neutral",
    types = { "food", "transmog" },
}

VendorLocations[121752] = {
    name = "Slimy",
    mapID = 648,
    x = 0.548, y = 0.289,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[125246] = {
    name = "Gaal",
    mapID = 830,
    x = 0.567, y = 0.686,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[125346] = {
    name = "Alchemist Funen",
    mapID = 830,
    x = 0.562, y = 0.668,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[127120] = {
    name = "Vindicator Jaelaana",
    mapID = 831,
    x = 0.448, y = 0.75,
    faction = "Neutral",
    types = { "food", "transmog", "faction" },
    repFactionID = 2165,
    minStanding = 3000,
}

VendorLocations[127151] = {
    name = "Toraan the Revered",
    mapID = 831,
    x = 0.676, y = 0.558,
    faction = "Neutral",
    types = { "food", "transmog", "profession", "faction" },
    repFactionID = 2170,
}

VendorLocations[128134] = {
    name = "Orix the All-Seer",
    mapID = 885,
    x = 0.595, y = 0.449,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[128199] = {
    name = "Kuraam",
    mapID = 882,
    x = 0.506, y = 0.456,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[129674] = {
    name = "Maras",
    mapID = 832,
    x = 0.406, y = 0.656,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[142668] = {
    name = "Merchant Maku",
    mapID = 627,
    x = 0.5873, y = 0.4796,
    faction = "Alliance",
    types = { "repair", "food" },
}

VendorLocations[150948] = {
    name = "Gild Crewneck",
    mapID = 634,
    x = 0.603, y = 0.525,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[180899] = {
    name = "Aridormi",
    mapID = 627,
    x = 0.686, y = 0.492,
    faction = "Neutral",
    types = { "food", "transmog" },
}

VendorLocations[223710] = {
    name = "Remembrancer Amuul",
    mapID = 629,
    x = 0.333, y = 0.846,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[248594] = {
    name = "Sundries Merchant",
    mapID = 680,
    x = 0.509, y = 0.778,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 1859,
    minStanding = 9000,
}

VendorLocations[252043] = {
    name = "Halenthos Brightstride",
    mapID = 627,
    x = 0.67, y = 0.336,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[252498] = {
    name = "Corbin Branbell",
    mapID = 641,
    x = 0.421, y = 0.594,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[252969] = {
    name = "Jocenna",
    mapID = 680,
    x = 0.496, y = 0.628,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[253387] = {
    name = "Selfira Ambergrove",
    mapID = 641,
    x = 0.542, y = 0.724,
    faction = "Neutral",
    types = { "decor" },
    note = "ATT — Reputation-based Decor from this Vendor is currently NOT discounted!",
}

VendorLocations[253434] = {
    name = "Sileas Duskvine",
    mapID = 680,
    x = 0.262, y = 0.322,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[255101] = {
    name = "Mynde",
    mapID = 680,
    x = 0.456, y = 0.692,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[256826] = {
    name = "Mrgrgrl",
    mapID = 680,
    x = 0.151, y = 0.533,
    faction = "Neutral",
    types = { "general" },
}

------------------------------------------------------------------
-- Warlords of Draenor
------------------------------------------------------------------

VendorLocations[77465] = {
    name = "\\\"Wrong Knick\\\"",
    mapID = 525,
    x = 0.282, y = 0.346,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[80765] = {
    name = "Wixxa the Sapper",
    mapID = 535,
    x = 0.716, y = 0.302,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[80882] = {
    name = "Tomas Riogain",
    mapID = 1478,
    x = 0.442, y = 0.74,
    faction = "Alliance",
    types = { "food", "transmog", "faction" },
    repFactionID = 1682,
    minStanding = 42000,
}

VendorLocations[81133] = {
    name = "Artificer Kallaes",
    mapID = 539,
    x = 0.462, y = 0.392,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[82432] = {
    name = "Miril Dumonde",
    mapID = 542,
    x = 0.376, y = 0.508,
    faction = "Alliance",
    types = { "transmog" },
    note = "ATT — Vendor only sells Admiral Taylor's Greatsword to those who have completed the associated quest.",
}

VendorLocations[82754] = {
    name = "Nurse Lizz",
    mapID = 550,
    x = 0.786, y = 0.478,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[84074] = {
    name = "Merchant Derrook",
    mapID = 539,
    x = 0.574, y = 0.302,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[84212] = {
    name = "Kazbala",
    mapID = 535,
    x = 0.452, y = 0.388,
    faction = "Alliance",
    types = { "general" },
    note = "ATT — This vendor is only available until you reach 50 (Can be lower). Items are also available from vendors in Stormwind, Org",
}

VendorLocations[84216] = {
    name = "Talgaiir the Ironrender",
    mapID = 535,
    x = 0.456, y = 0.386,
    faction = "Alliance",
    types = { "transmog" },
    note = "ATT — This vendor is only available at lower levels before he becomes phased out. Items are also available from Big Zokk Torqu",
}

VendorLocations[85115] = {
    name = "Dazzerian",
    mapID = 1478,
    x = 0.484, y = 0.238,
    faction = "Horde",
    types = { "food", "transmog", "faction" },
    repFactionID = 1681,
    minStanding = 42000,
}

VendorLocations[85840] = {
    name = "Torgg Flexington",
    mapID = 624,
    x = 0.426, y = 0.364,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[85849] = {
    name = "Kinkade Jakobs",
    mapID = 622,
    x = 0.297, y = 0.529,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[85932] = {
    name = "Vindicator Nuurem",
    mapID = 622,
    x = 0.466, y = 0.767,
    faction = "Alliance",
    types = { "food", "transmog", "faction" },
    repFactionID = 1731,
    minStanding = 3000,
}

VendorLocations[85946] = {
    name = "Shadow-Sage Brakoss",
    mapID = 622,
    x = 0.445, y = 0.75,
    faction = "Alliance",
    types = { "transmog", "faction" },
    repFactionID = 1515,
    minStanding = 3000,
}

VendorLocations[85950] = {
    name = "Trader Caerel",
    mapID = 622,
    x = 0.41, y = 0.596,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[86036] = {
    name = "Beska Redtusk",
    mapID = 624,
    x = 0.539, y = 0.626,
    faction = "Horde",
    types = { "food", "transmog", "faction" },
    repFactionID = 1445,
    minStanding = 3000,
}

VendorLocations[86037] = {
    name = "Ravenspeaker Skeega",
    mapID = 624,
    x = 0.534, y = 0.598,
    faction = "Horde",
    types = { "transmog", "faction" },
    repFactionID = 1515,
    minStanding = 3000,
}

VendorLocations[86175] = {
    name = "Bregg Coppercast",
    mapID = 622,
    x = 0.562, y = 0.2,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[86176] = {
    name = "Ingrid Blackingot",
    mapID = 622,
    x = 0.55, y = 0.194,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[86376] = {
    name = "Dawn-Seeker Kirrik",
    mapID = 624,
    x = 0.667, y = 0.643,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[86378] = {
    name = "Dawn-Seeker Jiklar",
    mapID = 624,
    x = 0.666, y = 0.636,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[86379] = {
    name = "Dawn-Seeker Rikks",
    mapID = 624,
    x = 0.66, y = 0.645,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[86382] = {
    name = "Dawn-Seeker Alkset",
    mapID = 624,
    x = 0.652, y = 0.642,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[86387] = {
    name = "Dawn-Seeker Rilak",
    mapID = 622,
    x = 0.5, y = 0.612,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[86389] = {
    name = "Dawn-Seeker Verroak",
    mapID = 622,
    x = 0.494, y = 0.613,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[86390] = {
    name = "Dawn-Seeker Vallar",
    mapID = 622,
    x = 0.485, y = 0.623,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[86391] = {
    name = "Dawn-Seeker Krek",
    mapID = 622,
    x = 0.507, y = 0.615,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[86949] = {
    name = "Zooti Fizzlefury",
    mapID = 535,
    x = 0.85, y = 0.31,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[87063] = {
    name = "Joao Calhandro",
    mapID = 622,
    x = 0.62, y = 0.335,
    faction = "Alliance",
    types = { "general" },
    note = "ATT — The item is still in game but you can't learn the recipe from it anymore (recipe removed in 9.0.1)",
}

VendorLocations[87123] = {
    name = "Vesharr",
    mapID = 542,
    x = 0.464, y = 0.452,
    faction = "Alliance",
    types = { "general" },
    note = "ATT — Items will be unavailable until you complete the pet battle daily quest |cFFFFD700Vesharr|r.",
}

VendorLocations[87365] = {
    name = "Grakis",
    mapID = 622,
    x = 0.486, y = 0.335,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[87394] = {
    name = "Kwilax Fuseshiv",
    mapID = 550,
    x = 0.505, y = 0.414,
    faction = "Neutral",
    types = { "food", "transmog", "faction" },
    repFactionID = 1711,
    minStanding = 3000,
}

VendorLocations[87551] = {
    name = "Maru'sa",
    mapID = 624,
    x = 0.753, y = 0.476,
    faction = "Horde",
    types = { "general" },
    note = "ATT — The item is still in game but you can't learn the recipe from it anymore (recipe removed in 9.0.1)",
}

VendorLocations[87774] = {
    name = "Stone Guard Brokefist",
    mapID = 624,
    x = 0.483, y = 0.575,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[87775] = {
    name = "Ruuan the Seer",
    mapID = 542,
    x = 0.466, y = 0.45,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[88045] = {
    name = "Zektar",
    mapID = 542,
    x = 0.52, y = 0.504,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[88155] = {
    name = "Challenger Savina",
    mapID = 622,
    x = 0.52, y = 0.636,
    faction = "Alliance",
    types = { "transmog" },
    note = "ATT — You can only buy items from this vendor if you have Challenge Warlord: Gold Feat of Strength on your character.",
}

VendorLocations[88161] = {
    name = "Challenger Sunforge",
    mapID = 624,
    x = 0.653, y = 0.593,
    faction = "Horde",
    types = { "transmog" },
    note = "ATT — Can only buy items from this vendor if you have Challenge Warlord: Gold Feat of Strength on your character.",
}

VendorLocations[88253] = {
    name = "Srikka",
    mapID = 624,
    x = 0.744, y = 0.316,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[88482] = {
    name = "Gazrix Gearlock",
    mapID = 622,
    x = 0.431, y = 0.777,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[88493] = {
    name = "Mimi Wizzlebub",
    mapID = 624,
    x = 0.542, y = 0.607,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[88569] = {
    name = "Blood Guard Axelash",
    mapID = 624,
    x = 0.485, y = 0.576,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[90974] = {
    name = "Vindicator Krethos",
    mapID = 534,
    x = 0.584, y = 0.604,
    faction = "Alliance",
    types = { "food", "transmog", "faction" },
    repFactionID = 1847,
    minStanding = 3000,
}

VendorLocations[91321] = {
    name = "Dawn-Seeker Skelak",
    mapID = 622,
    x = 0.5, y = 0.616,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[91322] = {
    name = "Dawn-Seeker Kayrek",
    mapID = 624,
    x = 0.656, y = 0.647,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[92501] = {
    name = "Dawn-Seeker Kasrek",
    mapID = 622,
    x = 0.512, y = 0.618,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[92503] = {
    name = "Dawn-Seeker Skariss",
    mapID = 624,
    x = 0.664, y = 0.623,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[92805] = {
    name = "Z'tenga the Walker",
    mapID = 534,
    x = 0.552, y = 0.748,
    faction = "Alliance",
    types = { "food", "transmog", "faction" },
    repFactionID = 1850,
    note = "ATT —  Used to summon Rendarr.  ",
}

VendorLocations[93812] = {
    name = "Salty Jorren",
    mapID = 539,
    x = 0.286, y = 0.108,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[93906] = {
    name = "Slugg Spinbolt",
    mapID = 622,
    x = 0.546, y = 0.176,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[93907] = {
    name = "Amelia Clarke",
    mapID = 622,
    x = 0.548, y = 0.17,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[93908] = {
    name = "Fobbly Kickfix",
    mapID = 624,
    x = 0.491, y = 0.564,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[93909] = {
    name = "Cladd Dawnstrider",
    mapID = 624,
    x = 0.493, y = 0.567,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[93914] = {
    name = "Holly McTilla",
    mapID = 622,
    x = 0.548, y = 0.188,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[93915] = {
    name = "Li \\\"Crunchpaw\\\" Tsang",
    mapID = 622,
    x = 0.548, y = 0.188,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[93916] = {
    name = "Tae'loxe Soulshrivel",
    mapID = 624,
    x = 0.492, y = 0.571,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[93917] = {
    name = "Malukah Lightsong",
    mapID = 624,
    x = 0.489, y = 0.573,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[94801] = {
    name = "Kronk Rustspark",
    mapID = 525,
    x = 0.4, y = 0.722,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[95424] = {
    name = "Dawn-Seeker Krisek",
    mapID = 534,
    x = 0.578, y = 0.594,
    faction = "Alliance",
    types = { "food", "transmog", "faction" },
    repFactionID = 1849,
}

VendorLocations[95650] = {
    name = "Skoller",
    mapID = 534,
    x = 0.552, y = 0.75,
    faction = "Alliance",
    types = { "general" },
    note = "ATT — Talk to him and you will receive the toy.",
}

VendorLocations[96014] = {
    name = "Shadow Hunter Denjai",
    mapID = 534,
    x = 0.616, y = 0.456,
    faction = "Horde",
    types = { "food", "transmog", "faction" },
    repFactionID = 1848,
    minStanding = 3000,
}

VendorLocations[96130] = {
    name = "Ravenspeaker Thelnaas",
    mapID = 534,
    x = 0.578, y = 0.594,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[96304] = {
    name = "Tradurjo Jinglepocket",
    mapID = 582,
    x = 0.43, y = 0.466,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[96362] = {
    name = "Izzy Hollyfizzle",
    mapID = 582,
    x = 0.442, y = 0.51,
    faction = "Neutral",
    types = { "food", "decor" },
    note = "ATT — This becomes un-saved if you remove the decorations even though the decorations remain unlocked.",
}

VendorLocations[128756] = {
    name = "Magister Langley",
    mapID = 622,
    x = 0.548, y = 0.168,
    faction = "Alliance",
    types = { "transmog", "faction" },
    repFactionID = 1682,
    minStanding = 3000,
}

VendorLocations[128759] = {
    name = "Dazzerian",
    mapID = 624,
    x = 0.492, y = 0.55,
    faction = "Horde",
    types = { "transmog", "faction" },
    repFactionID = 1681,
    minStanding = 3000,
}

VendorLocations[150950] = {
    name = "Tia Shortsleeve",
    mapID = 535,
    x = 0.844, y = 0.309,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[151955] = {
    name = "Tempra",
    mapID = 622,
    x = 0.369, y = 0.725,
    faction = "Alliance",
    types = { "food", "transmog", "faction" },
    repFactionID = 1731,
    minStanding = 42000,
}

VendorLocations[151987] = {
    name = "Kronnus",
    mapID = 624,
    x = 0.428, y = 0.545,
    faction = "Horde",
    types = { "food", "transmog" },
}

VendorLocations[256946] = {
    name = "Duskcaller Erthix",
    mapID = 535,
    x = 0.704, y = 0.574,
    faction = "Alliance",
    types = { "general" },
}

------------------------------------------------------------------
-- Dragonflight (Dragon Isles)
------------------------------------------------------------------

VendorLocations[185556] = {
    name = "Erugosa",
    mapID = 2112,
    x = 0.465, y = 0.462,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[185561] = {
    name = "Kaestrasz",
    mapID = 2112,
    x = 0.468, y = 0.789,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[185562] = {
    name = "Tithris",
    mapID = 2112,
    x = 0.4735, y = 0.4657,
    faction = "Alliance",
    types = { "food", "innkeeper" },
}

VendorLocations[186186] = {
    name = "Hanu",
    mapID = 2024,
    x = 0.129, y = 0.487,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[186446] = {
    name = "Elder Nappa",
    mapID = 2024,
    x = 0.124, y = 0.494,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[186449] = {
    name = "Arvik",
    mapID = 2024,
    x = 0.129, y = 0.488,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[186454] = {
    name = "Kora Fullsails",
    mapID = 2022,
    x = 0.43, y = 0.672,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[186462] = {
    name = "Tatto",
    mapID = 2024,
    x = 0.138, y = 0.497,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[186502] = {
    name = "Sugarbough",
    mapID = 2023,
    x = 0.286, y = 0.604,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[186547] = {
    name = "Lil Ki",
    mapID = 2024,
    x = 0.135, y = 0.487,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[186554] = {
    name = "Nunvuq",
    mapID = 2024,
    x = 0.139, y = 0.492,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[186564] = {
    name = "Jiq",
    mapID = 2024,
    x = 0.135, y = 0.487,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — Runs around in the village.",
}

VendorLocations[186650] = {
    name = "Farrier Roscha",
    mapID = 2023,
    x = 0.844, y = 0.25,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[186752] = {
    name = "Firstmate Kaleson",
    mapID = 2022,
    x = 0.43, y = 0.674,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[187300] = {
    name = "Gryrmpech",
    mapID = 2025,
    x = 0.378, y = 0.754,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[187399] = {
    name = "Maribeth",
    mapID = 2022,
    x = 0.477, y = 0.832,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[187408] = {
    name = "Granpap Whiskers",
    mapID = 2022,
    x = 0.477, y = 0.832,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[187412] = {
    name = "Happy Hal",
    mapID = 2022,
    x = 0.812, y = 0.318,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[187444] = {
    name = "Kajithalan",
    mapID = 2022,
    x = 0.471, y = 0.829,
    faction = "Neutral",
    types = { "food" },
    note = "ATT — Travels to different inns each day.",
}

VendorLocations[187647] = {
    name = "Libergo",
    mapID = 2112,
    x = 0.338, y = 0.277,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[187680] = {
    name = "Scaps",
    mapID = 2024,
    x = 0.129, y = 0.486,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[187700] = {
    name = "Pathfinder Jeb",
    mapID = 2022,
    x = 0.473, y = 0.834,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[187783] = {
    name = "Pakak",
    mapID = 2112,
    x = 0.438, y = 0.75,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[187869] = {
    name = "Tikukk",
    mapID = 2024,
    x = 0.127, y = 0.503,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[188265] = {
    name = "Rae'ana",
    mapID = 2022,
    x = 0.479, y = 0.821,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[188349] = {
    name = "Outfitter Tipech",
    mapID = 2022,
    x = 0.256, y = 0.55,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[188623] = {
    name = "Samia Inkling",
    mapID = 2022,
    x = 0.247, y = 0.568,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2518,
    minStanding = 2,
    note = "ATT — To see this select All in filter",
}

VendorLocations[188625] = {
    name = "Lorena Belle",
    mapID = 2022,
    x = 0.252, y = 0.558,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2517,
    minStanding = 2,
    note = "ATT — To see this select All in filter",
}

VendorLocations[188747] = {
    name = "Kitror",
    mapID = 2112,
    x = 0.4701, y = 0.4586,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[188895] = {
    name = "Assistant Innkeeper Durang",
    mapID = 2025,
    x = 0.5244, y = 0.6988,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[189065] = {
    name = "Boss Magor",
    mapID = 2022,
    x = 0.469, y = 0.829,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[189197] = {
    name = "Groundskeeper Kama",
    mapID = 2112,
    x = 0.745, y = 0.631,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[189207] = {
    name = "Griftah",
    mapID = 2022,
    x = 0.256, y = 0.543,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[189226] = {
    name = "Cataloger Jakes",
    mapID = 2022,
    x = 0.471, y = 0.826,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2507,
    minStanding = 1,
}

VendorLocations[189460] = {
    name = "Vel Tal IX",
    mapID = 2024,
    x = 0.374, y = 0.624,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[189604] = {
    name = "Provisioner Ojito",
    mapID = 2022,
    x = 0.344, y = 0.612,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[189644] = {
    name = "Ms. Xiulan",
    mapID = 2112,
    x = 0.19, y = 0.502,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[190015] = {
    name = "Ohn Meluun",
    mapID = 2023,
    x = 0.568, y = 0.76,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[191000] = {
    name = "Dothenos",
    mapID = 2112,
    x = 0.365, y = 0.628,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[191025] = {
    name = "Lifecaller Tzadrak",
    mapID = 2022,
    x = 0.619, y = 0.738,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[191135] = {
    name = "Yries Lightfingers",
    mapID = 2022,
    x = 0.264, y = 0.554,
    faction = "Neutral",
    types = { "food", "ammo" },
    note = "ATT — Use it while riding the Tame Magmammoth @ 33.3, 72.2",
}

VendorLocations[191397] = {
    name = "Sondo",
    mapID = 2023,
    x = 0.807, y = 0.587,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[191608] = {
    name = "The Great Swog",
    mapID = 2023,
    x = 0.822, y = 0.732,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[192560] = {
    name = "Tuukanit",
    mapID = 2024,
    x = 0.132, y = 0.496,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[192785] = {
    name = "Fusethrian",
    mapID = 2118,
    x = 0.436, y = 0.608,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[192814] = {
    name = "Kritha",
    mapID = 2112,
    x = 0.472, y = 0.416,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[192818] = {
    name = "Elder Yusa",
    mapID = 2023,
    x = 0.416, y = 0.622,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — Target this NPC and /hungry emote. May have to do it twice- the first time she might emote back and not give you anythin",
}

VendorLocations[192997] = {
    name = "Ludo",
    mapID = 2023,
    x = 0.617, y = 0.41,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — Pet!",
}

VendorLocations[193006] = {
    name = "Murik",
    mapID = 2024,
    x = 0.1316, y = 0.492,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2511,
    minStanding = 4,
}

VendorLocations[193015] = {
    name = "Unatos",
    mapID = 2112,
    x = 0.581, y = 0.352,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2510,
    minStanding = 1,
}

VendorLocations[193029] = {
    name = "Lysindra",
    mapID = 2112,
    x = 0.482, y = 0.827,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[193310] = {
    name = "Dealer Vexil",
    mapID = 2022,
    x = 0.348, y = 0.466,
    faction = "Neutral",
    types = { "food" },
    note = "ATT — Can only be bought if you looted the Worldbreaker Membership once from the Twilight Cache before.",
}

VendorLocations[193637] = {
    name = "Jinkutuk",
    mapID = 2024,
    x = 0.139, y = 0.495,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[193659] = {
    name = "Provisioner Thom",
    mapID = 2112,
    x = 0.365, y = 0.506,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[193915] = {
    name = "Emilia Bellocq",
    mapID = 2022,
    x = 0.754, y = 0.34,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[194057] = {
    name = "Rabul",
    mapID = 2112,
    x = 0.354, y = 0.591,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2544,
    minStanding = 1,
}

VendorLocations[194059] = {
    name = "Rokkutuk",
    mapID = 2024,
    x = 0.138, y = 0.5,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[194318] = {
    name = "Kiopo",
    mapID = 2024,
    x = 0.244, y = 0.708,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[194832] = {
    name = "Meiz",
    mapID = 2024,
    x = 0.494, y = 0.226,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2550,
    minStanding = 1,
}

VendorLocations[195395] = {
    name = "Hearthkeeper Bayon",
    mapID = 2023,
    x = 0.596, y = 0.388,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[195529] = {
    name = "Weaponmaster Aloom",
    mapID = 2023,
    x = 0.624, y = 0.422,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[195547] = {
    name = "Farrier Rondare",
    mapID = 2023,
    x = 0.625, y = 0.425,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[195557] = {
    name = "Thora",
    mapID = 2023,
    x = 0.62, y = 0.412,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[195768] = {
    name = "Sorotis",
    mapID = 2112,
    x = 0.261, y = 0.401,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[195769] = {
    name = "Weaponsmith Koref",
    mapID = 2112,
    x = 0.362, y = 0.519,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[195770] = {
    name = "Armorsmith Terisk",
    mapID = 2112,
    x = 0.36, y = 0.497,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[195782] = {
    name = "Giera",
    mapID = 2112,
    x = 0.316, y = 0.693,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[195783] = {
    name = "Clerk Nemora",
    mapID = 2112,
    x = 0.312, y = 0.692,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[196016] = {
    name = "Lontupit",
    mapID = 2024,
    x = 0.14, y = 0.493,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[196018] = {
    name = "Omapurita",
    mapID = 2024,
    x = 0.14, y = 0.493,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[196069] = {
    name = "Patchu",
    mapID = 2024,
    x = 0.139, y = 0.498,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[196161] = {
    name = "Ilana",
    mapID = 2023,
    x = 0.286, y = 0.604,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[196191] = {
    name = "Malicia",
    mapID = 2112,
    x = 0.434, y = 0.425,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[196516] = {
    name = "Mythressa",
    mapID = 2112,
    x = 0.381, y = 0.377,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[196544] = {
    name = "Norukk",
    mapID = 2024,
    x = 0.129, y = 0.486,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[196637] = {
    name = "Tethalash",
    mapID = 2112,
    x = 0.256, y = 0.356,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — To speak to you, you must be a Dracthyr or Exalted with either Dark Talons (Horde) or Obsidian Warders (Alliance)",
}

VendorLocations[196640] = {
    name = "Yzinia",
    mapID = 2112,
    x = 0.226, y = 0.308,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[196707] = {
    name = "Quartermaster Huseng",
    mapID = 2023,
    x = 0.604, y = 0.377,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2503,
    minStanding = 3,
}

VendorLocations[196729] = {
    name = "Gorgonzormu",
    mapID = 2112,
    x = 0.308, y = 0.608,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[196834] = {
    name = "Relothina",
    mapID = 2023,
    x = 0.356, y = 0.422,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[196862] = {
    name = "Steiz",
    mapID = 2024,
    x = 0.494, y = 0.226,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2550,
    minStanding = 3,
}

VendorLocations[196975] = {
    name = "Zinfandormu",
    mapID = 2112,
    x = 0.308, y = 0.608,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[197080] = {
    name = "Cadrestrasz",
    mapID = 2112,
    x = 0.3987, y = 0.8648,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[197510] = {
    name = "Talon Scaralesh",
    mapID = 2022,
    x = 0.47, y = 0.83,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[197553] = {
    name = "Fieldmaster Emberath",
    mapID = 2112,
    x = 0.431, y = 0.424,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[197586] = {
    name = "Xemah",
    mapID = 2025,
    x = 0.3895, y = 0.4631,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[197711] = {
    name = "Lindormi",
    mapID = 2112,
    x = 0.532, y = 0.56,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[197725] = {
    name = "Tuktu",
    mapID = 2023,
    x = 0.398, y = 0.308,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[197872] = {
    name = "Bromithus",
    mapID = 2025,
    x = 0.5006, y = 0.4268,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[198429] = {
    name = "Treysh",
    mapID = 2118,
    x = 0.453, y = 0.613,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[198441] = {
    name = "Gardener Cereus",
    mapID = 2112,
    x = 0.578, y = 0.24,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[198470] = {
    name = "Usodormu",
    mapID = 2025,
    x = 0.604, y = 0.798,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[198587] = {
    name = "Andoris",
    mapID = 2112,
    x = 0.308, y = 0.608,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[198827] = {
    name = "Sous Chef Durang",
    mapID = 2085,
    x = 0.612, y = 0.528,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[198831] = {
    name = "Bivogosa",
    mapID = 2085,
    x = 0.615, y = 0.533,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[199020] = {
    name = "Atticus Belle",
    mapID = 2022,
    x = 0.266, y = 0.624,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[199036] = {
    name = "Xaldrass",
    mapID = 2022,
    x = 0.276, y = 0.562,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[199425] = {
    name = "Brendormi",
    mapID = 2085,
    x = 0.612, y = 0.468,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[199448] = {
    name = "Tattukiaka",
    mapID = 2024,
    x = 0.14, y = 0.496,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[199541] = {
    name = "Tarnormu",
    mapID = 2085,
    x = 0.608, y = 0.466,
    faction = "Neutral",
    types = { "food" },
    note = "ATT — This Vendor is only visible during the Storm's Fury event.",
}

VendorLocations[199599] = {
    name = "Calderax",
    mapID = 2112,
    x = 0.443, y = 0.366,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[199601] = {
    name = "Seltherex",
    mapID = 2112,
    x = 0.447, y = 0.37,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[199605] = {
    name = "Evantkis",
    mapID = 2112,
    x = 0.586, y = 0.576,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[200559] = {
    name = "Treysh",
    mapID = 2151,
    x = 0.356, y = 0.595,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[200562] = {
    name = "Turik",
    mapID = 2151,
    x = 0.342, y = 0.6,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[200563] = {
    name = "Kraxxus",
    mapID = 2151,
    x = 0.342, y = 0.6,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[200564] = {
    name = "Storykeeper Ashekh",
    mapID = 2151,
    x = 0.341, y = 0.6,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[200566] = {
    name = "Cataloger Daela",
    mapID = 2151,
    x = 0.343, y = 0.6,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[200724] = {
    name = "Researcher Imareth",
    mapID = 2151,
    x = 0.351, y = 0.576,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[200987] = {
    name = "Fusethrian",
    mapID = 2151,
    x = 0.342, y = 0.598,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[201004] = {
    name = "Explorer Bezzert",
    mapID = 2133,
    x = 0.524, y = 0.66,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[201105] = {
    name = "Kazzi",
    mapID = 2024,
    x = 0.658, y = 0.127,
    faction = "Neutral",
    types = { "food", "transmog", "faction" },
    repFactionID = 2526,
    minStanding = 5,
}

VendorLocations[202445] = {
    name = "Trader Hag'arth",
    mapID = 2151,
    x = 0.359, y = 0.575,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[202468] = {
    name = "Harlowe Marl",
    mapID = 2133,
    x = 0.565, y = 0.556,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2564,
    minStanding = 5,
}

VendorLocations[203170] = {
    name = "Kilnmaster Crubus",
    mapID = 2133,
    x = 0.571, y = 0.55,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 2564,
    minStanding = 3,
}

VendorLocations[203171] = {
    name = "Scridorsa the Chiseler",
    mapID = 2133,
    x = 0.558, y = 0.557,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 2564,
    minStanding = 3,
}

VendorLocations[203172] = {
    name = "Dustmonger Topuiz",
    mapID = 2133,
    x = 0.559, y = 0.568,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 2564,
    minStanding = 3,
}

VendorLocations[203293] = {
    name = "Floressa",
    mapID = 2133,
    x = 0.562, y = 0.563,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[203301] = {
    name = "Bottles",
    mapID = 2133,
    x = 0.581, y = 0.551,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[203602] = {
    name = "Spinsoa",
    mapID = 2133,
    x = 0.559, y = 0.555,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[203607] = {
    name = "Mistie",
    mapID = 2133,
    x = 0.56, y = 0.565,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 2564,
    minStanding = 3,
}

VendorLocations[203608] = {
    name = "Rossmar",
    mapID = 2133,
    x = 0.561, y = 0.567,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 2564,
    minStanding = 3,
}

VendorLocations[203609] = {
    name = "Phiary",
    mapID = 2133,
    x = 0.569, y = 0.563,
    faction = "Neutral",
    types = { "food", "faction" },
    repFactionID = 2564,
    minStanding = 3,
}

VendorLocations[203610] = {
    name = "Scrybbil",
    mapID = 2133,
    x = 0.558, y = 0.559,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 2564,
    minStanding = 3,
}

VendorLocations[203612] = {
    name = "Fanilly",
    mapID = 2133,
    x = 0.567, y = 0.553,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 2564,
    minStanding = 3,
}

VendorLocations[203615] = {
    name = "Saccratros",
    mapID = 2133,
    x = 0.559, y = 0.554,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[203644] = {
    name = "Garram",
    mapID = 2133,
    x = 0.573, y = 0.559,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 2564,
    minStanding = 3,
}

VendorLocations[203769] = {
    name = "Bartender Bob",
    mapID = 2025,
    x = 0.522, y = 0.816,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[204693] = {
    name = "Ponzo",
    mapID = 2133,
    x = 0.581, y = 0.538,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2564,
    minStanding = 3,
    note = "ATT — Hat appears when you click dialog options (for the best price - click it a few times)",
}

VendorLocations[204860] = {
    name = "Lyssa",
    mapID = 2133,
    x = 0.568, y = 0.564,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[204990] = {
    name = "Melly Teletone",
    mapID = 2025,
    x = 0.522, y = 0.814,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — Use next to 'Bartender Bob'.",
}

VendorLocations[205676] = {
    name = "Norzko the Proud",
    mapID = 2133,
    x = 0.52, y = 0.256,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[206744] = {
    name = "Maztha",
    mapID = 2112,
    x = 0.272, y = 0.472,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[206864] = {
    name = "Preservationist Kathos",
    mapID = 2112,
    x = 0.4734, y = 0.481,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[207463] = {
    name = "Bartender Blob",
    mapID = 2025,
    x = 0.521, y = 0.814,
    faction = "Neutral",
    types = { "food" },
    note = "ATT — Timer start right after you buy it",
}

VendorLocations[207496] = {
    name = "Bragdur Battlebrew",
    mapID = 2112,
    x = 0.298, y = 0.566,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[208156] = {
    name = "Moon Priestess Lasara",
    mapID = 2200,
    x = 0.503, y = 0.616,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2574,
    minStanding = 6,
}

VendorLocations[208170] = {
    name = "Mythrin'dir",
    mapID = 2200,
    x = 0.496, y = 0.628,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[208338] = {
    name = "Baron Sliver",
    mapID = 2025,
    x = 0.51, y = 0.567,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[208341] = {
    name = "Falara Nightsong",
    mapID = 2025,
    x = 0.51, y = 0.567,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[208342] = {
    name = "Gill the Drill",
    mapID = 2025,
    x = 0.51, y = 0.566,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[208343] = {
    name = "Sorotis",
    mapID = 2025,
    x = 0.511, y = 0.567,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[208345] = {
    name = "Sir Finley Mrrgglton",
    mapID = 2025,
    x = 0.51, y = 0.566,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[208346] = {
    name = "Warden Krizzik",
    mapID = 2025,
    x = 0.511, y = 0.566,
    faction = "Alliance",
    types = { "food", "transmog" },
}

VendorLocations[208347] = {
    name = "Provisioner Qorra",
    mapID = 2025,
    x = 0.511, y = 0.566,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[208548] = {
    name = "Shi Everbreeze",
    mapID = 2025,
    x = 0.51, y = 0.567,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[208649] = {
    name = "Archdruid Hamuul Runetotem",
    mapID = 2022,
    x = 0.584, y = 0.677,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[209192] = {
    name = "Provisioner Aristta",
    mapID = 2025,
    x = 0.614, y = 0.314,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[209220] = {
    name = "Ironus Coldsteel",
    mapID = 2025,
    x = 0.522, y = 0.808,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[210608] = {
    name = "Celestine of the Harvest",
    mapID = 2022,
    x = 0.584, y = 0.678,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[211209] = {
    name = "Elianna",
    mapID = 2200,
    x = 0.502, y = 0.618,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 2574,
    minStanding = 5,
}

VendorLocations[211265] = {
    name = "Sylvia Whisperbloom",
    mapID = 2200,
    x = 0.598, y = 0.169,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[211328] = {
    name = "Vaskarn",
    mapID = 2200,
    x = 0.498, y = 0.629,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[212903] = {
    name = "Thaelishar Groveheart",
    mapID = 2200,
    x = 0.603, y = 0.169,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[213285] = {
    name = "Theozhaklos the Curious",
    mapID = 2200,
    x = 0.367, y = 0.333,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[213989] = {
    name = "Warkeeper Gresh",
    mapID = 2112,
    x = 0.431, y = 0.424,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[215385] = {
    name = "Shady Dealer",
    mapID = 2112,
    x = 0.606, y = 0.593,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[216224] = {
    name = "Iszy",
    mapID = 2112,
    x = 0.738, y = 0.467,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[216226] = {
    name = "Iszinormi",
    mapID = 2112,
    x = 0.737, y = 0.471,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[216231] = {
    name = "Iszinormi",
    mapID = 2112,
    x = 0.737, y = 0.474,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[216236] = {
    name = "Mirioszin",
    mapID = 2112,
    x = 0.738, y = 0.456,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[216284] = {
    name = "Mythrin'dir",
    mapID = 2239,
    x = 0.541, y = 0.608,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[216285] = {
    name = "Ellandrieth",
    mapID = 2239,
    x = 0.482, y = 0.536,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[216286] = {
    name = "Moon Priestess Lasara",
    mapID = 2239,
    x = 0.465, y = 0.706,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[216449] = {
    name = "Vaskarn",
    mapID = 2112,
    x = 0.455, y = 0.559,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[219760] = {
    name = "Da'kash Grimledger",
    mapID = 2112,
    x = 0.4668, y = 0.4523,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[253067] = {
    name = "Silvrath",
    mapID = 2112,
    x = 0.72, y = 0.494,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 2510,
    minStanding = 14,
}

VendorLocations[253086] = {
    name = "Jolinth",
    mapID = 2151,
    x = 0.352, y = 0.57,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[255019] = {
    name = "Xydan",
    mapID = 2112,
    x = 0.815, y = 0.472,
    faction = "Neutral",
    types = { "food", "transmog" },
}

------------------------------------------------------------------
-- Eastern Kingdoms (incl. Cataclysm revamp)
------------------------------------------------------------------

VendorLocations[54] = {
    name = "Corina Steele",
    mapID = 37,
    x = 0.414, y = 0.658,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[66] = {
    name = "Tharynn Bouden",
    mapID = 37,
    x = 0.418, y = 0.67,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[74] = {
    name = "Kurran Steele",
    mapID = 37,
    x = 0.414, y = 0.656,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[167] = {
    name = "Morhan Coppertongue",
    mapID = 48,
    x = 0.34, y = 0.466,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[222] = {
    name = "Nillen Andemar",
    mapID = 48,
    x = 0.43, y = 0.1,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[225] = {
    name = "Gavin Gnarltree",
    mapID = 47,
    x = 0.736, y = 0.498,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[226] = {
    name = "Morg Gnarltree",
    mapID = 47,
    x = 0.738, y = 0.486,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[228] = {
    name = "Avette Fellwood",
    mapID = 47,
    x = 0.732, y = 0.448,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[277] = {
    name = "Roberto Pupellyverbos",
    mapID = 84,
    x = 0.594, y = 0.772,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[340] = {
    name = "Kendor Kabonka",
    mapID = 84,
    x = 0.764, y = 0.53,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[384] = {
    name = "Katie Hunter",
    mapID = 37,
    x = 0.84, y = 0.654,
    faction = "Alliance",
    types = { "faction" },
    repFactionID = 72,
    minStanding = 42000,
}

VendorLocations[465] = {
    name = "Barkeep Dobbins",
    mapID = 37,
    x = 0.438, y = 0.658,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[483] = {
    name = "Elaine Trias",
    mapID = 84,
    x = 0.666, y = 0.734,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[734] = {
    name = "Corporal Bluth",
    mapID = 50,
    x = 0.474, y = 0.102,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[777] = {
    name = "Amy Davenport",
    mapID = 49,
    x = 0.28, y = 0.436,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[789] = {
    name = "Kimberly Hiett",
    mapID = 49,
    x = 0.264, y = 0.42,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[793] = {
    name = "Kara Adams",
    mapID = 49,
    x = 0.294, y = 0.429,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[843] = {
    name = "Gina MacGregor",
    mapID = 52,
    x = 0.576, y = 0.538,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[844] = {
    name = "Antonio Perelli",
    mapID = 37,
    x = 0.426, y = 0.666,
    faction = "Alliance",
    types = { "transmog" },
    note = "ATT — This vendor travels in a big circuit from Elwynn Forest (stopping in Goldshire) to Westfall (stopping in Sentinel Hill)",
}

VendorLocations[954] = {
    name = "Kat Sampson",
    mapID = 48,
    x = 0.826, y = 0.64,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[956] = {
    name = "Dorin Songblade",
    mapID = 49,
    x = 0.297, y = 0.429,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[959] = {
    name = "Morley Eberlein",
    mapID = 37,
    x = 0.647, y = 0.695,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[984] = {
    name = "Thralosh",
    mapID = 51,
    x = 0.468, y = 0.526,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[989] = {
    name = "Banalash",
    mapID = 51,
    x = 0.466, y = 0.57,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[1146] = {
    name = "Vharr",
    mapID = 50,
    x = 0.387, y = 0.491,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[1148] = {
    name = "Nerrist",
    mapID = 50,
    x = 0.393, y = 0.511,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[1149] = {
    name = "Uthok",
    mapID = 50,
    x = 0.375, y = 0.491,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[1198] = {
    name = "Rallic Finn",
    mapID = 37,
    x = 0.832, y = 0.66,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[1214] = {
    name = "Aldren Cordon",
    mapID = 48,
    x = 0.648, y = 0.66,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[1247] = {
    name = "Innkeeper Belm",
    mapID = 27,
    x = 0.544, y = 0.508,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[1250] = {
    name = "Drake Lindgren",
    mapID = 37,
    x = 0.832, y = 0.667,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1257] = {
    name = "Keldric Boucher",
    mapID = 84,
    x = 0.628, y = 0.75,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1261] = {
    name = "Veron Amberstill",
    mapID = 27,
    x = 0.706, y = 0.489,
    faction = "Alliance",
    types = { "faction" },
    repFactionID = 47,
    minStanding = 42000,
}

VendorLocations[1263] = {
    name = "Yarlyn Amberstill",
    mapID = 27,
    x = 0.705, y = 0.491,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1286] = {
    name = "Edna Mullby",
    mapID = 84,
    x = 0.646, y = 0.716,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1287] = {
    name = "Marda Weller",
    mapID = 84,
    x = 0.64, y = 0.686,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[1289] = {
    name = "Gunther Weller",
    mapID = 84,
    x = 0.64, y = 0.686,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[1291] = {
    name = "Carla Granger",
    mapID = 84,
    x = 0.622, y = 0.676,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[1294] = {
    name = "Aldric Moore",
    mapID = 84,
    x = 0.622, y = 0.676,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[1295] = {
    name = "Lara Moore",
    mapID = 84,
    x = 0.622, y = 0.676,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[1296] = {
    name = "Felder Stover",
    mapID = 36,
    x = 0.729, y = 0.658,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1297] = {
    name = "Lina Stover",
    mapID = 84,
    x = 0.586, y = 0.688,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[1298] = {
    name = "Frederick Stover",
    mapID = 84,
    x = 0.586, y = 0.69,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[1299] = {
    name = "Lisbeth Schneider",
    mapID = 84,
    x = 0.582, y = 0.676,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[1302] = {
    name = "Bernard Gump",
    mapID = 84,
    x = 0.692, y = 0.718,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[1303] = {
    name = "Felicia Gump",
    mapID = 84,
    x = 0.693, y = 0.714,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1304] = {
    name = "Darian Singh",
    mapID = 84,
    x = 0.426, y = 0.768,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1307] = {
    name = "Charys Yserian",
    mapID = 84,
    x = 0.447, y = 0.8637,
    faction = "Alliance",
    types = { "food", "transmog" },
}

VendorLocations[1309] = {
    name = "Wynne Larson",
    mapID = 84,
    x = 0.52, y = 0.836,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1312] = {
    name = "Ardwyn Cailen",
    mapID = 84,
    x = 0.528, y = 0.752,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[1313] = {
    name = "Maria Lumere",
    mapID = 84,
    x = 0.556, y = 0.856,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1314] = {
    name = "Duncan Cullen",
    mapID = 84,
    x = 0.532, y = 0.818,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[1315] = {
    name = "Allan Hafgan",
    mapID = 84,
    x = 0.529, y = 0.752,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[1318] = {
    name = "Jessara Cordell",
    mapID = 84,
    x = 0.53, y = 0.742,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1319] = {
    name = "Bryan Cross",
    mapID = 84,
    x = 0.696, y = 0.578,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[1320] = {
    name = "Seoman Griffith",
    mapID = 84,
    x = 0.72, y = 0.622,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1323] = {
    name = "Osric Strang",
    mapID = 84,
    x = 0.77, y = 0.612,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1324] = {
    name = "Heinrich Stone",
    mapID = 84,
    x = 0.77, y = 0.576,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[1325] = {
    name = "Jasper Fel",
    mapID = 84,
    x = 0.806, y = 0.616,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1326] = {
    name = "Sloan McCoy",
    mapID = 84,
    x = 0.812, y = 0.626,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[1328] = {
    name = "Elly Langston",
    mapID = 84,
    x = 0.76, y = 0.534,
    faction = "Alliance",
    types = { "general" },
    note = "ATT — Elly is walking around in the Tavern.",
}

VendorLocations[1333] = {
    name = "Gerik Koen",
    mapID = 84,
    x = 0.732, y = 0.572,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[1341] = {
    name = "Wilhelm Strang",
    mapID = 84,
    x = 0.774, y = 0.616,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1347] = {
    name = "Alexandra Bolero",
    mapID = 84,
    x = 0.532, y = 0.816,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1348] = {
    name = "Gregory Ardus",
    mapID = 84,
    x = 0.482, y = 0.548,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[1349] = {
    name = "Agustus Moulaine",
    mapID = 84,
    x = 0.536, y = 0.578,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1350] = {
    name = "Theresa Moulaine",
    mapID = 84,
    x = 0.534, y = 0.58,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[1362] = {
    name = "Gothor Brumn",
    mapID = 48,
    x = 0.241, y = 0.182,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1441] = {
    name = "Brak Durnad",
    mapID = 56,
    x = 0.116, y = 0.595,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[1448] = {
    name = "Neal Allen",
    mapID = 56,
    x = 0.118, y = 0.526,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1450] = {
    name = "Brahnmar",
    mapID = 56,
    x = 0.116, y = 0.599,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1454] = {
    name = "Jennabink Powerseam",
    mapID = 56,
    x = 0.1, y = 0.59,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[1457] = {
    name = "Samor Festivus",
    mapID = 56,
    x = 0.105, y = 0.602,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1459] = {
    name = "Naela Trance",
    mapID = 56,
    x = 0.11, y = 0.578,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[1460] = {
    name = "Unger Statforth",
    mapID = 56,
    x = 0.092, y = 0.566,
    faction = "Alliance",
    types = { "faction" },
    repFactionID = 72,
    minStanding = 42000,
}

VendorLocations[1461] = {
    name = "Murndan Derth",
    mapID = 56,
    x = 0.113, y = 0.596,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1462] = {
    name = "Edwina Monzor",
    mapID = 56,
    x = 0.111, y = 0.58,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1465] = {
    name = "Drac Roughcut",
    mapID = 48,
    x = 0.356, y = 0.491,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1469] = {
    name = "Vrok Blunderblast",
    mapID = 48,
    x = 0.253, y = 0.425,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1471] = {
    name = "Jannos Ironwill",
    mapID = 14,
    x = 0.408, y = 0.481,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1474] = {
    name = "Rann Flamespinner",
    mapID = 48,
    x = 0.36, y = 0.46,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1668] = {
    name = "William MacGregor",
    mapID = 52,
    x = 0.577, y = 0.537,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[1669] = {
    name = "Defias Profiteer",
    mapID = 52,
    x = 0.434, y = 0.668,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1684] = {
    name = "Khara Deepwater",
    mapID = 48,
    x = 0.395, y = 0.392,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1685] = {
    name = "Xandar Goodbeard",
    mapID = 48,
    x = 0.826, y = 0.632,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1686] = {
    name = "Irene Sureshot",
    mapID = 48,
    x = 0.832, y = 0.635,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[1687] = {
    name = "Cliff Hadin",
    mapID = 48,
    x = 0.83, y = 0.63,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[2046] = {
    name = "Andrew Krighton",
    mapID = 37,
    x = 0.417, y = 0.659,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[2118] = {
    name = "Abigail Shiel",
    mapID = 18,
    x = 0.61, y = 0.51,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[2140] = {
    name = "Edwin Harly",
    mapID = 21,
    x = 0.441, y = 0.397,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[2380] = {
    name = "Nandar Branson",
    mapID = 25,
    x = 0.509, y = 0.571,
    faction = "Alliance",
    types = { "general" },
    note = "ATT — WARNING: This item will be made unavailable, but still learnable, by Alliance players. If you are Alliance, you may want",
}

VendorLocations[2381] = {
    name = "Micha Yance",
    mapID = 25,
    x = 0.49, y = 0.552,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[2388] = {
    name = "Innkeeper Shay",
    mapID = 25,
    x = 0.578, y = 0.472,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[2393] = {
    name = "Christoph Jeffcoat",
    mapID = 25,
    x = 0.575, y = 0.478,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[2394] = {
    name = "Mallen Swain",
    mapID = 25,
    x = 0.58, y = 0.478,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[2397] = {
    name = "Derak Nightfall",
    mapID = 25,
    x = 0.576, y = 0.452,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[2480] = {
    name = "Bro'kin",
    mapID = 25,
    x = 0.44, y = 0.218,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[2481] = {
    name = "Bliztik",
    mapID = 47,
    x = 0.18, y = 0.544,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[2483] = {
    name = "Jaquilina Dramet",
    mapID = 50,
    x = 0.437, y = 0.232,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[2668] = {
    name = "Danielle Zipstitch",
    mapID = 47,
    x = 0.758, y = 0.454,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[2669] = {
    name = "Sheri Zipstitch",
    mapID = 47,
    x = 0.756, y = 0.454,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[2679] = {
    name = "Wenna Silkbeard",
    mapID = 56,
    x = 0.256, y = 0.258,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[2682] = {
    name = "Fradd Swiftgear",
    mapID = 56,
    x = 0.264, y = 0.258,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[2687] = {
    name = "Gnaz Blunderflame",
    mapID = 50,
    x = 0.675, y = 0.612,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[2688] = {
    name = "Ruppo Zipcoil",
    mapID = 26,
    x = 0.342, y = 0.378,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[2697] = {
    name = "Clyde Ranthal",
    mapID = 49,
    x = 0.788, y = 0.635,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[2698] = {
    name = "George Candarte",
    mapID = 25,
    x = 0.766, y = 0.586,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[2795] = {
    name = "Lenny \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"Fingers\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" McCoy",
    mapID = 84,
    x = 0.728, y = 0.588,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[2805] = {
    name = "Deneb Walker",
    mapID = 14,
    x = 0.27, y = 0.588,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[2810] = {
    name = "Hammon Karwn",
    mapID = 14,
    x = 0.405, y = 0.489,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[2812] = {
    name = "Drovnar Strongbrew",
    mapID = 14,
    x = 0.406, y = 0.482,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[2814] = {
    name = "Narj Deepslice",
    mapID = 14,
    x = 0.397, y = 0.489,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[2816] = {
    name = "Androd Fadran",
    mapID = 14,
    x = 0.392, y = 0.481,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[2819] = {
    name = "Tunkk",
    mapID = 14,
    x = 0.7, y = 0.354,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[2821] = {
    name = "Keena",
    mapID = 14,
    x = 0.692, y = 0.336,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3085] = {
    name = "Gloria Femmel",
    mapID = 49,
    x = 0.261, y = 0.403,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[3088] = {
    name = "Henry Chapal",
    mapID = 49,
    x = 0.237, y = 0.385,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[3090] = {
    name = "Gerald Crawley",
    mapID = 49,
    x = 0.248, y = 0.383,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[3091] = {
    name = "Franklin Hamar",
    mapID = 49,
    x = 0.265, y = 0.42,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[3134] = {
    name = "Kzixx",
    mapID = 47,
    x = 0.818, y = 0.198,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[3138] = {
    name = "Scott Carevin",
    mapID = 47,
    x = 0.757, y = 0.475,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[3178] = {
    name = "Stuart Fleming",
    mapID = 56,
    x = 0.063, y = 0.574,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[3180] = {
    name = "Dark Iron Entrepreneur",
    mapID = 14,
    x = 0.427, y = 0.903,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[3522] = {
    name = "Constance Brisboise",
    mapID = 18,
    x = 0.526, y = 0.556,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3534] = {
    name = "Wallace the Blind",
    mapID = 21,
    x = 0.33, y = 0.178,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[3536] = {
    name = "Kris Legace",
    mapID = 25,
    x = 0.688, y = 0.588,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[3537] = {
    name = "Zixil",
    mapID = 25,
    x = 0.494, y = 0.666,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[3539] = {
    name = "Ott",
    mapID = 25,
    x = 0.576, y = 0.476,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[3546] = {
    name = "Bernie Heisten",
    mapID = 17,
    x = 0.594, y = 0.149,
    faction = "Alliance",
    types = { "food" },
    note = "ATT — Buy at least one of these before you enter the Dark Portal!",
}

VendorLocations[3548] = {
    name = "Selina Weston",
    mapID = 18,
    x = 0.5964, y = 0.5225,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3550] = {
    name = "Martine Tramblay",
    mapID = 18,
    x = 0.658, y = 0.596,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3552] = {
    name = "Alexandre Lefevre",
    mapID = 21,
    x = 0.446, y = 0.396,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[3554] = {
    name = "Andrea Boynton",
    mapID = 21,
    x = 0.446, y = 0.392,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[3556] = {
    name = "Andrew Hilbert",
    mapID = 21,
    x = 0.432, y = 0.406,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4256] = {
    name = "Golnir Bouldertoe",
    mapID = 87,
    x = 0.515, y = 0.263,
    faction = "Alliance",
    types = { "profession" },
}

VendorLocations[4259] = {
    name = "Thurgrum Deepforge",
    mapID = 87,
    x = 0.518, y = 0.412,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[4305] = {
    name = "Kriggon Talsone",
    mapID = 52,
    x = 0.362, y = 0.9,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[4553] = {
    name = "Ronald Burch",
    mapID = 90,
    x = 0.623, y = 0.431,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4554] = {
    name = "Tawny Grisette",
    mapID = 90,
    x = 0.697, y = 0.448,
    faction = "Horde",
    types = { "food" },
    note = "ATT — Walks around the Trade Quarter, upper level.",
}

VendorLocations[4555] = {
    name = "Eleanor Rusk",
    mapID = 90,
    x = 0.692, y = 0.489,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4556] = {
    name = "Gordon Wendham",
    mapID = 90,
    x = 0.614, y = 0.412,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4557] = {
    name = "Louis Warren",
    mapID = 90,
    x = 0.62, y = 0.412,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4558] = {
    name = "Lauren Newcomb",
    mapID = 90,
    x = 0.64, y = 0.38,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[4559] = {
    name = "Timothy Weldon",
    mapID = 90,
    x = 0.636, y = 0.396,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[4560] = {
    name = "Walter Ellingson",
    mapID = 90,
    x = 0.628, y = 0.396,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4561] = {
    name = "Daniel Bartlett",
    mapID = 90,
    x = 0.64, y = 0.374,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4569] = {
    name = "Charles Seaton",
    mapID = 90,
    x = 0.77, y = 0.5,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4570] = {
    name = "Sydney Upton",
    mapID = 90,
    x = 0.698, y = 0.274,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4574] = {
    name = "Lizbeth Cromwell",
    mapID = 90,
    x = 0.81, y = 0.308,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4577] = {
    name = "Millie Gregorian",
    mapID = 90,
    x = 0.706, y = 0.301,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4580] = {
    name = "Lucille Castleton",
    mapID = 90,
    x = 0.714, y = 0.284,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4585] = {
    name = "Ezekiel Graves",
    mapID = 90,
    x = 0.756, y = 0.516,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4589] = {
    name = "Joseph Moore",
    mapID = 90,
    x = 0.701, y = 0.584,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4592] = {
    name = "Nathaniel Steenwick",
    mapID = 90,
    x = 0.772, y = 0.502,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4597] = {
    name = "Samuel Van Brunt",
    mapID = 90,
    x = 0.614, y = 0.301,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4599] = {
    name = "Sarah Killian",
    mapID = 90,
    x = 0.566, y = 0.373,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[4600] = {
    name = "Geoffrey Hartwell",
    mapID = 90,
    x = 0.584, y = 0.326,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4601] = {
    name = "Francis Eliot",
    mapID = 90,
    x = 0.586, y = 0.326,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[4602] = {
    name = "Benijah Fenner",
    mapID = 90,
    x = 0.586, y = 0.326,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[4603] = {
    name = "Nicholas Atwood",
    mapID = 90,
    x = 0.622, y = 0.27,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4604] = {
    name = "Abigail Sawyer",
    mapID = 90,
    x = 0.548, y = 0.38,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[4610] = {
    name = "Algernon",
    mapID = 90,
    x = 0.518, y = 0.746,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4615] = {
    name = "Katrina Alliestar",
    mapID = 90,
    x = 0.5473, y = 0.489,
    faction = "Horde",
    types = { "general" },
    note = "ATT — Only select Herbalism Suppliers sells this pouch.",
}

VendorLocations[4617] = {
    name = "Thaddeus Webb",
    mapID = 90,
    x = 0.62, y = 0.608,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4730] = {
    name = "Lelanai",
    mapID = 84,
    x = 0.55, y = 0.126,
    faction = "Alliance",
    types = { "faction" },
    repFactionID = 69,
    minStanding = 42000,
}

VendorLocations[4731] = {
    name = "Zachariah Post",
    mapID = 18,
    x = 0.618, y = 0.518,
    faction = "Horde",
    types = { "faction" },
    repFactionID = 68,
    minStanding = 42000,
}

VendorLocations[4775] = {
    name = "Felicia Doan",
    mapID = 90,
    x = 0.641, y = 0.506,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4782] = {
    name = "Truk Wildbeard",
    mapID = 26,
    x = 0.144, y = 0.423,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5049] = {
    name = "Lyesa Steelbrow",
    mapID = 87,
    x = 0.364, y = 0.844,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5102] = {
    name = "Dolman Steelfury",
    mapID = 87,
    x = 0.366, y = 0.666,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[5103] = {
    name = "Grenil Steelfury",
    mapID = 87,
    x = 0.364, y = 0.666,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5106] = {
    name = "Bromiir Ormsen",
    mapID = 87,
    x = 0.326, y = 0.582,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[5107] = {
    name = "Mangorn Flinthammer",
    mapID = 87,
    x = 0.32, y = 0.588,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[5108] = {
    name = "Raena Flinthammer",
    mapID = 87,
    x = 0.326, y = 0.58,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5109] = {
    name = "Myra Tyrngaarde",
    mapID = 87,
    x = 0.298, y = 0.675,
    faction = "Alliance",
    types = { "food" },
    note = "ATT — Walks around The Commons.",
}

VendorLocations[5112] = {
    name = "Gwenna Firebrew",
    mapID = 87,
    x = 0.186, y = 0.519,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[5119] = {
    name = "Hegnar Swiftaxe",
    mapID = 87,
    x = 0.618, y = 0.886,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5120] = {
    name = "Brenwyn Wintersteel",
    mapID = 87,
    x = 0.618, y = 0.888,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5121] = {
    name = "Kelomir Ironhand",
    mapID = 87,
    x = 0.614, y = 0.884,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[5122] = {
    name = "Skolmin Goldfury",
    mapID = 87,
    x = 0.716, y = 0.662,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[5123] = {
    name = "Bretta Goldfury",
    mapID = 87,
    x = 0.728, y = 0.648,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5124] = {
    name = "Sognar Cliffbeard",
    mapID = 87,
    x = 0.621, y = 0.72,
    faction = "Alliance",
    types = { "food" },
    note = "ATT — Walks around The Military Ward.",
}

VendorLocations[5125] = {
    name = "Dolkin Craghelm",
    mapID = 87,
    x = 0.548, y = 0.886,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5126] = {
    name = "Olthran Craghelm",
    mapID = 87,
    x = 0.55, y = 0.884,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5128] = {
    name = "Bombus Finespindle",
    mapID = 87,
    x = 0.402, y = 0.334,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5129] = {
    name = "Lissyphus Finespindle",
    mapID = 87,
    x = 0.546, y = 0.882,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5133] = {
    name = "Harick Boulderdrum",
    mapID = 87,
    x = 0.228, y = 0.166,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5138] = {
    name = "Gwina Stonebranch",
    mapID = 87,
    x = 0.5508, y = 0.5951,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5152] = {
    name = "Bingus",
    mapID = 87,
    x = 0.232, y = 0.176,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5154] = {
    name = "Poranna Snowbraid",
    mapID = 87,
    x = 0.4311, y = 0.2847,
    faction = "Alliance",
    types = { "profession" },
}

VendorLocations[5155] = {
    name = "Ingrys Stonebrow",
    mapID = 87,
    x = 0.392, y = 0.05,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5156] = {
    name = "Maeva Snowbraid",
    mapID = 87,
    x = 0.388, y = 0.056,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5158] = {
    name = "Tilli Thistlefuzz",
    mapID = 87,
    x = 0.608, y = 0.442,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5160] = {
    name = "Emrul Riknussun",
    mapID = 87,
    x = 0.606, y = 0.382,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5162] = {
    name = "Tansy Puddlefizz",
    mapID = 87,
    x = 0.478, y = 0.066,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5163] = {
    name = "Burbik Gearspanner",
    mapID = 87,
    x = 0.466, y = 0.272,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5169] = {
    name = "Tynnus Venomsprout",
    mapID = 87,
    x = 0.528, y = 0.136,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5170] = {
    name = "Hjoldir Stoneblade",
    mapID = 87,
    x = 0.458, y = 0.07,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5175] = {
    name = "Gearcutter Cogspinner",
    mapID = 87,
    x = 0.678, y = 0.43,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5178] = {
    name = "Soolie Berryfizz",
    mapID = 87,
    x = 0.666, y = 0.546,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5190] = {
    name = "Merill Pleasance",
    mapID = 90,
    x = 0.693, y = 0.448,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[5193] = {
    name = "Rebecca Laughlin",
    mapID = 84,
    x = 0.64, y = 0.772,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[5483] = {
    name = "Erika Tate",
    mapID = 84,
    x = 0.776, y = 0.532,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5494] = {
    name = "Catherine Leland",
    mapID = 84,
    x = 0.55, y = 0.696,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5503] = {
    name = "Eldraeith",
    mapID = 84,
    x = 0.556, y = 0.856,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5509] = {
    name = "Kathrum Axehand",
    mapID = 84,
    x = 0.596, y = 0.34,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[5510] = {
    name = "Thulman Flintcrag",
    mapID = 84,
    x = 0.618, y = 0.362,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[5512] = {
    name = "Kaita Deepforge",
    mapID = 84,
    x = 0.632, y = 0.376,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5514] = {
    name = "Brooke Stonebraid",
    mapID = 84,
    x = 0.5915, y = 0.375,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5565] = {
    name = "Jillian Tanner",
    mapID = 84,
    x = 0.717, y = 0.628,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5748] = {
    name = "Killian Sanatha",
    mapID = 21,
    x = 0.594, y = 0.334,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[5754] = {
    name = "Zane Bradford",
    mapID = 90,
    x = 0.7, y = 0.272,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[5757] = {
    name = "Lilly",
    mapID = 21,
    x = 0.468, y = 0.406,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[5758] = {
    name = "Leo Sarn",
    mapID = 21,
    x = 0.538, y = 0.822,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[5819] = {
    name = "Mirelle Tremayne",
    mapID = 90,
    x = 0.616, y = 0.284,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[5820] = {
    name = "Gillian Moore",
    mapID = 90,
    x = 0.706, y = 0.596,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[5821] = {
    name = "Sheldon Von Croy",
    mapID = 90,
    x = 0.706, y = 0.288,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[6030] = {
    name = "Thorvald Deepforge",
    mapID = 48,
    x = 0.237, y = 0.743,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[6294] = {
    name = "Krom Stoutarm",
    mapID = 87,
    x = 0.746, y = 0.098,
    faction = "Alliance",
    types = { "food", "transmog" },
}

VendorLocations[6367] = {
    name = "Donni Anthania",
    mapID = 37,
    x = 0.442, y = 0.532,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[6566] = {
    name = "Estelle Gendry",
    mapID = 90,
    x = 0.782, y = 0.766,
    faction = "Horde",
    types = { "food", "transmog" },
}

VendorLocations[6574] = {
    name = "Jun'ha",
    mapID = 14,
    x = 0.678, y = 0.374,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[6749] = {
    name = "Erma",
    mapID = 37,
    x = 0.428, y = 0.658,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[6777] = {
    name = "Zan Shivsproket",
    mapID = 25,
    x = 0.712, y = 0.453,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[6779] = {
    name = "Smudge Thunderwood",
    mapID = 25,
    x = 0.71, y = 0.458,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[7955] = {
    name = "Milli Featherwhistle",
    mapID = 27,
    x = 0.562, y = 0.463,
    faction = "Alliance",
    types = { "faction" },
    repFactionID = 54,
    minStanding = 42000,
}

VendorLocations[7976] = {
    name = "Thalgus Thunderfist",
    mapID = 87,
    x = 0.618, y = 0.9,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[7978] = {
    name = "Bimble Longberry",
    mapID = 87,
    x = 0.324, y = 0.212,
    faction = "Alliance",
    types = { "food" },
    note = "ATT — Walks around The Mystic Ward.",
}

VendorLocations[8117] = {
    name = "Wizbang Booms",
    mapID = 87,
    x = 0.318, y = 0.634,
    faction = "Alliance",
    types = { "general" },
    note = "ATT — This NPC is only available on July 4th.",
}

VendorLocations[8118] = {
    name = "Lillian Singh",
    mapID = 84,
    x = 0.626, y = 0.7,
    faction = "Alliance",
    types = { "transmog" },
    note = "ATT — This NPC is only available on July 4th.",
}

VendorLocations[8160] = {
    name = "Nioma",
    mapID = 26,
    x = 0.133, y = 0.434,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[8161] = {
    name = "Harggan",
    mapID = 26,
    x = 0.136, y = 0.448,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[8176] = {
    name = "Gharash",
    mapID = 51,
    x = 0.472, y = 0.522,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[8177] = {
    name = "Rartar",
    mapID = 51,
    x = 0.472, y = 0.572,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[8178] = {
    name = "Nina Lightbrew",
    mapID = 17,
    x = 0.624, y = 0.16,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[8665] = {
    name = "Shylenai",
    mapID = 84,
    x = 0.56, y = 0.0322,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[8679] = {
    name = "Knaz Blunderflame",
    mapID = 50,
    x = 0.678, y = 0.611,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[8681] = {
    name = "Outfitter Eric",
    mapID = 87,
    x = 0.4322, y = 0.2926,
    faction = "Alliance",
    types = { "profession" },
}

VendorLocations[9099] = {
    name = "Sraaz",
    mapID = 87,
    x = 0.466, y = 0.472,
    faction = "Alliance",
    types = { "food" },
    note = "ATT — Walks around The Great Forge.",
}

VendorLocations[9179] = {
    name = "Jazzrik",
    mapID = 15,
    x = 0.424, y = 0.525,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[9553] = {
    name = "Nadia Vernon",
    mapID = 21,
    x = 0.448, y = 0.398,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[9555] = {
    name = "Mu'uta",
    mapID = 14,
    x = 0.676, y = 0.342,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[10856] = {
    name = "Argent Quartermaster Hasana",
    mapID = 18,
    x = 0.832, y = 0.68,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[10857] = {
    name = "Argent Quartermaster Lightspark",
    mapID = 22,
    x = 0.428, y = 0.838,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[11056] = {
    name = "Alchemist Arbington",
    mapID = 22,
    x = 0.426, y = 0.838,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[11057] = {
    name = "Apothecary Dithers",
    mapID = 18,
    x = 0.832, y = 0.692,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[11278] = {
    name = "Magnus Frostwake",
    mapID = 22,
    x = 0.68, y = 0.776,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[11283] = {
    name = "Sammy",
    mapID = 22,
    x = 0.691, y = 0.787,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — Only visible if you have the Spectral Essence equipped.",
}

VendorLocations[11285] = {
    name = "Rory",
    mapID = 22,
    x = 0.634, y = 0.756,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — Only visible if you have the Spectral Essence equipped.",
}

VendorLocations[11286] = {
    name = "Magistrate Marduke",
    mapID = 22,
    x = 0.705, y = 0.74,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — Only visible if you have the Spectral Essence equipped.",
}

VendorLocations[11316] = {
    name = "Joseph Dirte",
    mapID = 22,
    x = 0.68, y = 0.748,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — Only visible if you have the Spectral Essence equipped.",
}

VendorLocations[11536] = {
    name = "Quartermaster Miranda Breechlock",
    mapID = 23,
    x = 0.759, y = 0.54,
    faction = "Neutral",
    types = { "food", "faction" },
    repFactionID = 529,
    note = "ATT — You must have first completed 'Mantles of the Dawn' in order to purchase this.",
}

VendorLocations[11874] = {
    name = "Masat T'andr",
    mapID = 51,
    x = 0.296, y = 0.336,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[11936] = {
    name = "Artist Renfray",
    mapID = 22,
    x = 0.658, y = 0.754,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — Only visible if you have the Spectral Essence equipped.",
}

VendorLocations[12040] = {
    name = "Brannik Ironbelly",
    mapID = 26,
    x = 0.666, y = 0.442,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[12384] = {
    name = "Augustus the Touched",
    mapID = 23,
    x = 0.114, y = 0.286,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — Vendor will not sell anything until you complete his quest.",
}

VendorLocations[12777] = {
    name = "Captain Dirgehammer",
    mapID = 84,
    x = 0.75, y = 0.675,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[12778] = {
    name = "Lieutenant Rachel Vaccar",
    mapID = 84,
    x = 0.752, y = 0.672,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[12781] = {
    name = "Master Sergeant Biggins",
    mapID = 84,
    x = 0.752, y = 0.668,
    faction = "Alliance",
    types = { "food", "transmog" },
}

VendorLocations[12783] = {
    name = "Lieutenant Karter",
    mapID = 84,
    x = 0.762, y = 0.656,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[12784] = {
    name = "Lieutenant Jackspring",
    mapID = 84,
    x = 0.752, y = 0.672,
    faction = "Alliance",
    types = { "general" },
    note = "ATT — Blizzard strikes again. In order to transmog these, you need to have the original title associated with the gear. Howeve",
}

VendorLocations[12785] = {
    name = "Sergeant Major Clate",
    mapID = 84,
    x = 0.754, y = 0.67,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[12941] = {
    name = "Jase Farlane",
    mapID = 23,
    x = 0.743, y = 0.509,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[12942] = {
    name = "Leonard Porter",
    mapID = 22,
    x = 0.43, y = 0.843,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[12943] = {
    name = "Werg Thickblade",
    mapID = 18,
    x = 0.832, y = 0.694,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[12958] = {
    name = "Gigget Zipcoil",
    mapID = 26,
    x = 0.344, y = 0.386,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[13217] = {
    name = "Thanthaldis Snowgleam",
    mapID = 25,
    x = 0.446, y = 0.464,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[13219] = {
    name = "Jorek Ironside",
    mapID = 25,
    x = 0.581, y = 0.336,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[13433] = {
    name = "Wulmort Jinglepocket",
    mapID = 87,
    x = 0.332, y = 0.678,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[13435] = {
    name = "Khole Jinglepocket",
    mapID = 84,
    x = 0.63, y = 0.706,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[14437] = {
    name = "Gorzeeki Wildeyes",
    mapID = 36,
    x = 0.126, y = 0.316,
    faction = "Alliance",
    types = { "general" },
    note = "ATT — The following items are only available to Warlocks that completed the original |cFFFFD700Dreadsteed of Xoroth|r quest ch",
}

VendorLocations[14624] = {
    name = "Master Smith Burninate",
    mapID = 32,
    x = 0.388, y = 0.285,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[14738] = {
    name = "Otho Moji'ko",
    mapID = 26,
    x = 0.792, y = 0.79,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[15126] = {
    name = "Rutherford Twing",
    mapID = 14,
    x = 0.685, y = 0.304,
    faction = "Horde",
    types = { "transmog", "faction" },
    repFactionID = 510,
    minStanding = 42000,
}

VendorLocations[15127] = {
    name = "Samuel Hawke",
    mapID = 14,
    x = 0.402, y = 0.464,
    faction = "Alliance",
    types = { "transmog", "faction" },
    repFactionID = 509,
    minStanding = 42000,
}

VendorLocations[15898] = {
    name = "Lunar Festival Vendor",
    mapID = 87,
    x = 0.296, y = 0.146,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[16365] = {
    name = "Master Craftsman Omarion",
    mapID = 23,
    x = 0.756, y = 0.52,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[16786] = {
    name = "Argent Quartermaster",
    mapID = 23,
    x = 0.809, y = 0.596,
    faction = "Neutral",
    types = { "food", "transmog" },
}

VendorLocations[18255] = {
    name = "Mage Darius",
    mapID = 42,
    x = 0.4725, y = 0.7493,
    faction = "Alliance",
    types = { "food", "profession" },
}

VendorLocations[23446] = {
    name = "Lieutenant Tristia",
    mapID = 84,
    x = 0.75, y = 0.67,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[23481] = {
    name = "Keiran Donoghue",
    mapID = 27,
    x = 0.5533, y = 0.3717,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[23482] = {
    name = "Barleybrew Apprentice",
    mapID = 27,
    x = 0.56, y = 0.38,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[23510] = {
    name = "Thunderbrew Apprentice",
    mapID = 27,
    x = 0.566, y = 0.37,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[23511] = {
    name = "Gordok Brew Apprentice",
    mapID = 27,
    x = 0.556, y = 0.366,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[23521] = {
    name = "Anne Summers",
    mapID = 27,
    x = 0.564, y = 0.376,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[23522] = {
    name = "Arlen Lochlan",
    mapID = 27,
    x = 0.556, y = 0.38,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[23710] = {
    name = "Belbi Quikswitch",
    mapID = 27,
    x = 0.562, y = 0.376,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[24468] = {
    name = "Pol Amberstill",
    mapID = 27,
    x = 0.536, y = 0.386,
    faction = "Alliance",
    types = { "general" },
    note = "ATT — You are unable to purchase the rams from the vendor because you did not complete the 'Brewfest Riding Rams' quest back i",
}

VendorLocations[26123] = {
    name = "Midsummer Supplier",
    mapID = 84,
    x = 0.492, y = 0.718,
    faction = "Alliance",
    types = { "food", "transmog" },
    note = "ATT — You will need 10 of these torches to complete the |cffffff00Torch Juggler|r achievement.",
}

VendorLocations[28347] = {
    name = "Miles Sidney",
    mapID = 84,
    x = 0.742, y = 0.58,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[28500] = {
    name = "Master Siegesmith Corvus",
    mapID = 23,
    x = 0.508, y = 0.302,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[28512] = {
    name = "Quartermaster Ozorg",
    mapID = 23,
    x = 0.819, y = 0.484,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[29587] = {
    name = "Dread Commander Thalanor",
    mapID = 23,
    x = 0.84, y = 0.498,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[30730] = {
    name = "Stanly McCormick",
    mapID = 84,
    x = 0.496, y = 0.749,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[32379] = {
    name = "Captain O'Neal",
    mapID = 84,
    x = 0.75, y = 0.667,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[32380] = {
    name = "Lieutenant Tristia",
    mapID = 84,
    x = 0.747, y = 0.672,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[32381] = {
    name = "Captain Dirgehammer",
    mapID = 84,
    x = 0.75, y = 0.674,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[32834] = {
    name = "Knight-Lieutenant Moonstrike",
    mapID = 84,
    x = 0.748, y = 0.673,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[32836] = {
    name = "Noblegarden Vendor",
    mapID = 27,
    x = 0.5411, y = 0.5081,
    faction = "Alliance",
    types = { "food", "transmog" },
}

VendorLocations[32837] = {
    name = "Noblegarden Merchant",
    mapID = 18,
    x = 0.6135, y = 0.5298,
    faction = "Horde",
    types = { "food", "transmog" },
}

VendorLocations[34073] = {
    name = "Captain Dirgehammer",
    mapID = 84,
    x = 0.75, y = 0.674,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[34074] = {
    name = "Captain Dirgehammer",
    mapID = 84,
    x = 0.75, y = 0.674,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[34075] = {
    name = "Captain Dirgehammer",
    mapID = 84,
    x = 0.75, y = 0.674,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[34076] = {
    name = "Lieutenant Tristia",
    mapID = 84,
    x = 0.747, y = 0.672,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[34077] = {
    name = "Lieutenant Tristia",
    mapID = 84,
    x = 0.747, y = 0.672,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[34078] = {
    name = "Lieutenant Tristia",
    mapID = 84,
    x = 0.747, y = 0.672,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[34082] = {
    name = "Knight-Lieutenant Moonstrike",
    mapID = 84,
    x = 0.748, y = 0.673,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[34083] = {
    name = "Knight-Lieutenant Moonstrike",
    mapID = 84,
    x = 0.748, y = 0.673,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[34084] = {
    name = "Knight-Lieutenant Moonstrike",
    mapID = 84,
    x = 0.748, y = 0.673,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[34645] = {
    name = "Elizabeth Barker Winslow",
    mapID = 27,
    x = 0.598, y = 0.342,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[34682] = {
    name = "Wilmina Holbeck",
    mapID = 37,
    x = 0.34, y = 0.516,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[34683] = {
    name = "Rose Standish",
    mapID = 18,
    x = 0.614, y = 0.674,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[37674] = {
    name = "Lovely Merchant",
    mapID = 84,
    x = 0.626, y = 0.754,
    faction = "Alliance",
    types = { "food", "transmog" },
}

VendorLocations[40606] = {
    name = "Knight-Lieutenant T'Maire Sydes",
    mapID = 84,
    x = 0.748, y = 0.676,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[41435] = {
    name = "Fradd Swiftgear",
    mapID = 56,
    x = 0.268, y = 0.259,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[41622] = {
    name = "Victorina",
    mapID = 56,
    x = 0.58, y = 0.407,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[43694] = {
    name = "Katie Stokx",
    mapID = 84,
    x = 0.77, y = 0.678,
    faction = "Alliance",
    types = { "faction" },
    repFactionID = 72,
    minStanding = 42000,
}

VendorLocations[43768] = {
    name = "Tannec Stonebeak",
    mapID = 84,
    x = 0.714, y = 0.72,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[43948] = {
    name = "Private Jackson",
    mapID = 52,
    x = 0.422, y = 0.648,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[44114] = {
    name = "Wilkinson",
    mapID = 47,
    x = 0.203, y = 0.584,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[44245] = {
    name = "Faldren Tillsdale",
    mapID = 84,
    x = 0.761, y = 0.668,
    faction = "Alliance",
    types = { "transmog" },
    note = "ATT — Sells gear related to Cataclysm raid tier 13 (Dragon Soul).",
}

VendorLocations[44246] = {
    name = "Magatha Silverton",
    mapID = 84,
    x = 0.755, y = 0.661,
    faction = "Alliance",
    types = { "transmog" },
    note = "ATT — Sells gear related to Cataclysm raid tier 12 (Firelands) as well as Baradin Hold.",
}

VendorLocations[44321] = {
    name = "Sarah Lightbrew",
    mapID = 17,
    x = 0.624, y = 0.162,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[44583] = {
    name = "Terrance Denman",
    mapID = 84,
    x = 0.631, y = 0.615,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[45500] = {
    name = "Urk Gagbaz",
    mapID = 23,
    x = 0.35, y = 0.682,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[46022] = {
    name = "Beezil Linkspanner",
    mapID = 23,
    x = 0.738, y = 0.524,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — Collect all other travelers, then speak to Beezil at Light Hope's Chapel.",
}

VendorLocations[46996] = {
    name = "Jade Ramalot",
    mapID = 27,
    x = 0.786, y = 0.2,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[47106] = {
    name = "Christine Gade",
    mapID = 23,
    x = 0.178, y = 0.278,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[47144] = {
    name = "Patricia Marshall",
    mapID = 23,
    x = 0.624, y = 0.423,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[47149] = {
    name = "Kathryn Humphries",
    mapID = 23,
    x = 0.538, y = 0.54,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[47166] = {
    name = "Dorris Manchester",
    mapID = 23,
    x = 0.509, y = 0.195,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[47712] = {
    name = "Harland Waldek",
    mapID = 25,
    x = 0.288, y = 0.64,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[48060] = {
    name = "\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"Chef\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" Overheat",
    mapID = 15,
    x = 0.65, y = 0.388,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[48064] = {
    name = "Milly Brewtap",
    mapID = 15,
    x = 0.644, y = 0.387,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[48096] = {
    name = "\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"Snake\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" Sanders",
    mapID = 15,
    x = 0.213, y = 0.58,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[49701] = {
    name = "Jon Casper",
    mapID = 84,
    x = 0.505, y = 0.739,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[49877] = {
    name = "Captain Lancy Revshon",
    mapID = 84,
    x = 0.676, y = 0.728,
    faction = "Alliance",
    types = { "transmog", "faction" },
    repFactionID = 72,
    minStanding = 3000,
}

VendorLocations[49918] = {
    name = "Buckslappy",
    mapID = 15,
    x = 0.91, y = 0.384,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[50305] = {
    name = "Moon Priestess Lasara",
    mapID = 84,
    x = 0.566, y = 0.132,
    faction = "Alliance",
    types = { "transmog", "faction" },
    repFactionID = 69,
    minStanding = 42000,
}

VendorLocations[50308] = {
    name = "Master Tinker Trini",
    mapID = 87,
    x = 0.558, y = 0.478,
    faction = "Alliance",
    types = { "transmog", "faction" },
    repFactionID = 54,
    minStanding = 42000,
}

VendorLocations[50309] = {
    name = "Captain Stonehelm",
    mapID = 87,
    x = 0.558, y = 0.478,
    faction = "Alliance",
    types = { "transmog", "faction" },
    repFactionID = 47,
    minStanding = 3000,
}

VendorLocations[50524] = {
    name = "Travis Nichols",
    mapID = 84,
    x = 0.694, y = 0.654,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[50669] = {
    name = "Dawn Radue",
    mapID = 84,
    x = 0.648, y = 0.716,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[51254] = {
    name = "Captain Dirgehammer",
    mapID = 84,
    x = 0.75, y = 0.674,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[51255] = {
    name = "Lieutenant Tristia",
    mapID = 84,
    x = 0.748, y = 0.676,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[52027] = {
    name = "Larisse Pembraux",
    mapID = 84,
    x = 0.794, y = 0.697,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[52029] = {
    name = "Edlan Halsing",
    mapID = 84,
    x = 0.747, y = 0.682,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[52030] = {
    name = "Liliana Emberfrost",
    mapID = 84,
    x = 0.744, y = 0.676,
    faction = "Alliance",
    types = { "food", "transmog" },
}

VendorLocations[52358] = {
    name = "Craggle Wobbletop",
    mapID = 84,
    x = 0.5631, y = 0.6845,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[52497] = {
    name = "Spanky",
    mapID = 37,
    x = 0.318, y = 0.5,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[52545] = {
    name = "Lieutenant Tristia",
    mapID = 84,
    x = 0.748, y = 0.676,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[52546] = {
    name = "Captain Dirgehammer",
    mapID = 84,
    x = 0.75, y = 0.674,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[52584] = {
    name = "Laida Gembold",
    mapID = 87,
    x = 0.506, y = 0.27,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[53641] = {
    name = "Allison Potts",
    mapID = 84,
    x = 0.648, y = 0.48,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[53702] = {
    name = "Stymie",
    mapID = 37,
    x = 0.319, y = 0.501,
    faction = "Alliance",
    types = { "food" },
    note = "ATT — Can only be used on party members of your faction.",
}

VendorLocations[53728] = {
    name = "Dorothy",
    mapID = 37,
    x = 0.318, y = 0.5,
    faction = "Alliance",
    types = { "food", "transmog" },
}

VendorLocations[53756] = {
    name = "Darla",
    mapID = 18,
    x = 0.622, y = 0.664,
    faction = "Horde",
    types = { "food" },
    note = "ATT — Can only be used on party members of your faction.",
}

VendorLocations[53757] = {
    name = "Chub",
    mapID = 18,
    x = 0.621, y = 0.664,
    faction = "Horde",
    types = { "food", "transmog" },
}

VendorLocations[53760] = {
    name = "Farina",
    mapID = 18,
    x = 0.623, y = 0.664,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[53991] = {
    name = "Quincy Cutler",
    mapID = 84,
    x = 0.64, y = 0.462,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[54660] = {
    name = "Lieutenant Tristia",
    mapID = 84,
    x = 0.75, y = 0.67,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[54661] = {
    name = "Captain Dirgehammer",
    mapID = 84,
    x = 0.75, y = 0.674,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[55285] = {
    name = "Astrid Langstrump",
    mapID = 84,
    x = 0.524, y = 0.082,
    faction = "Alliance",
    types = { "faction" },
    repFactionID = 1134,
    minStanding = 42000,
}

VendorLocations[55684] = {
    name = "Jordan Smith",
    mapID = 84,
    x = 0.648, y = 0.482,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[58154] = {
    name = "Toren Landow",
    mapID = 84,
    x = 0.757, y = 0.659,
    faction = "Alliance",
    types = { "transmog" },
    note = "ATT — Sells gear related to Cataclysm raid tier 11 (Throne of the Four Winds, Blackwing Descent, and Bastion of Twilight) as w",
}

VendorLocations[65068] = {
    name = "Old Whitenose",
    mapID = 84,
    x = 0.678, y = 0.184,
    faction = "Alliance",
    types = { "faction" },
    repFactionID = 1353,
    minStanding = 42000,
}

VendorLocations[69334] = {
    name = "Adherent Hanjun",
    mapID = 84,
    x = 0.68, y = 0.17,
    faction = "Alliance",
    types = { "transmog", "faction" },
    repFactionID = 1353,
    minStanding = 21000,
}

VendorLocations[69974] = {
    name = "Knight-Lieutenant T'Maire Sydes",
    mapID = 84,
    x = 0.748, y = 0.676,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[69975] = {
    name = "Captain Dirgehammer",
    mapID = 84,
    x = 0.75, y = 0.675,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[76117] = {
    name = "Quartermaster Rindelle",
    mapID = 17,
    x = 0.664, y = 0.276,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[76522] = {
    name = "Zerpy Clampshock",
    mapID = 17,
    x = 0.715, y = 0.491,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[87501] = {
    name = "Paulie",
    mapID = 84,
    x = 0.73, y = 0.595,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[109685] = {
    name = "Pippi",
    mapID = 37,
    x = 0.319, y = 0.502,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[109688] = {
    name = "Woim",
    mapID = 18,
    x = 0.623, y = 0.664,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[109912] = {
    name = "Captive Wyrmtongue",
    mapID = 84,
    x = 0.412, y = 0.788,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[110034] = {
    name = "Historian Llore",
    mapID = 84,
    x = 0.846, y = 0.25,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[113404] = {
    name = "Illidari Darkdealer",
    mapID = 84,
    x = 0.402, y = 0.786,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[115805] = {
    name = "Hoddruc Bladebender",
    mapID = 36,
    x = 0.469, y = 0.446,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[133411] = {
    name = "Dalia Skyblossom",
    mapID = 84,
    x = 0.514, y = 0.18,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[150904] = {
    name = "Melvin Shirtson",
    mapID = 23,
    x = 0.743, y = 0.53,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[152829] = {
    name = "Arcti",
    mapID = 27,
    x = 0.554, y = 0.383,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[152849] = {
    name = "Vinter Tysiel",
    mapID = 27,
    x = 0.551, y = 0.375,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[152871] = {
    name = "Brewer Gerrat",
    mapID = 27,
    x = 0.565, y = 0.375,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[152941] = {
    name = "Verra Fireblood",
    mapID = 27,
    x = 0.562, y = 0.378,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[153574] = {
    name = "Britta Steinheart",
    mapID = 27,
    x = 0.548, y = 0.386,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[158385] = {
    name = "Time-Displaced Thanthaldis Snowgleam",
    mapID = 25,
    x = 0.447, y = 0.464,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[158386] = {
    name = "Time-Displaced Jorek Ironside",
    mapID = 25,
    x = 0.581, y = 0.336,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[164942] = {
    name = "Evelyn Thorn",
    mapID = 84,
    x = 0.794, y = 0.698,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[164947] = {
    name = "Gerald Black",
    mapID = 84,
    x = 0.788, y = 0.706,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[165839] = {
    name = "Quartermaster Renick",
    mapID = 84,
    x = 0.654, y = 0.768,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[167429] = {
    name = "Quartermaster Richter",
    mapID = 84,
    x = 0.795, y = 0.69,
    faction = "Alliance",
    types = { "transmog" },
    note = "ATT — Only sells items once the achievement |cffebae34Exile's Reach|r [14222] is completed.",
}

VendorLocations[179896] = {
    name = "Finn",
    mapID = 84,
    x = 0.616, y = 0.658,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[211810] = {
    name = "Ronathan Graham",
    mapID = 37,
    x = 0.336, y = 0.498,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[211812] = {
    name = "Kiera Torres",
    mapID = 37,
    x = 0.322, y = 0.504,
    faction = "Alliance",
    types = { "food", "transmog" },
}

VendorLocations[211864] = {
    name = "Maurice Guichi",
    mapID = 37,
    x = 0.336, y = 0.498,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[211873] = {
    name = "Bang Sparknozzle",
    mapID = 37,
    x = 0.336, y = 0.478,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[211887] = {
    name = "Sylandra Silverbreeze",
    mapID = 37,
    x = 0.342, y = 0.488,
    faction = "Alliance",
    types = { "food", "transmog" },
}

VendorLocations[212027] = {
    name = "Dathendrash",
    mapID = 84,
    x = 0.598, y = 0.662,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[212587] = {
    name = "Wobbley Sugarfizz",
    mapID = 37,
    x = 0.335, y = 0.501,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[212886] = {
    name = "Melanie Charles",
    mapID = 37,
    x = 0.342, y = 0.506,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[213094] = {
    name = "Bimble Longberry",
    mapID = 37,
    x = 0.337, y = 0.513,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[214493] = {
    name = "Ming Plumpaw",
    mapID = 37,
    x = 0.3357, y = 0.509,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[234297] = {
    name = "Wodin the Troll-Servant",
    mapID = 84,
    x = 0.672, y = 0.81,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[234555] = {
    name = "Bobadormu",
    mapID = 84,
    x = 0.56, y = 0.19,
    faction = "Alliance",
    types = { "food", "transmog" },
}

VendorLocations[240486] = {
    name = "Jixy Wobblebolt",
    mapID = 27,
    x = 0.563, y = 0.367,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[240493] = {
    name = "Brina Bearclaw",
    mapID = 27,
    x = 0.562, y = 0.365,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[240534] = {
    name = "Thalira Shadowlace",
    mapID = 27,
    x = 0.563, y = 0.364,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[242651] = {
    name = "Brundia Braidhammer",
    mapID = 84,
    x = 0.58, y = 0.568,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[252312] = {
    name = "Second Chair Pawdo",
    mapID = 84,
    x = 0.561, y = 0.771,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[253232] = {
    name = "Inge Brightview",
    mapID = 87,
    x = 0.754, y = 0.096,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[253235] = {
    name = "Dedric Sleetshaper",
    mapID = 87,
    x = 0.238, y = 0.452,
    faction = "Alliance",
    types = { "faction" },
    repFactionID = 47,
    minStanding = 3000,
}

VendorLocations[254603] = {
    name = "Riica",
    mapID = 84,
    x = 0.778, y = 0.657,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[256071] = {
    name = "Solelo",
    mapID = 84,
    x = 0.494, y = 0.808,
    faction = "Alliance",
    types = { "general" },
    note = "ATT — Not all items are sold each day.",
}

VendorLocations[261231] = {
    name = "Tuuran",
    mapID = 84,
    x = 0.485, y = 0.588,
    faction = "Alliance",
    types = { "general" },
}

------------------------------------------------------------------
-- Kalimdor (incl. Cataclysm revamp)
------------------------------------------------------------------

VendorLocations[1383] = {
    name = "Snarl",
    mapID = 85,
    x = 0.7616, y = 0.3496,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[2303] = {
    name = "Lyranne Feathersong",
    mapID = 83,
    x = 0.52, y = 0.292,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[2803] = {
    name = "Malygen",
    mapID = 77,
    x = 0.612, y = 0.268,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[2806] = {
    name = "Bale",
    mapID = 77,
    x = 0.348, y = 0.532,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[2997] = {
    name = "Jyn Stonehoof",
    mapID = 88,
    x = 0.4111, y = 0.6218,
    faction = "Horde",
    types = { "repair" },
}

VendorLocations[2998] = {
    name = "Karn Stonehoof",
    mapID = 88,
    x = 0.3934, y = 0.5491,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[2999] = {
    name = "Taur Stonehoof",
    mapID = 88,
    x = 0.3982, y = 0.5536,
    faction = "Horde",
    types = { "repair", "reagents", "profession" },
}

VendorLocations[3001] = {
    name = "Brek Stonehoof",
    mapID = 88,
    x = 0.3451, y = 0.5764,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[3002] = {
    name = "Kurm Stonehoof",
    mapID = 88,
    x = 0.3452, y = 0.5686,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[3003] = {
    name = "Fyr Mistrunner",
    mapID = 88,
    x = 0.415, y = 0.5347,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[3005] = {
    name = "Mahu",
    mapID = 88,
    x = 0.438, y = 0.451,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3008] = {
    name = "Mak",
    mapID = 88,
    x = 0.4208, y = 0.4346,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3009] = {
    name = "Bena Winterhoof",
    mapID = 88,
    x = 0.4675, y = 0.3342,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[3010] = {
    name = "Mani Winterhoof",
    mapID = 88,
    x = 0.4724, y = 0.3371,
    faction = "Horde",
    types = { "reagents", "profession" },
}

VendorLocations[3011] = {
    name = "Teg Dawnstrider",
    mapID = 88,
    x = 0.4537, y = 0.3849,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[3012] = {
    name = "Nata Dawnstrider",
    mapID = 88,
    x = 0.4503, y = 0.382,
    faction = "Horde",
    types = { "reagents", "profession" },
}

VendorLocations[3015] = {
    name = "Kuna Thunderhorn",
    mapID = 88,
    x = 0.4687, y = 0.4582,
    faction = "Horde",
    types = { "repair", "transmog", "profession" },
}

VendorLocations[3016] = {
    name = "Tand",
    mapID = 88,
    x = 0.491, y = 0.342,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3017] = {
    name = "Nan Mistrunner",
    mapID = 88,
    x = 0.473, y = 0.424,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[3018] = {
    name = "Hogor Thunderhoof",
    mapID = 88,
    x = 0.5551, y = 0.5668,
    faction = "Horde",
    types = { "repair" },
}

VendorLocations[3019] = {
    name = "Delgo Ragetotem",
    mapID = 88,
    x = 0.5379, y = 0.5711,
    faction = "Horde",
    types = { "repair", "general" },
    note = "... and my axe!",
}

VendorLocations[3020] = {
    name = "Etu Ragetotem",
    mapID = 88,
    x = 0.5328, y = 0.5808,
    faction = "Horde",
    types = { "repair" },
}

VendorLocations[3021] = {
    name = "Kard Ragetotem",
    mapID = 88,
    x = 0.5314, y = 0.5688,
    faction = "Horde",
    types = { "repair" },
}

VendorLocations[3022] = {
    name = "Sunn Ragetotem",
    mapID = 88,
    x = 0.4961, y = 0.4925,
    faction = "Horde",
    types = { "repair" },
}

VendorLocations[3023] = {
    name = "Sura Wildmane",
    mapID = 88,
    x = 0.5184, y = 0.5463,
    faction = "Horde",
    types = { "repair" },
}

VendorLocations[3025] = {
    name = "Kaga Mistrunner",
    mapID = 88,
    x = 0.5249, y = 0.4835,
    faction = "Horde",
    types = { "general" },
    note = "Kaga - She's got the meats!",
}

VendorLocations[3026] = {
    name = "Aska Mistrunner",
    mapID = 88,
    x = 0.5102, y = 0.5292,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[3027] = {
    name = "Naal Mistrunner",
    mapID = 88,
    x = 0.5123, y = 0.5242,
    faction = "Horde",
    types = { "reagents", "profession" },
}

VendorLocations[3028] = {
    name = "Kah Mistrunner",
    mapID = 88,
    x = 0.5599, y = 0.4675,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[3029] = {
    name = "Sewa Mistrunner",
    mapID = 88,
    x = 0.5568, y = 0.4736,
    faction = "Horde",
    types = { "profession" },
    note = "Smells a bit like salmon..",
}

VendorLocations[3052] = {
    name = "Skorn Whitecloud",
    mapID = 7,
    x = 0.4967, y = 0.1726,
    faction = "Horde",
    types = { "repair" },
}

VendorLocations[3081] = {
    name = "Wunna Darkmane",
    mapID = 7,
    x = 0.464, y = 0.578,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3084] = {
    name = "Bluffwatcher",
    mapID = 88,
    x = 0.37, y = 0.5121,
    faction = "Horde",
    types = { "stable" },
}

VendorLocations[3092] = {
    name = "Tagain",
    mapID = 88,
    x = 0.434, y = 0.438,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[3093] = {
    name = "Grod",
    mapID = 88,
    x = 0.424, y = 0.432,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3095] = {
    name = "Fela",
    mapID = 88,
    x = 0.428, y = 0.446,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3314] = {
    name = "Urtharo",
    mapID = 85,
    x = 0.466, y = 0.731,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[3315] = {
    name = "Tor'phan",
    mapID = 85,
    x = 0.608, y = 0.596,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[3316] = {
    name = "Handor",
    mapID = 85,
    x = 0.608, y = 0.54,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[3317] = {
    name = "Ollanus",
    mapID = 85,
    x = 0.606, y = 0.586,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[3319] = {
    name = "Sana",
    mapID = 85,
    x = 0.456, y = 0.778,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[3321] = {
    name = "Morgum",
    mapID = 85,
    x = 0.6, y = 0.556,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[3322] = {
    name = "Kaja",
    mapID = 85,
    x = 0.408, y = 0.496,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[3330] = {
    name = "Muragus",
    mapID = 85,
    x = 0.46, y = 0.578,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[3331] = {
    name = "Kareth",
    mapID = 85,
    x = 0.468, y = 0.636,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3332] = {
    name = "Lumak",
    mapID = 85,
    x = 0.6658, y = 0.4188,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[3333] = {
    name = "Shankys",
    mapID = 85,
    x = 0.6664, y = 0.4172,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[3334] = {
    name = "Rekkul",
    mapID = 85,
    x = 0.44, y = 0.584,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[3335] = {
    name = "Hagrus",
    mapID = 86,
    x = 0.456, y = 0.39,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3346] = {
    name = "Kithas",
    mapID = 85,
    x = 0.532, y = 0.488,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3348] = {
    name = "Kor'geld",
    mapID = 85,
    x = 0.556, y = 0.454,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3355] = {
    name = "Saru Steelfury",
    mapID = 85,
    x = 0.7635, y = 0.3451,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[3356] = {
    name = "Sumi",
    mapID = 85,
    x = 0.759, y = 0.3521,
    faction = "Horde",
    types = { "repair", "reagents", "profession" },
}

VendorLocations[3357] = {
    name = "Makaru",
    mapID = 85,
    x = 0.7238, y = 0.3487,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[3358] = {
    name = "Gorina",
    mapID = 85,
    x = 0.7252, y = 0.3469,
    faction = "Horde",
    types = { "reagents", "profession" },
}

VendorLocations[3359] = {
    name = "Kiro",
    mapID = 85,
    x = 0.6693, y = 0.5053,
    faction = "Horde",
    types = { "repair" },
}

VendorLocations[3360] = {
    name = "Koru",
    mapID = 85,
    x = 0.7634, y = 0.3764,
    faction = "Horde",
    types = { "repair" },
}

VendorLocations[3361] = {
    name = "Shoma",
    mapID = 85,
    x = 0.7602, y = 0.379,
    faction = "Horde",
    types = { "repair" },
}

VendorLocations[3362] = {
    name = "Ogunaro Wolfrunner",
    mapID = 85,
    x = 0.616, y = 0.356,
    faction = "Horde",
    types = { "faction" },
    repFactionID = 76,
    minStanding = 42000,
}

VendorLocations[3364] = {
    name = "Borya",
    mapID = 85,
    x = 0.606, y = 0.586,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3366] = {
    name = "Tamar",
    mapID = 85,
    x = 0.606, y = 0.544,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3367] = {
    name = "Felika",
    mapID = 85,
    x = 0.484, y = 0.478,
    faction = "Horde",
    types = { "general" },
    note = "ATT — This NPC walks between the Valley of Wisdom and Valley of Strength on the right path.",
}

VendorLocations[3392] = {
    name = "Prospector Khazgorm",
    mapID = 10,
    x = 0.478, y = 0.856,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[3400] = {
    name = "Xen'to",
    mapID = 85,
    x = 0.326, y = 0.686,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3405] = {
    name = "Zeal'aya",
    mapID = 85,
    x = 0.55, y = 0.396,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3409] = {
    name = "Zendo'jian",
    mapID = 85,
    x = 0.7503, y = 0.3634,
    faction = "Horde",
    types = { "repair", "profession" },
}

VendorLocations[3410] = {
    name = "Jin'sora",
    mapID = 85,
    x = 0.778, y = 0.386,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[3413] = {
    name = "Sovik",
    mapID = 85,
    x = 0.56, y = 0.56,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3443] = {
    name = "Grub",
    mapID = 10,
    x = 0.554, y = 0.612,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3479] = {
    name = "Nargal Deatheye",
    mapID = 10,
    x = 0.482, y = 0.566,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[3482] = {
    name = "Tari'qa",
    mapID = 10,
    x = 0.49, y = 0.582,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3485] = {
    name = "Wrahk",
    mapID = 10,
    x = 0.5, y = 0.61,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3486] = {
    name = "Halija Whitestrider",
    mapID = 10,
    x = 0.5, y = 0.614,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[3488] = {
    name = "Uthrok",
    mapID = 10,
    x = 0.48, y = 0.564,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[3489] = {
    name = "Zargh",
    mapID = 10,
    x = 0.506, y = 0.578,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3490] = {
    name = "Hula'mahi",
    mapID = 10,
    x = 0.486, y = 0.584,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3492] = {
    name = "Vexspindle",
    mapID = 10,
    x = 0.674, y = 0.728,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[3493] = {
    name = "Grazlix",
    mapID = 10,
    x = 0.676, y = 0.729,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[3495] = {
    name = "Gagsprocket",
    mapID = 10,
    x = 0.684, y = 0.692,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3497] = {
    name = "Kilxx",
    mapID = 10,
    x = 0.686, y = 0.726,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[3499] = {
    name = "Ranik",
    mapID = 10,
    x = 0.67, y = 0.734,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3561] = {
    name = "Kyrai",
    mapID = 89,
    x = 0.388, y = 0.354,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[3621] = {
    name = "Kurll",
    mapID = 76,
    x = 0.218, y = 0.52,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3658] = {
    name = "Lizzarik",
    mapID = 10,
    x = 0.502, y = 0.592,
    faction = "Horde",
    types = { "transmog" },
    note = "ATT — Travels on the road between Ratchet and The Crossroads.",
}

VendorLocations[3682] = {
    name = "Vrang Wildgore",
    mapID = 10,
    x = 0.35, y = 0.268,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[3683] = {
    name = "Kiknikle",
    mapID = 10,
    x = 0.418, y = 0.386,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[3684] = {
    name = "Pizznukle",
    mapID = 10,
    x = 0.418, y = 0.386,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[3685] = {
    name = "Harb Clawhoof",
    mapID = 7,
    x = 0.476, y = 0.58,
    faction = "Horde",
    types = { "faction" },
    repFactionID = 81,
    minStanding = 42000,
}

VendorLocations[3881] = {
    name = "Grimtak",
    mapID = 1,
    x = 0.508, y = 0.428,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[3951] = {
    name = "Bhaldaran Ravenshade",
    mapID = 63,
    x = 0.346, y = 0.712,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[3954] = {
    name = "Dalria",
    mapID = 63,
    x = 0.351, y = 0.521,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[3955] = {
    name = "Shandrina",
    mapID = 63,
    x = 0.504, y = 0.656,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[3956] = {
    name = "Harklan Moongrove",
    mapID = 63,
    x = 0.5, y = 0.656,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[3958] = {
    name = "Lardan",
    mapID = 63,
    x = 0.348, y = 0.498,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[3960] = {
    name = "Ulthaan",
    mapID = 63,
    x = 0.486, y = 0.64,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[4043] = {
    name = "Galthuk",
    mapID = 85,
    x = 0.7615, y = 0.3702,
    faction = "Horde",
    types = { "repair", "profession" },
}

VendorLocations[4083] = {
    name = "Jeeda",
    mapID = 65,
    x = 0.504, y = 0.634,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4085] = {
    name = "Nizzik",
    mapID = 65,
    x = 0.626, y = 0.402,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4086] = {
    name = "Veenix",
    mapID = 65,
    x = 0.582, y = 0.516,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4164] = {
    name = "Cylania",
    mapID = 89,
    x = 0.568, y = 0.536,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[4168] = {
    name = "Elynna",
    mapID = 89,
    x = 0.604, y = 0.368,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[4171] = {
    name = "Merelyssa",
    mapID = 89,
    x = 0.616, y = 0.638,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[4172] = {
    name = "Anadyia",
    mapID = 89,
    x = 0.546, y = 0.836,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[4173] = {
    name = "Landria",
    mapID = 89,
    x = 0.596, y = 0.676,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[4175] = {
    name = "Vinasia",
    mapID = 89,
    x = 0.579, y = 0.718,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[4177] = {
    name = "Melea",
    mapID = 89,
    x = 0.556, y = 0.75,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[4180] = {
    name = "Ealyshia Dewwhisper",
    mapID = 89,
    x = 0.578, y = 0.716,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[4184] = {
    name = "Geenia Sunshadow",
    mapID = 80,
    x = 0.5189, y = 0.3303,
    faction = "Horde",
    types = { "repair", "transmog", "profession" },
}

VendorLocations[4186] = {
    name = "Mavralyn",
    mapID = 62,
    x = 0.37, y = 0.412,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[4189] = {
    name = "Valdaron",
    mapID = 62,
    x = 0.381, y = 0.406,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[4200] = {
    name = "Laird",
    mapID = 62,
    x = 0.368, y = 0.443,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[4203] = {
    name = "Ariyell Skyshadow",
    mapID = 89,
    x = 0.566, y = 0.528,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[4216] = {
    name = "Chardryn",
    mapID = 89,
    x = 0.4955, y = 0.6944,
    faction = "Alliance",
    types = { "general" },
    note = "ATT — Only select Herbalism Suppliers sells this pouch.",
}

VendorLocations[4223] = {
    name = "Fyldan",
    mapID = 89,
    x = 0.496, y = 0.366,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[4225] = {
    name = "Saenorion",
    mapID = 89,
    x = 0.6, y = 0.372,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[4226] = {
    name = "Ulthir",
    mapID = 89,
    x = 0.546, y = 0.396,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[4228] = {
    name = "Vaean",
    mapID = 89,
    x = 0.565, y = 0.322,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[4229] = {
    name = "Mythrin'dir",
    mapID = 89,
    x = 0.582, y = 0.35,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[4231] = {
    name = "Kieran",
    mapID = 89,
    x = 0.61, y = 0.636,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[4232] = {
    name = "Glorandiir",
    mapID = 89,
    x = 0.602, y = 0.626,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[4233] = {
    name = "Mythidan",
    mapID = 89,
    x = 0.604, y = 0.634,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[4234] = {
    name = "Andrus",
    mapID = 89,
    x = 0.546, y = 0.832,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[4235] = {
    name = "Turian",
    mapID = 89,
    x = 0.596, y = 0.674,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[4236] = {
    name = "Cyridan",
    mapID = 89,
    x = 0.526, y = 0.77,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[4240] = {
    name = "Caynrus",
    mapID = 89,
    x = 0.554, y = 0.746,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[4265] = {
    name = "Nyoma",
    mapID = 57,
    x = 0.567, y = 0.535,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[4307] = {
    name = "Heldan Galesong",
    mapID = 62,
    x = 0.37, y = 0.564,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[4877] = {
    name = "Jandia",
    mapID = 64,
    x = 0.46, y = 0.516,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4879] = {
    name = "Ogg'marr",
    mapID = 70,
    x = 0.366, y = 0.31,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[4884] = {
    name = "Zulrg",
    mapID = 70,
    x = 0.362, y = 0.316,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[4885] = {
    name = "Gregor MacVince",
    mapID = 70,
    x = 0.652, y = 0.514,
    faction = "Alliance",
    types = { "faction" },
    repFactionID = 72,
    minStanding = 42000,
}

VendorLocations[4886] = {
    name = "Hans Weston",
    mapID = 70,
    x = 0.646, y = 0.504,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[4890] = {
    name = "Piter Verance",
    mapID = 70,
    x = 0.674, y = 0.479,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[4892] = {
    name = "Jensen Farran",
    mapID = 70,
    x = 0.678, y = 0.498,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[4894] = {
    name = "Craig Nollward",
    mapID = 70,
    x = 0.668, y = 0.452,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[4897] = {
    name = "Helenia Olden",
    mapID = 70,
    x = 0.664, y = 0.514,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5188] = {
    name = "Garyl",
    mapID = 85,
    x = 0.464, y = 0.794,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[5189] = {
    name = "Thrumn",
    mapID = 88,
    x = 0.38, y = 0.63,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[5191] = {
    name = "Shalumon",
    mapID = 89,
    x = 0.646, y = 0.378,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[5411] = {
    name = "Krinkle Goodsteel",
    mapID = 71,
    x = 0.512, y = 0.302,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[5594] = {
    name = "Alchemist Pestlezugg",
    mapID = 71,
    x = 0.508, y = 0.28,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[5611] = {
    name = "Barkeep Morag",
    mapID = 85,
    x = 0.551, y = 0.779,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[5783] = {
    name = "Kalldan Felmoon",
    mapID = 10,
    x = 0.459, y = 0.357,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[5812] = {
    name = "Tumi",
    mapID = 85,
    x = 0.758, y = 0.352,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[5816] = {
    name = "Katis",
    mapID = 85,
    x = 0.458, y = 0.576,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[5817] = {
    name = "Shimra",
    mapID = 85,
    x = 0.54, y = 0.8187,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[5940] = {
    name = "Harn Longcast",
    mapID = 7,
    x = 0.476, y = 0.548,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[5942] = {
    name = "Zansoa",
    mapID = 1,
    x = 0.574, y = 0.77,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[6567] = {
    name = "Ghok'kah",
    mapID = 70,
    x = 0.352, y = 0.308,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[6568] = {
    name = "Vizzklick",
    mapID = 71,
    x = 0.506, y = 0.286,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[6731] = {
    name = "Harlown Darkweave",
    mapID = 63,
    x = 0.182, y = 0.6,
    faction = "Alliance",
    types = { "general" },
    note = "ATT — Vendor will only sell to those who have rescued him. Go to Benjari Edune and pick up the quest |cFFFFD700Three Friends o",
}

VendorLocations[6735] = {
    name = "Innkeeper Saelienne",
    mapID = 89,
    x = 0.625, y = 0.328,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[7230] = {
    name = "Shayis Steelfury",
    mapID = 85,
    x = 0.7597, y = 0.3738,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[7231] = {
    name = "Kelgruk Bloodaxe",
    mapID = 85,
    x = 0.7624, y = 0.3718,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[7733] = {
    name = "Innkeeper Fizzgrimble",
    mapID = 71,
    x = 0.526, y = 0.27,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[7852] = {
    name = "Pratt McGrubben",
    mapID = 69,
    x = 0.306, y = 0.426,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[7854] = {
    name = "Jangdor Swiftstrider",
    mapID = 69,
    x = 0.528, y = 0.47,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[7940] = {
    name = "Darnall",
    mapID = 80,
    x = 0.5158, y = 0.3321,
    faction = "Horde",
    types = { "reagents", "profession" },
}

VendorLocations[7947] = {
    name = "Vivianna",
    mapID = 69,
    x = 0.463, y = 0.417,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[7952] = {
    name = "Zjolnir",
    mapID = 1,
    x = 0.552, y = 0.756,
    faction = "Horde",
    types = { "faction" },
    repFactionID = 530,
    minStanding = 42000,
}

VendorLocations[8122] = {
    name = "Kizzak Sparks",
    mapID = 85,
    x = 0.578, y = 0.566,
    faction = "Horde",
    types = { "transmog" },
    note = "ATT — This NPC is only available on July 4th.",
}

VendorLocations[8125] = {
    name = "Dirge Quikcleave",
    mapID = 71,
    x = 0.526, y = 0.28,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[8131] = {
    name = "Blizrik Buckshot",
    mapID = 71,
    x = 0.506, y = 0.286,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[8137] = {
    name = "Gikkix",
    mapID = 71,
    x = 0.666, y = 0.221,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[8139] = {
    name = "Jabbey",
    mapID = 71,
    x = 0.67, y = 0.22,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[8145] = {
    name = "Sheendra Tallgrass",
    mapID = 69,
    x = 0.746, y = 0.428,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[8150] = {
    name = "Janet Hommers",
    mapID = 66,
    x = 0.662, y = 0.066,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[8157] = {
    name = "Logannas",
    mapID = 69,
    x = 0.466, y = 0.43,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[8158] = {
    name = "Bronk",
    mapID = 69,
    x = 0.76, y = 0.434,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[8159] = {
    name = "Worb Strongstitch",
    mapID = 69,
    x = 0.746, y = 0.426,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[8307] = {
    name = "Tarban Hearthgrain",
    mapID = 10,
    x = 0.55, y = 0.616,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[8358] = {
    name = "Hewa",
    mapID = 88,
    x = 0.456, y = 0.567,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[8359] = {
    name = "Ahanu",
    mapID = 88,
    x = 0.456, y = 0.558,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[8360] = {
    name = "Elki",
    mapID = 88,
    x = 0.452, y = 0.566,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[8361] = {
    name = "Chepi",
    mapID = 88,
    x = 0.4277, y = 0.5657,
    faction = "Horde",
    types = { "reagents" },
}

VendorLocations[8362] = {
    name = "Kuruk",
    mapID = 88,
    x = 0.3897, y = 0.6431,
    faction = "Horde",
    types = { "reagents", "profession" },
}

VendorLocations[8363] = {
    name = "Shadi Mistrunner",
    mapID = 88,
    x = 0.4022, y = 0.6309,
    faction = "Horde",
    types = { "reagents", "profession" },
}

VendorLocations[8364] = {
    name = "Pakwa",
    mapID = 88,
    x = 0.3938, y = 0.6394,
    faction = "Horde",
    types = { "general" },
    note = "Bag Vendor",
}

VendorLocations[8398] = {
    name = "Ohanko",
    mapID = 88,
    x = 0.5301, y = 0.576,
    faction = "Horde",
    types = { "repair" },
}

VendorLocations[8401] = {
    name = "Halpa",
    mapID = 88,
    x = 0.6238, y = 0.5863,
    faction = "Horde",
    types = { "profession" },
    note = "Sells prairie dog whistle (pet summon)",
}

VendorLocations[8404] = {
    name = "Xan'tish",
    mapID = 85,
    x = 0.34, y = 0.676,
    faction = "Horde",
    types = { "general" },
    note = "ATT — This NPC walks around in a circle in the Valley of Spirits.",
}

VendorLocations[8674] = {
    name = "Auctioneer Stampi",
    mapID = 88,
    x = 0.4044, y = 0.5189,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[8678] = {
    name = "Jubie Gadgetspring",
    mapID = 76,
    x = 0.452, y = 0.908,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[8722] = {
    name = "Auctioneer Gullem",
    mapID = 88,
    x = 0.3884, y = 0.5048,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[8878] = {
    name = "Muuran",
    mapID = 66,
    x = 0.556, y = 0.566,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[9548] = {
    name = "Cawind Trueaim",
    mapID = 69,
    x = 0.748, y = 0.456,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[9549] = {
    name = "Borand",
    mapID = 65,
    x = 0.486, y = 0.614,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[9552] = {
    name = "Zanara",
    mapID = 70,
    x = 0.356, y = 0.302,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[9636] = {
    name = "Kireena",
    mapID = 66,
    x = 0.51, y = 0.534,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[9985] = {
    name = "Laziphus",
    mapID = 71,
    x = 0.5267, y = 0.2732,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[10118] = {
    name = "Nessa Shadowsong",
    mapID = 57,
    x = 0.54, y = 0.9,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[10266] = {
    name = "Ug'thok",
    mapID = 85,
    x = 0.7634, y = 0.341,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[10278] = {
    name = "Thrag Stonehoof",
    mapID = 88,
    x = 0.3925, y = 0.5647,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[10618] = {
    name = "Rivern Frostwind",
    mapID = 83,
    x = 0.466, y = 0.176,
    faction = "Alliance",
    types = { "faction" },
    repFactionID = 589,
    minStanding = 42000,
}

VendorLocations[11047] = {
    name = "Kray",
    mapID = 88,
    x = 0.4697, y = 0.3441,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[11071] = {
    name = "Mot Dawnstrider",
    mapID = 88,
    x = 0.4481, y = 0.3915,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[11177] = {
    name = "Okothos Ironrager",
    mapID = 85,
    x = 0.7549, y = 0.341,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[11178] = {
    name = "Borgosh Corebender",
    mapID = 85,
    x = 0.7592, y = 0.3376,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[11184] = {
    name = "Wixxrak",
    mapID = 83,
    x = 0.602, y = 0.502,
    faction = "Alliance",
    types = { "profession" },
    note = "ATT — Must have completed the quest 'Blackrock Depths: Jewel of the Depths' before he'll sell you the plans.",
}

VendorLocations[11185] = {
    name = "Xizzer Fizzbolt",
    mapID = 83,
    x = 0.592, y = 0.508,
    faction = "Alliance",
    types = { "general" },
    note = "ATT — Available for purchase after you complete |cFFFFD700Yetiphobia|r quest.",
}

VendorLocations[11187] = {
    name = "Himmik",
    mapID = 83,
    x = 0.598, y = 0.516,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[11188] = {
    name = "Evie Whirlbrew",
    mapID = 83,
    x = 0.592, y = 0.5,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[11189] = {
    name = "Qia",
    mapID = 83,
    x = 0.596, y = 0.492,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[11555] = {
    name = "Gorn One Eye",
    mapID = 77,
    x = 0.644, y = 0.051,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 576,
    minStanding = 9000,
}

VendorLocations[11557] = {
    name = "Meilosh",
    mapID = 77,
    x = 0.648, y = 0.052,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 576,
    minStanding = 3000,
}

VendorLocations[12019] = {
    name = "Dargon",
    mapID = 80,
    x = 0.4868, y = 0.3915,
    faction = "Horde",
    types = { "reagents", "profession" },
}

VendorLocations[12022] = {
    name = "Lorelae Wintersong",
    mapID = 80,
    x = 0.4831, y = 0.401,
    faction = "Horde",
    types = { "reagents", "profession" },
}

VendorLocations[12023] = {
    name = "Kharedon",
    mapID = 80,
    x = 0.5654, y = 0.3,
    faction = "Horde",
    types = { "repair", "transmog", "profession" },
}

VendorLocations[12024] = {
    name = "Meliri",
    mapID = 80,
    x = 0.5132, y = 0.4243,
    faction = "Horde",
    types = { "repair", "transmog", "profession" },
}

VendorLocations[12025] = {
    name = "Malvor",
    mapID = 80,
    x = 0.4549, y = 0.4704,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[12029] = {
    name = "Narianna",
    mapID = 80,
    x = 0.5331, y = 0.4277,
    faction = "Horde",
    types = { "repair", "transmog", "profession" },
}

VendorLocations[12033] = {
    name = "Wulan",
    mapID = 66,
    x = 0.262, y = 0.698,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[12042] = {
    name = "Loganaar",
    mapID = 80,
    x = 0.5247, y = 0.4044,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[12043] = {
    name = "Kulwia",
    mapID = 65,
    x = 0.486, y = 0.616,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[12045] = {
    name = "Hae'Wilani",
    mapID = 66,
    x = 0.256, y = 0.708,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[12245] = {
    name = "Vendor-Tron 1000",
    mapID = 66,
    x = 0.602, y = 0.38,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[12246] = {
    name = "Super-Seller 680",
    mapID = 66,
    x = 0.406, y = 0.792,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[12793] = {
    name = "Brave Stonehide",
    mapID = 85,
    x = 0.382, y = 0.726,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[12794] = {
    name = "Stone Guard Zarg",
    mapID = 85,
    x = 0.386, y = 0.728,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[12795] = {
    name = "First Sergeant Hola'mahi",
    mapID = 85,
    x = 0.382, y = 0.726,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[12796] = {
    name = "Raider Bork",
    mapID = 85,
    x = 0.418, y = 0.726,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[12956] = {
    name = "Zannok Hidepiercer",
    mapID = 81,
    x = 0.812, y = 0.186,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[12957] = {
    name = "Blimo Gadgetspring",
    mapID = 76,
    x = 0.452, y = 0.908,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[12959] = {
    name = "Nergal",
    mapID = 78,
    x = 0.548, y = 0.626,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[12962] = {
    name = "Wik'Tar",
    mapID = 63,
    x = 0.108, y = 0.338,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[13420] = {
    name = "Penney Copperpinch",
    mapID = 85,
    x = 0.526, y = 0.776,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[13432] = {
    name = "Seersa Copperpinch",
    mapID = 88,
    x = 0.426, y = 0.56,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[14301] = {
    name = "Brinna Valanaar",
    mapID = 76,
    x = 0.12, y = 0.784,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[14522] = {
    name = "Ur'dan",
    mapID = 77,
    x = 0.362, y = 0.446,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[14637] = {
    name = "Zorbin Fandazzle",
    mapID = 69,
    x = 0.486, y = 0.448,
    faction = "Alliance",
    types = { "general" },
    note = "ATT — Must complete quests |cFFFFD700Still With The Zapped Giants|r and |cFFFFD700Even More Fuel For The Zapping|r before he w",
}

VendorLocations[14742] = {
    name = "Zap Farflinger",
    mapID = 83,
    x = 0.596, y = 0.498,
    faction = "Alliance",
    types = { "general" },
    note = "ATT — Goblin Engineers can speak to Zap to learn the recipe.",
}

VendorLocations[14743] = {
    name = "Jhordy Lapforge",
    mapID = 71,
    x = 0.522, y = 0.278,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — Gnomish Engineers can speak to Jhordy to learn the recipe.",
}

VendorLocations[14753] = {
    name = "Illiyana Moonblaze",
    mapID = 63,
    x = 0.615, y = 0.839,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[14754] = {
    name = "Kelm Hargunth",
    mapID = 10,
    x = 0.402, y = 0.2,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[15165] = {
    name = "Haughty Modiste",
    mapID = 71,
    x = 0.666, y = 0.222,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[15174] = {
    name = "Calandrath",
    mapID = 81,
    x = 0.555, y = 0.368,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[15175] = {
    name = "Khur Hornstriker",
    mapID = 81,
    x = 0.528, y = 0.348,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[15176] = {
    name = "Vargus",
    mapID = 81,
    x = 0.55, y = 0.365,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 609,
    minStanding = 3000,
}

VendorLocations[15179] = {
    name = "Mishta",
    mapID = 81,
    x = 0.538, y = 0.343,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 609,
}

VendorLocations[15293] = {
    name = "Aendel Windspear",
    mapID = 81,
    x = 0.646, y = 0.458,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 609,
    minStanding = 3000,
}

VendorLocations[15419] = {
    name = "Kania",
    mapID = 81,
    x = 0.556, y = 0.372,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[15864] = {
    name = "Valadar Starsong",
    mapID = 80,
    x = 0.536, y = 0.353,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[15909] = {
    name = "Fariel Starsong",
    mapID = 80,
    x = 0.538, y = 0.353,
    faction = "Horde",
    types = { "food", "transmog" },
}

VendorLocations[16015] = {
    name = "Vi'el",
    mapID = 83,
    x = 0.616, y = 0.876,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[18542] = {
    name = "Alexston Chrome",
    mapID = 74,
    x = 0.6302, y = 0.2686,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[20278] = {
    name = "Vixton Pinchwhistle",
    mapID = 71,
    x = 0.516, y = 0.28,
    faction = "Neutral",
    types = { "transmog" },
    note = "ATT — Some items may require you to buy specific class ensembles to unlock every item from the vendor. Shift Rightclick the it",
}

VendorLocations[21643] = {
    name = "Alurmi",
    mapID = 74,
    x = 0.4, y = 0.772,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 989,
    minStanding = 9000,
}

VendorLocations[23533] = {
    name = "T'chali's Voodoo Brewery Apprentice",
    mapID = 1,
    x = 0.403, y = 0.169,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[23603] = {
    name = "Uta Roughdough",
    mapID = 1,
    x = 0.416, y = 0.178,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[23604] = {
    name = "Agnes Farwithers",
    mapID = 1,
    x = 0.41, y = 0.183,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[23605] = {
    name = "Bron",
    mapID = 1,
    x = 0.416, y = 0.178,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[23995] = {
    name = "Axle",
    mapID = 70,
    x = 0.418, y = 0.74,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[24495] = {
    name = "Blix Fixwidget",
    mapID = 1,
    x = 0.41, y = 0.17,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[24501] = {
    name = "Drohn's Distillery Apprentice",
    mapID = 1,
    x = 0.404, y = 0.181,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[24520] = {
    name = "Doris Volanthius",
    mapID = 85,
    x = 0.388, y = 0.698,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[26124] = {
    name = "Midsummer Merchant",
    mapID = 85,
    x = 0.478, y = 0.374,
    faction = "Horde",
    types = { "food", "transmog" },
    note = "ATT — You will need 10 of these torches to complete the |cffffff00Torch Juggler|r achievement.",
}

VendorLocations[31146] = {
    name = "Raider's Training Dummy",
    mapID = 85,
    x = 0.7484, y = 0.4762,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[33980] = {
    name = "Apothecary Furrows",
    mapID = 62,
    x = 0.572, y = 0.338,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[34303] = {
    name = "Dagrun Ragehammer",
    mapID = 63,
    x = 0.116, y = 0.352,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[34601] = {
    name = "Harlown Darkweave",
    mapID = 63,
    x = 0.182, y = 0.6,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[34684] = {
    name = "Laha Farplain",
    mapID = 88,
    x = 0.308, y = 0.646,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[34685] = {
    name = "Dalni Tallgrass",
    mapID = 1,
    x = 0.466, y = 0.138,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[36365] = {
    name = "Zoey Wizzlespark",
    mapID = 76,
    x = 0.558, y = 0.12,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[36375] = {
    name = "Tex Vortacoil",
    mapID = 76,
    x = 0.256, y = 0.38,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[38561] = {
    name = "Dramm Riverhorn",
    mapID = 78,
    x = 0.434, y = 0.416,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[40216] = {
    name = "Blazzek the Biter",
    mapID = 71,
    x = 0.516, y = 0.28,
    faction = "Neutral",
    types = { "transmog" },
    note = "ATT — Some items may require you to buy specific class ensembles to unlock every item from the vendor. Shift Rightclick the it",
}

VendorLocations[40226] = {
    name = "Pratt McGrubben",
    mapID = 69,
    x = 0.454, y = 0.412,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[40474] = {
    name = "Moro Sungrain",
    mapID = 69,
    x = 0.408, y = 0.152,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[40572] = {
    name = "Haughty Modiste",
    mapID = 71,
    x = 0.506, y = 0.286,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[40589] = {
    name = "Dirge Quikcleave",
    mapID = 71,
    x = 0.526, y = 0.29,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[41135] = {
    name = "\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"Plucky\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" Johnson",
    mapID = 64,
    x = 0.856, y = 0.916,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[41452] = {
    name = "Starn",
    mapID = 64,
    x = 0.462, y = 0.576,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[42028] = {
    name = "Krom'gar Quartermaster",
    mapID = 65,
    x = 0.658, y = 0.64,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[43239] = {
    name = "Razgar",
    mapID = 85,
    x = 0.6574, y = 0.4095,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[43418] = {
    name = "Sprinkle Noggenfogger",
    mapID = 71,
    x = 0.524, y = 0.278,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[43436] = {
    name = "Ceriale Duskwhisper",
    mapID = 62,
    x = 0.506, y = 0.206,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[44030] = {
    name = "Draelan",
    mapID = 57,
    x = 0.39, y = 0.3,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[44381] = {
    name = "Apprentice of Estulan",
    mapID = 69,
    x = 0.568, y = 0.544,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[44918] = {
    name = "Drakma",
    mapID = 85,
    x = 0.48, y = 0.586,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[44975] = {
    name = "Old Umbehto",
    mapID = 85,
    x = 0.35, y = 0.676,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[45546] = {
    name = "Vizna Bangwrench",
    mapID = 85,
    x = 0.366, y = 0.868,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[45549] = {
    name = "Zido Helmbreaker",
    mapID = 76,
    x = 0.294, y = 0.661,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[45551] = {
    name = "Karizi Porkpatty",
    mapID = 85,
    x = 0.39, y = 0.856,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[45558] = {
    name = "Lizna Goldweaver",
    mapID = 85,
    x = 0.41, y = 0.798,
    faction = "Horde",
    types = { "general" },
    note = "ATT — This NPC is only visible if you have not yet unlocked the allied race Highmountain Tauren.",
}

VendorLocations[46359] = {
    name = "Punra",
    mapID = 85,
    x = 0.45, y = 0.776,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[46512] = {
    name = "Naros",
    mapID = 85,
    x = 0.45, y = 0.776,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[46555] = {
    name = "Gunra",
    mapID = 85,
    x = 0.484, y = 0.716,
    faction = "Horde",
    types = { "transmog" },
    note = "ATT — Sells gear related to Cataclysm raid tier 12 (Firelands) as well as Baradin Hold.",
}

VendorLocations[46556] = {
    name = "Jamus'Vaz",
    mapID = 85,
    x = 0.486, y = 0.714,
    faction = "Horde",
    types = { "transmog" },
    note = "ATT — Sells gear related to Cataclysm raid tier 13 (Dragon Soul).",
}

VendorLocations[46593] = {
    name = "Doris Volanthius",
    mapID = 85,
    x = 0.388, y = 0.698,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[46637] = {
    name = "Auctioneer Drezbit",
    mapID = 85,
    x = 0.6648, y = 0.3633,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[46638] = {
    name = "Auctioneer Vizput",
    mapID = 85,
    x = 0.6684, y = 0.3613,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[46639] = {
    name = "Auctioneer Zilbeena",
    mapID = 85,
    x = 0.6638, y = 0.3638,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[46640] = {
    name = "Auctioneer Kuvi",
    mapID = 85,
    x = 0.6677, y = 0.3618,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[46675] = {
    name = "Lugrah",
    mapID = 85,
    x = 0.7243, y = 0.3442,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[46708] = {
    name = "Suja",
    mapID = 85,
    x = 0.566, y = 0.612,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[46716] = {
    name = "Nerog",
    mapID = 85,
    x = 0.552, y = 0.558,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[46718] = {
    name = "Moraka",
    mapID = 85,
    x = 0.553, y = 0.56,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[46742] = {
    name = "Brunda",
    mapID = 85,
    x = 0.546, y = 0.506,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[47771] = {
    name = "Drukma",
    mapID = 85,
    x = 0.6204, y = 0.35,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[48258] = {
    name = "Willard Harrington",
    mapID = 77,
    x = 0.616, y = 0.258,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[48510] = {
    name = "Kall Worthaton",
    mapID = 85,
    x = 0.362, y = 0.866,
    faction = "Horde",
    types = { "faction" },
    repFactionID = 1133,
    minStanding = 42000,
}

VendorLocations[48577] = {
    name = "Ciana",
    mapID = 77,
    x = 0.432, y = 0.284,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[48580] = {
    name = "Desaan",
    mapID = 77,
    x = 0.438, y = 0.298,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[49737] = {
    name = "Shazdar",
    mapID = 85,
    x = 0.568, y = 0.626,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[49884] = {
    name = "Sally \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"Salvager\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" Sandscrew",
    mapID = 76,
    x = 0.608, y = 0.502,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[49885] = {
    name = "KTC Train-a-Tron Deluxe",
    mapID = 76,
    x = 0.57, y = 0.506,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[49887] = {
    name = "Gappy Silvertooth",
    mapID = 76,
    x = 0.5753, y = 0.487,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[50129] = {
    name = "Daleohm",
    mapID = 83,
    x = 0.58, y = 0.638,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[50304] = {
    name = "Captain Donald Adams",
    mapID = 85,
    x = 0.566, y = 0.902,
    faction = "Horde",
    types = { "transmog", "faction" },
    repFactionID = 68,
}

VendorLocations[50323] = {
    name = "Frizzo Villamar",
    mapID = 85,
    x = 0.5, y = 0.586,
    faction = "Horde",
    types = { "transmog", "faction" },
    repFactionID = 1133,
    minStanding = 42000,
}

VendorLocations[50477] = {
    name = "Champion Uru'zin",
    mapID = 85,
    x = 0.499, y = 0.581,
    faction = "Horde",
    types = { "transmog", "faction" },
    repFactionID = 530,
    minStanding = 42000,
}

VendorLocations[50482] = {
    name = "Marith Lazuria",
    mapID = 85,
    x = 0.7251, y = 0.3446,
    faction = "Horde",
    types = { "reagents", "profession" },
}

VendorLocations[50483] = {
    name = "Brave Tuho",
    mapID = 88,
    x = 0.469, y = 0.5033,
    faction = "Horde",
    types = { "transmog", "profession" },
}

VendorLocations[50488] = {
    name = "Stone Guard Nargol",
    mapID = 85,
    x = 0.504, y = 0.584,
    faction = "Horde",
    types = { "transmog", "faction" },
    repFactionID = 76,
    minStanding = 3000,
}

VendorLocations[52033] = {
    name = "Rogoc",
    mapID = 85,
    x = 0.378, y = 0.716,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[52036] = {
    name = "Galra",
    mapID = 85,
    x = 0.38, y = 0.708,
    faction = "Horde",
    types = { "food", "transmog" },
}

VendorLocations[52651] = {
    name = "Engineer Palehoof",
    mapID = 88,
    x = 0.3647, y = 0.5968,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[52655] = {
    name = "Palehoof's Big Bag of Parts",
    mapID = 88,
    x = 0.3622, y = 0.6021,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[52657] = {
    name = "Nahari Cloudchaser",
    mapID = 88,
    x = 0.3506, y = 0.5394,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[52658] = {
    name = "Paku Cloudchaser",
    mapID = 88,
    x = 0.3519, y = 0.5375,
    faction = "Horde",
    types = { "reagents", "profession" },
}

VendorLocations[52809] = {
    name = "Blax Bottlerocket",
    mapID = 85,
    x = 0.5713, y = 0.5112,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[52830] = {
    name = "Michelle De Rum",
    mapID = 83,
    x = 0.598, y = 0.516,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[53410] = {
    name = "Lissah Spellwick",
    mapID = 70,
    x = 0.66, y = 0.496,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[54657] = {
    name = "Doris Volanthius",
    mapID = 85,
    x = 0.388, y = 0.698,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[54659] = {
    name = "Blood Guard Zar'shi",
    mapID = 85,
    x = 0.382, y = 0.71,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[57922] = {
    name = "Taryssa Lazuria",
    mapID = 85,
    x = 0.7234, y = 0.3454,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[58155] = {
    name = "Rugok",
    mapID = 85,
    x = 0.482, y = 0.716,
    faction = "Horde",
    types = { "transmog" },
    note = "ATT — Sells gear related to Cataclysm raid tier 11 (Throne of the Four Winds, Blackwing Descent, and Bastion of Twilight) as w",
}

VendorLocations[63546] = {
    name = "Zidormi",
    mapID = 70,
    x = 0.558, y = 0.496,
    faction = "Alliance",
    types = { "transmog" },
    note = "ATT — Sells the following items if you completed the level 85 version of the Theramore's Fall Scenario on your current charact",
}

VendorLocations[66022] = {
    name = "Turtlemaster Odai",
    mapID = 85,
    x = 0.698, y = 0.41,
    faction = "Horde",
    types = { "faction" },
    repFactionID = 1352,
    minStanding = 42000,
}

VendorLocations[69322] = {
    name = "Capps Carlin",
    mapID = 71,
    x = 0.516, y = 0.28,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[69323] = {
    name = "Tiny Tayger",
    mapID = 71,
    x = 0.516, y = 0.28,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[69333] = {
    name = "Disciple Jusi",
    mapID = 85,
    x = 0.685, y = 0.4047,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[69977] = {
    name = "Blood Guard Zar'shi",
    mapID = 85,
    x = 0.386, y = 0.7,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[69978] = {
    name = "Sergeant Thunderhorn",
    mapID = 85,
    x = 0.388, y = 0.7,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[95057] = {
    name = "Illidari Darkdealer",
    mapID = 85,
    x = 0.53, y = 0.565,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[106940] = {
    name = "Innkeeper Fizzgrimble",
    mapID = 71,
    x = 0.526, y = 0.27,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[110035] = {
    name = "Historian Ju'pa",
    mapID = 85,
    x = 0.366, y = 0.746,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[113615] = {
    name = "Ravika",
    mapID = 1,
    x = 0.554, y = 0.112,
    faction = "Horde",
    types = { "transmog" },
    note = "ATT — Only available with the quests |cFFFFD700The Legion Returns|r or |cFFFFD700To Be Prepared|r. Permanently available on th",
}

VendorLocations[115923] = {
    name = "Ko'Zan",
    mapID = 78,
    x = 0.436, y = 0.414,
    faction = "Neutral",
    types = { "profession" },
    note = "ATT — Vendor only sells plans to those who have completed the quest 'Saving My Head'.",
}

VendorLocations[117433] = {
    name = "Warlord Gorchuk",
    mapID = 81,
    x = 0.3396, y = 0.8191,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[117435] = {
    name = "Field Marshal Snowfall",
    mapID = 81,
    x = 0.3406, y = 0.8043,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[130216] = {
    name = "Magni Bronzebeard",
    mapID = 81,
    x = 0.422, y = 0.442,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2164,
    minStanding = 9000,
}

VendorLocations[131837] = {
    name = "Zannok Hidepiercer",
    mapID = 81,
    x = 0.812, y = 0.184,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[132139] = {
    name = "Hagras Wartaker",
    mapID = 81,
    x = 0.662, y = 0.552,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[133127] = {
    name = "Thaluriel",
    mapID = 85,
    x = 0.368, y = 0.846,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[133239] = {
    name = "Leyweaver Aurielle",
    mapID = 85,
    x = 0.382, y = 0.868,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[133261] = {
    name = "Feng Su",
    mapID = 85,
    x = 0.41, y = 0.794,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[149806] = {
    name = "A. Shady",
    mapID = 85,
    x = 0.767, y = 0.356,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[150905] = {
    name = "Shirtsi Clothpatch",
    mapID = 83,
    x = 0.596, y = 0.503,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[152775] = {
    name = "Vinter Mollyleux",
    mapID = 1,
    x = 0.403, y = 0.179,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[152780] = {
    name = "Zenda",
    mapID = 1,
    x = 0.407, y = 0.168,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[152948] = {
    name = "Ha'ka Openview",
    mapID = 1,
    x = 0.407, y = 0.168,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[153008] = {
    name = "Kaara",
    mapID = 1,
    x = 0.402, y = 0.175,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[153285] = {
    name = "Training Dummy",
    mapID = 85,
    x = 0.7279, y = 0.4624,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[155133] = {
    name = "Etga",
    mapID = 1,
    x = 0.422, y = 0.185,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[155944] = {
    name = "Otela",
    mapID = 74,
    x = 0.424, y = 0.716,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[157756] = {
    name = "Waiter",
    mapID = 75,
    x = 0.538, y = 0.39,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[158061] = {
    name = "Historian Ma'di",
    mapID = 71,
    x = 0.626, y = 0.504,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[158067] = {
    name = "Persnip Goodup",
    mapID = 75,
    x = 0.532, y = 0.556,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[165840] = {
    name = "Quartermaster Lungren",
    mapID = 85,
    x = 0.531, y = 0.769,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[168540] = {
    name = "Rohaka Tuskmaul",
    mapID = 85,
    x = 0.7136, y = 0.4743,
    faction = "Horde",
    types = { "mounts" },
}

VendorLocations[168551] = {
    name = "Tamanji",
    mapID = 85,
    x = 0.7384, y = 0.4353,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[168553] = {
    name = "Telotha Pinegrove",
    mapID = 85,
    x = 0.7306, y = 0.4335,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[168596] = {
    name = "Gormok Ogrefist",
    mapID = 85,
    x = 0.7369, y = 0.4709,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[168597] = {
    name = "Avaros Dawnglaive",
    mapID = 85,
    x = 0.7326, y = 0.4752,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[168619] = {
    name = "Huinli Wingpaw",
    mapID = 85,
    x = 0.7557, y = 0.4357,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[168621] = {
    name = "Martin Goodchilde",
    mapID = 85,
    x = 0.7271, y = 0.4693,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[168623] = {
    name = "Kazak Darkscream",
    mapID = 85,
    x = 0.746, y = 0.472,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[168626] = {
    name = "Feenix Arcshine",
    mapID = 85,
    x = 0.7475, y = 0.4373,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[168628] = {
    name = "Hretar Riverspeaker",
    mapID = 85,
    x = 0.7351, y = 0.4322,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[169166] = {
    name = "Provisioner Jin'hake",
    mapID = 85,
    x = 0.726, y = 0.446,
    faction = "Horde",
    types = { "transmog" },
    note = "ATT — Only sells items once the achievement |cffebae34Exile's Reach|r [14222] is completed.",
}

VendorLocations[171689] = {
    name = "Nathoka Bloodfang",
    mapID = 85,
    x = 0.7351, y = 0.4403,
    faction = "Horde",
    types = { "mounts" },
}

VendorLocations[171691] = {
    name = "Alpheus Cain",
    mapID = 85,
    x = 0.7535, y = 0.458,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[179897] = {
    name = "Ca'nees",
    mapID = 85,
    x = 0.4, y = 0.61,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[202438] = {
    name = "Lok'osh Nakha",
    mapID = 85,
    x = 0.6327, y = 0.426,
    faction = "Horde",
    types = { "profession" },
}

VendorLocations[214480] = {
    name = "Zin'boja",
    mapID = 1,
    x = 0.412, y = 0.18,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[214481] = {
    name = "Lythianne Morningspear",
    mapID = 1,
    x = 0.419, y = 0.173,
    faction = "Horde",
    types = { "food", "transmog" },
}

VendorLocations[214482] = {
    name = "Grogg Skullsmasher",
    mapID = 1,
    x = 0.412, y = 0.182,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[214488] = {
    name = "Hana Breezeheart",
    mapID = 1,
    x = 0.414, y = 0.178,
    faction = "Horde",
    types = { "food", "transmog" },
}

VendorLocations[214489] = {
    name = "Zikky",
    mapID = 1,
    x = 0.41, y = 0.172,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[214861] = {
    name = "Jeremiah Payson",
    mapID = 1,
    x = 0.412, y = 0.175,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[215109] = {
    name = "Ugawa",
    mapID = 1,
    x = 0.408, y = 0.178,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[223881] = {
    name = "Braggi Brazenbrass",
    mapID = 71,
    x = 0.63, y = 0.498,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[223884] = {
    name = "Bobadormu",
    mapID = 71,
    x = 0.627, y = 0.503,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[223902] = {
    name = "Traeya",
    mapID = 71,
    x = 0.631, y = 0.509,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[224322] = {
    name = "Hilda Hellforge",
    mapID = 71,
    x = 0.63, y = 0.498,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[226766] = {
    name = "Benatauk",
    mapID = 71,
    x = 0.633, y = 0.524,
    faction = "Neutral",
    types = { "food" },
    note = "ATT — You need to get up to the quest 'A Whiff of Help' in the chain and accept it in order to buy the items.",
}

VendorLocations[229707] = {
    name = "Storekeeper Reginald",
    mapID = 71,
    x = 0.629, y = 0.511,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[231352] = {
    name = "Notary Grably",
    mapID = 71,
    x = 0.633, y = 0.507,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[233209] = {
    name = "Kraegan Emberforge",
    mapID = 71,
    x = 0.63, y = 0.498,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[241196] = {
    name = "Sylvessa Luminweave",
    mapID = 1,
    x = 0.402, y = 0.171,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[241300] = {
    name = "Spritz Tinkerton",
    mapID = 1,
    x = 0.403, y = 0.17,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[241305] = {
    name = "Grimlash Thornclaw",
    mapID = 1,
    x = 0.404, y = 0.171,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[242676] = {
    name = "Leial Knitterton",
    mapID = 85,
    x = 0.58, y = 0.568,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[254606] = {
    name = "Joruh",
    mapID = 85,
    x = 0.388, y = 0.72,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[256119] = {
    name = "Lonalo",
    mapID = 85,
    x = 0.586, y = 0.503,
    faction = "Horde",
    types = { "general" },
    note = "ATT — Not all items are sold each day.",
}

VendorLocations[261262] = {
    name = "Gabbi",
    mapID = 85,
    x = 0.484, y = 0.81,
    faction = "Horde",
    types = { "general" },
}

------------------------------------------------------------------
-- The War Within / Midnight (Khaz Algar)
------------------------------------------------------------------

VendorLocations[206150] = {
    name = "Erol Ellimoore",
    mapID = 2215,
    x = 0.632, y = 0.294,
    faction = "Neutral",
    types = { "food", "faction" },
    repFactionID = 2570,
    minStanding = 3,
}

VendorLocations[206441] = {
    name = "Auebry Irongear",
    mapID = 2215,
    x = 0.652, y = 0.281,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 2570,
    minStanding = 3,
}

VendorLocations[206533] = {
    name = "Chef Dinaire",
    mapID = 2215,
    x = 0.645, y = 0.311,
    faction = "Neutral",
    types = { "food", "faction" },
    repFactionID = 2570,
    minStanding = 3,
}

VendorLocations[208070] = {
    name = "Sir Finley Mrrgglton",
    mapID = 2339,
    x = 0.476, y = 0.436,
    faction = "Neutral",
    types = { "food", "transmog" },
}

VendorLocations[208186] = {
    name = "Yorvas Flintstrike",
    mapID = 2215,
    x = 0.646, y = 0.307,
    faction = "Neutral",
    types = { "food", "faction" },
    repFactionID = 2570,
    minStanding = 3,
}

VendorLocations[212419] = {
    name = "Attica Whiskervale",
    mapID = 2215,
    x = 0.645, y = 0.188,
    faction = "Neutral",
    types = { "food", "faction" },
    repFactionID = 2570,
    minStanding = 3,
}

VendorLocations[213145] = {
    name = "Auralia Steelstrike",
    mapID = 2215,
    x = 0.413, y = 0.531,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2570,
    minStanding = 2,
}

VendorLocations[214380] = {
    name = "Raen Dawncavalyr",
    mapID = 2215,
    x = 0.433, y = 0.564,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[214428] = {
    name = "Seraphine Seedheart",
    mapID = 2215,
    x = 0.637, y = 0.339,
    faction = "Neutral",
    types = { "food", "faction" },
    repFactionID = 2570,
    minStanding = 3,
}

VendorLocations[215956] = {
    name = "Taerry Bilgestone",
    mapID = 2215,
    x = 0.658, y = 0.244,
    faction = "Neutral",
    types = { "food", "faction" },
    repFactionID = 2570,
    minStanding = 3,
}

VendorLocations[216164] = {
    name = "Gnawbles",
    mapID = 2214,
    x = 0.435, y = 0.353,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[216598] = {
    name = "Janky",
    mapID = 2214,
    x = 0.434, y = 0.334,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[217253] = {
    name = "Ves'trak",
    mapID = 2255,
    x = 0.747, y = 0.812,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[217642] = {
    name = "Nalina Ironsong",
    mapID = 2215,
    x = 0.428, y = 0.558,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[217645] = {
    name = "Torran Dellain",
    mapID = 2215,
    x = 0.693, y = 0.439,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[217989] = {
    name = "Aeden Braesmeld",
    mapID = 2215,
    x = 0.42, y = 0.546,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[218165] = {
    name = "Kama",
    mapID = 2213,
    x = 0.431, y = 0.207,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[218166] = {
    name = "Rakka",
    mapID = 2213,
    x = 0.466, y = 0.219,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[218169] = {
    name = "Llyot",
    mapID = 2213,
    x = 0.469, y = 0.161,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[218172] = {
    name = "Phylleus",
    mapID = 2213,
    x = 0.518, y = 0.246,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[218176] = {
    name = "Nuel Prill",
    mapID = 2213,
    x = 0.422, y = 0.272,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[218179] = {
    name = "Alvus Valavulu",
    mapID = 2213,
    x = 0.478, y = 0.187,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[218189] = {
    name = "Polo",
    mapID = 2213,
    x = 0.481, y = 0.253,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[218190] = {
    name = "Saaria",
    mapID = 2213,
    x = 0.504, y = 0.17,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[218192] = {
    name = "Siesbarg",
    mapID = 2213,
    x = 0.454, y = 0.13,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[218193] = {
    name = "Iliani",
    mapID = 2213,
    x = 0.454, y = 0.333,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[218195] = {
    name = "Rukku",
    mapID = 2213,
    x = 0.583, y = 0.315,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[218197] = {
    name = "Kurth",
    mapID = 2213,
    x = 0.49, y = 0.268,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[218198] = {
    name = "Pelefien",
    mapID = 2213,
    x = 0.505, y = 0.263,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[218199] = {
    name = "Kram'an",
    mapID = 2213,
    x = 0.496, y = 0.266,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[218200] = {
    name = "Yaggi",
    mapID = 2213,
    x = 0.496, y = 0.262,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[218202] = {
    name = "Thripps",
    mapID = 2216,
    x = 0.502, y = 0.314,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[218207] = {
    name = "Clutchmother Marn'tiq",
    mapID = 2213,
    x = 0.442, y = 0.171,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[218209] = {
    name = "Tyro Uwe",
    mapID = 2213,
    x = 0.45, y = 0.167,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[218210] = {
    name = "Tyro Whalekk",
    mapID = 2213,
    x = 0.434, y = 0.17,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[218214] = {
    name = "Ruukk",
    mapID = 2213,
    x = 0.514, y = 0.125,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[218218] = {
    name = "\\\"Eight-Shaker\\\" Sallow",
    mapID = 2213,
    x = 0.534, y = 0.153,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[218224] = {
    name = "\\\"Calmest\\\" Gobbu",
    mapID = 2213,
    x = 0.466, y = 0.292,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[218416] = {
    name = "Heissanik",
    mapID = 2214,
    x = 0.58, y = 0.46,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[219036] = {
    name = "Ardgaz",
    mapID = 2339,
    x = 0.548, y = 0.425,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[219051] = {
    name = "Lyrendal",
    mapID = 2339,
    x = 0.598, y = 0.564,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[219055] = {
    name = "Madam Goya",
    mapID = 2339,
    x = 0.648, y = 0.527,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[219197] = {
    name = "Griftah",
    mapID = 2339,
    x = 0.625, y = 0.509,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[219212] = {
    name = "Maara",
    mapID = 2339,
    x = 0.603, y = 0.7,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[219213] = {
    name = "Gilderann",
    mapID = 2339,
    x = 0.552, y = 0.768,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[219215] = {
    name = "Hotharn",
    mapID = 2339,
    x = 0.555, y = 0.771,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[219217] = {
    name = "Velerd",
    mapID = 2339,
    x = 0.55, y = 0.765,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[219226] = {
    name = "Vaskarn",
    mapID = 2339,
    x = 0.521, y = 0.422,
    faction = "Neutral",
    types = { "general" },
    note = "ATT —  |cffff0000 -- DOWNGRADE --|r  Cost: Normal Crest Receive: LFR Crest",
}

VendorLocations[219230] = {
    name = "Erani",
    mapID = 2339,
    x = 0.585, y = 0.649,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[219255] = {
    name = "Karbath",
    mapID = 2339,
    x = 0.473, y = 0.648,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[219318] = {
    name = "Jorid",
    mapID = 2339,
    x = 0.573, y = 0.606,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[219376] = {
    name = "Kargand",
    mapID = 2339,
    x = 0.554, y = 0.671,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[221390] = {
    name = "Waxmonger Squick",
    mapID = 2214,
    x = 0.431, y = 0.329,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2594,
    minStanding = 1,
}

VendorLocations[222561] = {
    name = "Agmera",
    mapID = 2339,
    x = 0.538, y = 0.382,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[223134] = {
    name = "Supervisor Varric",
    mapID = 2216,
    x = 0.552, y = 0.365,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[223155] = {
    name = "Old V'k",
    mapID = 2216,
    x = 0.506, y = 0.378,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[223163] = {
    name = "Paxton Bombshell",
    mapID = 2214,
    x = 0.597, y = 0.784,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[223176] = {
    name = "Tej the Undying",
    mapID = 2216,
    x = 0.565, y = 0.355,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[223177] = {
    name = "Izkrk'tkrzn",
    mapID = 2216,
    x = 0.599, y = 0.316,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[223280] = {
    name = "Collector Z'til",
    mapID = 2213,
    x = 0.7, y = 0.313,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[223354] = {
    name = "Nataniel Highdawn",
    mapID = 2255,
    x = 0.449, y = 0.664,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[223728] = {
    name = "Auditor Balwurz",
    mapID = 2339,
    x = 0.391, y = 0.24,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2590,
    minStanding = 1,
}

VendorLocations[223750] = {
    name = "Lady Vinazian",
    mapID = 2255,
    x = 0.553, y = 0.412,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2600,
    minStanding = 2,
}

VendorLocations[224267] = {
    name = "Ab'xal",
    mapID = 2216,
    x = 0.573, y = 0.459,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[224270] = {
    name = "Ip'xal",
    mapID = 2216,
    x = 0.57, y = 0.458,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[224294] = {
    name = "Osidion",
    mapID = 2339,
    x = 0.573, y = 0.608,
    faction = "Neutral",
    types = { "transmog" },
    note = "ATT — Cost is based on if a Earth-Encrusted Gem is in your inventory. If none then the ensembles are available for Resonance C",
}

VendorLocations[224337] = {
    name = "Zara'azj the Magnificent",
    mapID = 2216,
    x = 0.556, y = 0.475,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[224729] = {
    name = "Anub'okki",
    mapID = 2255,
    x = 0.559, y = 0.421,
    faction = "Neutral",
    types = { "food", "faction" },
    repFactionID = 2605,
    minStanding = 3,
}

VendorLocations[224733] = {
    name = "Tulumun",
    mapID = 2255,
    x = 0.45, y = 0.167,
    faction = "Neutral",
    types = { "food", "faction" },
    repFactionID = 2607,
    minStanding = 3,
}

VendorLocations[224734] = {
    name = "Bobbin",
    mapID = 2255,
    x = 0.564, y = 0.433,
    faction = "Neutral",
    types = { "food", "faction" },
    repFactionID = 2601,
    minStanding = 3,
}

VendorLocations[225189] = {
    name = "R-K-MEDES",
    mapID = 2214,
    x = 0.433, y = 0.32,
    faction = "Neutral",
    types = { "food", "faction" },
    repFactionID = 2594,
    minStanding = 7,
}

VendorLocations[225220] = {
    name = "Wheat",
    mapID = 2214,
    x = 0.544, y = 0.654,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[226205] = {
    name = "Cendvin",
    mapID = 2248,
    x = 0.744, y = 0.452,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[226211] = {
    name = "Ax'ill",
    mapID = 2213,
    x = 0.608, y = 0.426,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[226214] = {
    name = "Ka'muko",
    mapID = 2255,
    x = 0.566, y = 0.43,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 2600,
    minStanding = 8,
}

VendorLocations[226250] = {
    name = "Reno Jackson",
    mapID = 2339,
    x = 0.476, y = 0.45,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[226846] = {
    name = "Captain Oathmyt",
    mapID = 2215,
    x = 0.442, y = 0.614,
    faction = "Neutral",
    types = { "food", "transmog" },
}

VendorLocations[226994] = {
    name = "Blair Bass",
    mapID = 2346,
    x = 0.34, y = 0.714,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[227003] = {
    name = "Kir'xal",
    mapID = 2216,
    x = 0.567, y = 0.461,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[227176] = {
    name = "Mattimeo Twinstar",
    mapID = 2255,
    x = 0.231, y = 0.513,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[227607] = {
    name = "Fliq'ri",
    mapID = 2343,
    x = 0.747, y = 0.488,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — Found by the right stairs near the second boss. You may need another player to be caught by the nearby guard to be able ",
}

VendorLocations[227797] = {
    name = "Raen Dawncavalyr",
    mapID = 2215,
    x = 0.283, y = 0.56,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[227814] = {
    name = "Sally Boltwrench",
    mapID = 2369,
    x = 0.69, y = 0.475,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[228074] = {
    name = "Angorla",
    mapID = 2369,
    x = 0.712, y = 0.44,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — You may have to acquire the gem as Bonus Objective Reward once before it appears on the vendor.",
}

VendorLocations[228093] = {
    name = "Argarom",
    mapID = 2369,
    x = 0.673, y = 0.417,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[228099] = {
    name = "Blinky Greasefingers",
    mapID = 2369,
    x = 0.692, y = 0.458,
    faction = "Neutral",
    types = { "food" },
    note = "ATT — You must have the Prismatic Snapdragon Mount before this dialog option can appear.",
}

VendorLocations[228103] = {
    name = "Flori",
    mapID = 2369,
    x = 0.674, y = 0.4,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[228184] = {
    name = "Yamas the Provider",
    mapID = 2255,
    x = 0.554, y = 0.418,
    faction = "Neutral",
    types = { "food", "faction" },
    repFactionID = 2600,
    minStanding = 3,
    note = "ATT — The item costs 8.8mil Kej, however the price of the item decreases by one digit for each exalted (9/9) Severed Threads l",
}

VendorLocations[228286] = {
    name = "Skedgit Cinderbangs",
    mapID = 2346,
    x = 0.43, y = 0.828,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[228390] = {
    name = "Snizzle Fumblecrank",
    mapID = 2369,
    x = 0.69, y = 0.464,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[229184] = {
    name = "Aspirant Kiipka",
    mapID = 2255,
    x = 0.559, y = 0.421,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[231536] = {
    name = "Apprentice Tanmar",
    mapID = 2369,
    x = 0.708, y = 0.406,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — You may have to acquire the gem as Bonus Objective Reward once before it appears on the vendor.",
}

VendorLocations[231824] = {
    name = "Kari Bridgeblaster",
    mapID = 2346,
    x = 0.44, y = 0.498,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[231997] = {
    name = "Didi the Wrench",
    mapID = 2369,
    x = 0.712, y = 0.456,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — You may have to acquire the gem as Bonus Objective Reward once before it appears on the vendor.",
}

VendorLocations[232295] = {
    name = "Almyr Sunhart",
    mapID = 2369,
    x = 0.706, y = 0.386,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[233259] = {
    name = "Taljori",
    mapID = 2369,
    x = 0.657, y = 0.417,
    faction = "Neutral",
    types = { "transmog" },
    note = "ATT — You may have to acquire the gem from the World Quest once before it appears on the vendor.",
}

VendorLocations[234362] = {
    name = "Kaja'Cola Dispenser",
    mapID = 2346,
    x = 0.673, y = 0.285,
    faction = "Neutral",
    types = { "food", "faction" },
    repFactionID = 2653,
    minStanding = 7,
}

VendorLocations[234390] = {
    name = "Soweezi",
    mapID = 2369,
    x = 0.7, y = 0.484,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[234742] = {
    name = "Supplier Toffa",
    mapID = 2339,
    x = 0.4779, y = 0.5255,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[234744] = {
    name = "Supplier Offa",
    mapID = 2339,
    x = 0.4757, y = 0.5276,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[234746] = {
    name = "Supplier Mizix",
    mapID = 2339,
    x = 0.4807, y = 0.5216,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[234747] = {
    name = "Supplier Felina",
    mapID = 2339,
    x = 0.4816, y = 0.5199,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[234776] = {
    name = "Angelo Rustbin",
    mapID = 2346,
    x = 0.258, y = 0.381,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[234906] = {
    name = "Syenite",
    mapID = 2339,
    x = 0.58, y = 0.568,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[235079] = {
    name = "Ba'orr",
    mapID = 2472,
    x = 0.411, y = 0.251,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[235252] = {
    name = "Om'sirik",
    mapID = 2472,
    x = 0.406, y = 0.292,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2658,
    minStanding = 1,
}

VendorLocations[235314] = {
    name = "Ta'sam",
    mapID = 2472,
    x = 0.433, y = 0.355,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — |cFFE50D12WARNING:|r Sells mostly junk items. Purchases are not refundable. Selling the items back will get you back onl",
}

VendorLocations[235407] = {
    name = "Hooded Purveyor",
    mapID = 2369,
    x = 0.679, y = 0.393,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[235645] = {
    name = "Curator Ve'ka",
    mapID = 2472,
    x = 0.519, y = 0.539,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[236045] = {
    name = "Ailenda Hedgemyr",
    mapID = 2369,
    x = 0.708, y = 0.402,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[236409] = {
    name = "Ta'rex",
    mapID = 2472,
    x = 0.495, y = 0.392,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — |cFFE50D12WARNING:|r Sells junk items. Purchases are not refundable. Selling the items back will get you back only 1/4 o",
}

VendorLocations[236411] = {
    name = "Ditty Fuzeboy",
    mapID = 2346,
    x = 0.354, y = 0.414,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[236849] = {
    name = "Greexit Coarsebub",
    mapID = 2346,
    x = 0.245, y = 0.633,
    faction = "Neutral",
    types = { "transmog" },
    note = "ATT — Sells different cosmetics depending on which cartel you have a contract with.",
}

VendorLocations[237784] = {
    name = "Alchemist Pestlezugg",
    mapID = 2346,
    x = 0.28, y = 0.739,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[238029] = {
    name = "C.H.E.T.T.",
    mapID = 2346,
    x = 0.434, y = 0.505,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2653,
    minStanding = 13,
    note = "ATT — Talk to C.H.E.T.T. to be granted one for free, or turn in 40 C.H.E.T.T. cards to earn more after your first.",
}

VendorLocations[238136] = {
    name = "Augermu",
    mapID = 2339,
    x = 0.352, y = 0.686,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[238138] = {
    name = "Torie",
    mapID = 2339,
    x = 0.344, y = 0.684,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[238544] = {
    name = "Chreni",
    mapID = 2339,
    x = 0.338, y = 0.686,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[238545] = {
    name = "TickTak",
    mapID = 2339,
    x = 0.339, y = 0.688,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[238546] = {
    name = "Rhythferr",
    mapID = 2339,
    x = 0.341, y = 0.685,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[239112] = {
    name = "Bombin' Bert",
    mapID = 2346,
    x = 0.509, y = 0.318,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[239150] = {
    name = "Brix the Bloody",
    mapID = 2346,
    x = 0.282, y = 0.271,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[239166] = {
    name = "Geeves",
    mapID = 2346,
    x = 0.292, y = 0.258,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[239333] = {
    name = "Street Food Vendor",
    mapID = 2346,
    x = 0.26, y = 0.43,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[239523] = {
    name = "Halduron Brightwing",
    mapID = 2346,
    x = 0.29, y = 0.538,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[240481] = {
    name = "Consultant Wrexxle",
    mapID = 2339,
    x = 0.52, y = 0.46,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[240852] = {
    name = "Lars Bronsmaelt",
    mapID = 2215,
    x = 0.283, y = 0.562,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2688,
    minStanding = 2,
}

VendorLocations[240979] = {
    name = "Vesper Churnmoat",
    mapID = 2215,
    x = 0.282, y = 0.56,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[241588] = {
    name = "Hashim",
    mapID = 2371,
    x = 0.503, y = 0.366,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[241624] = {
    name = "Shad'anis",
    mapID = 2371,
    x = 0.504, y = 0.363,
    faction = "Neutral",
    types = { "food", "transmog" },
}

VendorLocations[243031] = {
    name = "Clockwork Assistant",
    mapID = 2339,
    x = 0.558, y = 0.266,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[243032] = {
    name = "Jepetto Joybuzz",
    mapID = 2339,
    x = 0.558, y = 0.264,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[243253] = {
    name = "Layne Pontelle",
    mapID = 2215,
    x = 0.283, y = 0.561,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[243801] = {
    name = "Zo'phar",
    mapID = 2472,
    x = 0.532, y = 0.541,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[245348] = {
    name = "Ba'choso",
    mapID = 2371,
    x = 0.42, y = 0.224,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[245349] = {
    name = "Zo'ropo",
    mapID = 2371,
    x = 0.42, y = 0.22,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[245378] = {
    name = "Baranar",
    mapID = 2339,
    x = 0.529, y = 0.68,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[248304] = {
    name = "Acquirer Ba'theom",
    mapID = 2371,
    x = 0.421, y = 0.234,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[248341] = {
    name = "Dip Stickshift",
    mapID = 2339,
    x = 0.481, y = 0.454,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[251911] = {
    name = "Stacks Topskimmer",
    mapID = 2346,
    x = 0.432, y = 0.505,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[252887] = {
    name = "Chert",
    mapID = 2214,
    x = 0.434, y = 0.328,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[252901] = {
    name = "Cinnabar",
    mapID = 2248,
    x = 0.42, y = 0.73,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[252910] = {
    name = "Garnett",
    mapID = 2339,
    x = 0.547, y = 0.578,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[256783] = {
    name = "Gabbun",
    mapID = 2214,
    x = 0.434, y = 0.333,
    faction = "Neutral",
    types = { "general" },
}

------------------------------------------------------------------
-- Battle for Azeroth (Kul Tiras)
------------------------------------------------------------------

VendorLocations[123675] = {
    name = "Patrick Markson",
    mapID = 1161,
    x = 0.74, y = 0.162,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[128467] = {
    name = "Elijah Eggleton",
    mapID = 896,
    x = 0.556, y = 0.348,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[128702] = {
    name = "Roko",
    mapID = 895,
    x = 0.796, y = 0.818,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[130368] = {
    name = "Samuel D. Colton III",
    mapID = 1161,
    x = 0.75, y = 0.1,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[130399] = {
    name = "Zooey Inksprocket",
    mapID = 1161,
    x = 0.734, y = 0.063,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[130786] = {
    name = "Hobbs",
    mapID = 942,
    x = 0.583, y = 0.703,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[132228] = {
    name = "Elric Whalgrene",
    mapID = 1161,
    x = 0.741, y = 0.0675,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[133536] = {
    name = "Grix \\\"Ironfists\\\" Barlow",
    mapID = 1161,
    x = 0.735, y = 0.0857,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[134446] = {
    name = "Francois",
    mapID = 895,
    x = 0.528, y = 0.311,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — Must have 1 million gold in your inventory before he will talk to you. You do NOT lose any gold in this transaction.",
}

VendorLocations[135446] = {
    name = "Vindicator Jaelaana",
    mapID = 1161,
    x = 0.693, y = 0.249,
    faction = "Alliance",
    types = { "transmog", "faction" },
    repFactionID = 2159,
}

VendorLocations[135793] = {
    name = "Collector Kojo",
    mapID = 942,
    x = 0.404, y = 0.364,
    faction = "Alliance",
    types = { "transmog", "faction" },
    repFactionID = 2163,
    minStanding = 9000,
}

VendorLocations[135800] = {
    name = "Sister Lilyana",
    mapID = 942,
    x = 0.592, y = 0.693,
    faction = "Alliance",
    types = { "transmog", "faction" },
    repFactionID = 2162,
    minStanding = 9000,
}

VendorLocations[135808] = {
    name = "Provisioner Fray",
    mapID = 1161,
    x = 0.675, y = 0.215,
    faction = "Alliance",
    types = { "transmog", "faction" },
    repFactionID = 2160,
    minStanding = 3000,
}

VendorLocations[135815] = {
    name = "Quartermaster Alcorn",
    mapID = 896,
    x = 0.378, y = 0.49,
    faction = "Alliance",
    types = { "transmog", "faction" },
    repFactionID = 2161,
    minStanding = 9000,
    note = "ATT — This gives your hunter's pet a ghostly appearance for 30 minutes.",
}

VendorLocations[136041] = {
    name = "Emily Fairweather",
    mapID = 1161,
    x = 0.741, y = 0.114,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[136059] = {
    name = "Layla Evenkeel",
    mapID = 1161,
    x = 0.776, y = 0.143,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[136063] = {
    name = "Cassandra Brennor",
    mapID = 1161,
    x = 0.755, y = 0.126,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[136071] = {
    name = "Daniel Brineweaver",
    mapID = 1161,
    x = 0.768, y = 0.112,
    faction = "Alliance",
    types = { "general" },
    note = "ATT — This recipe is for relearning the Synchronous Thread after you have completed the Tools of the Trade questline.",
}

VendorLocations[136655] = {
    name = "Alisha Darkwater",
    mapID = 896,
    x = 0.267, y = 0.725,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[136674] = {
    name = "Madeline Netley",
    mapID = 942,
    x = 0.316, y = 0.672,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[137431] = {
    name = "Annie Lacier",
    mapID = 1161,
    x = 0.506, y = 0.498,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[138021] = {
    name = "Sally Boltwrench",
    mapID = 896,
    x = 0.376, y = 0.258,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[138096] = {
    name = "Sanya Wraithschilde",
    mapID = 942,
    x = 0.508, y = 0.336,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[141009] = {
    name = "Col. Tenders",
    mapID = 1161,
    x = 0.598, y = 0.222,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[142065] = {
    name = "Dana Pull",
    mapID = 1161,
    x = 0.508, y = 0.46,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[142115] = {
    name = "Fiona",
    mapID = 1161,
    x = 0.68, y = 0.412,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[142165] = {
    name = "Arwin Blakemore",
    mapID = 1161,
    x = 0.665, y = 0.409,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[142169] = {
    name = "Phil Gresham",
    mapID = 1161,
    x = 0.706, y = 0.196,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[142190] = {
    name = "Alchemist Hart",
    mapID = 1161,
    x = 0.668, y = 0.41,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[142197] = {
    name = "Nigel Rifthold",
    mapID = 896,
    x = 0.522, y = 0.316,
    faction = "Alliance",
    types = { "general" },
    note = "ATT — In order to unlock this vendor you will need to buy 10 \\\"Tirasreli Gourmet Chocolate\\\", then find the tree house at his co",
}

VendorLocations[142564] = {
    name = "Leedan Gustaf",
    mapID = 1161,
    x = 0.56, y = 0.268,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[142691] = {
    name = "Tricky Nick",
    mapID = 1161,
    x = 0.567, y = 0.47,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[142838] = {
    name = "Grumpy Grimble",
    mapID = 895,
    x = 0.498, y = 0.368,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — When you have 150 BfA Inscription, speak to the NPC and he will teach you the technique.",
}

VendorLocations[143560] = {
    name = "Marshal Gabriel",
    mapID = 1161,
    x = 0.562, y = 0.257,
    faction = "Alliance",
    types = { "food" },
    note = "ATT — Requires completing the achievement |cffffff00Battlefield Brawler|r. ",
}

VendorLocations[145838] = {
    name = "Marshal Frazer",
    mapID = 1161,
    x = 0.564, y = 0.269,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[148024] = {
    name = "Dodger",
    mapID = 1161,
    x = 0.689, y = 0.17,
    faction = "Alliance",
    types = { "general" },
    note = "ATT — To unlock this vendor, win PvP pet battles until the mission \\\"A Shady Message\\\" spawns. Complete the mission, and you'll ",
}

VendorLocations[148228] = {
    name = "Marvin Sipsquall",
    mapID = 1161,
    x = 0.768, y = 0.116,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[148922] = {
    name = "Captain Klarisa",
    mapID = 1161,
    x = 0.66, y = 0.322,
    faction = "Alliance",
    types = { "food", "transmog" },
    note = "ATT — |CFFFF0000Turn in to Cyrus Crestfall in Boralus for Proudmoore Admiralty rep.|r",
}

VendorLocations[148927] = {
    name = "Provisioner Stoutforge",
    mapID = 1161,
    x = 0.668, y = 0.257,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[149045] = {
    name = "Thaumaturge Vashreen",
    mapID = 1161,
    x = 0.717, y = 0.137,
    faction = "Alliance",
    types = { "food" },
    note = "ATT — Requires completing the achievement |cffffff00Battle for Azeroth Keystone Master|r. ",
}

VendorLocations[150716] = {
    name = "Stolen Royal Vendorbot",
    mapID = 1462,
    x = 0.737, y = 0.369,
    faction = "Neutral",
    types = { "food", "transmog", "faction" },
    repFactionID = 2391,
    note = "ATT — Must be an engineer, have completed the |cFFFFD700Iteration Is Key|r quest, and have a crafted Ub3r-Spanner for this to ",
}

VendorLocations[151462] = {
    name = "Danielle Anglers",
    mapID = 1462,
    x = 0.372, y = 0.4716,
    faction = "Neutral",
    types = { "food" },
    note = "ATT — This is a toy since 11.1.5. If you buy the goggles from the vendor, the toy is automatically added to your Toy Box. You ",
}

VendorLocations[152321] = {
    name = "Cork Stuttguard",
    mapID = 1462,
    x = 0.633, y = 0.429,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[153393] = {
    name = "Barry",
    mapID = 942,
    x = 0.692, y = 0.642,
    faction = "Alliance",
    types = { "food", "faction" },
    repFactionID = 2395,
    minStanding = 42000,
}

VendorLocations[161091] = {
    name = "Captain Nightrunner",
    mapID = 1161,
    x = 0.662, y = 0.321,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[161565] = {
    name = "Bragni",
    mapID = 1161,
    x = 0.563, y = 0.272,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[239840] = {
    name = "Churbro",
    mapID = 1161,
    x = 0.708, y = 0.173,
    faction = "Alliance",
    types = { "food", "transmog" },
}

VendorLocations[246721] = {
    name = "Janey Forrest",
    mapID = 1161,
    x = 0.563, y = 0.458,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[252313] = {
    name = "Caspian",
    mapID = 942,
    x = 0.595, y = 0.696,
    faction = "Alliance",
    types = { "faction" },
    repFactionID = 2162,
    minStanding = 3000,
}

VendorLocations[252316] = {
    name = "Delphine",
    mapID = 895,
    x = 0.534, y = 0.313,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[252345] = {
    name = "Pearl Barlow",
    mapID = 1161,
    x = 0.707, y = 0.157,
    faction = "Alliance",
    types = { "general" },
}

------------------------------------------------------------------
-- Battle for Azeroth (Zandalar)
------------------------------------------------------------------

VendorLocations[122463] = {
    name = "Plen",
    mapID = 1165,
    x = 0.477, y = 0.916,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[122465] = {
    name = "Koatini",
    mapID = 1165,
    x = 0.488, y = 0.91,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[122695] = {
    name = "Seshuli",
    mapID = 1165,
    x = 0.47, y = 0.378,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[122698] = {
    name = "Xanjo",
    mapID = 1165,
    x = 0.44, y = 0.346,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[122700] = {
    name = "Pin'jin the Patient",
    mapID = 1165,
    x = 0.445, y = 0.339,
    faction = "Horde",
    types = { "general" },
    note = "ATT — This recipe is for relearning the Synchronous Thread after you have completed the Tools of the Trade questline.",
}

VendorLocations[122702] = {
    name = "Enchantress Quinni",
    mapID = 1165,
    x = 0.471, y = 0.357,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[122703] = {
    name = "Clever Kumali",
    mapID = 1165,
    x = 0.422, y = 0.38,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[124034] = {
    name = "Golkada",
    mapID = 862,
    x = 0.712, y = 0.296,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[125311] = {
    name = "Trader Nog",
    mapID = 1165,
    x = 0.571, y = 0.914,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[125879] = {
    name = "Talutu",
    mapID = 1165,
    x = 0.485, y = 0.87,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[126329] = {
    name = "Headhunter Lani",
    mapID = 1165,
    x = 0.406, y = 0.168,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[126330] = {
    name = "Rakle the Wretched",
    mapID = 1165,
    x = 0.347, y = 0.115,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[126833] = {
    name = "Blind Wunja",
    mapID = 863,
    x = 0.354, y = 0.552,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[127112] = {
    name = "Forgemaster Zak'aal",
    mapID = 1165,
    x = 0.434, y = 0.383,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[128078] = {
    name = "Bri'tani",
    mapID = 1165,
    x = 0.394, y = 0.174,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[129354] = {
    name = "Rhan'ka",
    mapID = 864,
    x = 0.435, y = 0.602,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[129376] = {
    name = "Lenne",
    mapID = 1165,
    x = 0.47, y = 0.914,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[129597] = {
    name = "Trader Haw'li",
    mapID = 1165,
    x = 0.378, y = 0.147,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[130901] = {
    name = "Chronicler Grazzul",
    mapID = 1165,
    x = 0.423, y = 0.397,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[131255] = {
    name = "Rawajo",
    mapID = 1165,
    x = 0.506, y = 0.118,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[131287] = {
    name = "Natal'hakata",
    mapID = 1164,
    x = 0.672, y = 0.717,
    faction = "Horde",
    types = { "transmog", "faction" },
    repFactionID = 2103,
    minStanding = 9000,
}

VendorLocations[131840] = {
    name = "Shuga Blastcaps",
    mapID = 1165,
    x = 0.45, y = 0.406,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[132011] = {
    name = "Shoak",
    mapID = 863,
    x = 0.669, y = 0.42,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[132097] = {
    name = "Happy Holaua",
    mapID = 1165,
    x = 0.56, y = 0.322,
    faction = "Horde",
    types = { "general" },
    note = "ATT — Complete the \\\"Get Hek'd\\\" achievement for this item to appear on the vendor.",
}

VendorLocations[132114] = {
    name = "Griftah",
    mapID = 1165,
    x = 0.347, y = 0.115,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[132130] = {
    name = "Granda Watae",
    mapID = 1165,
    x = 0.422, y = 0.358,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[132153] = {
    name = "\\\"Black Eye\\\" Zenru",
    mapID = 1165,
    x = 0.537, y = 0.859,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[133230] = {
    name = "Holaja Da Drunk",
    mapID = 1165,
    x = 0.572, y = 0.89,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[133833] = {
    name = "Rikati",
    mapID = 864,
    x = 0.404, y = 0.554,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[134345] = {
    name = "Collector Kojo",
    mapID = 862,
    x = 0.715, y = 0.303,
    faction = "Horde",
    types = { "transmog", "faction" },
    repFactionID = 2163,
    minStanding = 9000,
}

VendorLocations[135249] = {
    name = "Meatminder Teki",
    mapID = 862,
    x = 0.668, y = 0.416,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[135400] = {
    name = "Jenoh",
    mapID = 864,
    x = 0.295, y = 0.594,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[135447] = {
    name = "Ransa Greyfeather",
    mapID = 862,
    x = 0.58, y = 0.626,
    faction = "Horde",
    types = { "transmog", "faction" },
    repFactionID = 2157,
    minStanding = 42000,
}

VendorLocations[135459] = {
    name = "Provisioner Lija",
    mapID = 863,
    x = 0.391, y = 0.794,
    faction = "Horde",
    types = { "transmog", "faction" },
    repFactionID = 2156,
}

VendorLocations[135804] = {
    name = "Hoarder Jena",
    mapID = 864,
    x = 0.567, y = 0.497,
    faction = "Horde",
    types = { "transmog", "faction" },
    repFactionID = 2158,
    minStanding = 9000,
}

VendorLocations[136219] = {
    name = "Mona",
    mapID = 862,
    x = 0.716, y = 0.294,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[138033] = {
    name = "Elly Fraze",
    mapID = 1165,
    x = 0.484, y = 0.895,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[138099] = {
    name = "Isabel Marigan",
    mapID = 862,
    x = 0.764, y = 0.49,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[138919] = {
    name = "Tukuku",
    mapID = 864,
    x = 0.62, y = 0.208,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[140137] = {
    name = "Bugcatcher Cal'yoon",
    mapID = 862,
    x = 0.77, y = 0.158,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[140139] = {
    name = "Spearmon Kol",
    mapID = 862,
    x = 0.77, y = 0.166,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[141954] = {
    name = "Arbo",
    mapID = 1165,
    x = 0.438, y = 0.244,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[142552] = {
    name = "Ozgrom Ragefang",
    mapID = 862,
    x = 0.526, y = 0.582,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[142839] = {
    name = "Old Jen'tay",
    mapID = 862,
    x = 0.762, y = 0.398,
    faction = "Horde",
    types = { "general" },
    note = "ATT — When you have 150 BfA Inscription, speak to the NPC and he will teach you the technique.",
}

VendorLocations[143138] = {
    name = "Rin'wosho the Trader",
    mapID = 1165,
    x = 0.55, y = 0.868,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[143555] = {
    name = "Xander Silberman",
    mapID = 862,
    x = 0.516, y = 0.582,
    faction = "Horde",
    types = { "food" },
    note = "ATT — Requires completing the achievement |cffffff00Battlefield Brawler|r. ",
}

VendorLocations[145837] = {
    name = "Violet Shadowmend",
    mapID = 862,
    x = 0.516, y = 0.578,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[148080] = {
    name = "Olly",
    mapID = 1165,
    x = 0.4551, y = 0.8645,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[148810] = {
    name = "Gottum",
    mapID = 863,
    x = 0.712, y = 0.555,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[148923] = {
    name = "Captain Zen'taga",
    mapID = 1165,
    x = 0.444, y = 0.944,
    faction = "Horde",
    types = { "food", "transmog" },
}

VendorLocations[148924] = {
    name = "Provisioner Mukra",
    mapID = 1165,
    x = 0.5122, y = 0.9508,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[161067] = {
    name = "Captain Kitt",
    mapID = 1165,
    x = 0.444, y = 0.943,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[161590] = {
    name = "Jinxy Blastwheel",
    mapID = 862,
    x = 0.527, y = 0.582,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[251921] = {
    name = "Arcanist Peroleth",
    mapID = 862,
    x = 0.581, y = 0.625,
    faction = "Horde",
    types = { "faction" },
    repFactionID = 2157,
    minStanding = 9000,
}

VendorLocations[252326] = {
    name = "T'lama",
    mapID = 1164,
    x = 0.366, y = 0.601,
    faction = "Horde",
    types = { "faction" },
    repFactionID = 2103,
}

------------------------------------------------------------------
-- Cataclysm (Maelstrom)
------------------------------------------------------------------

VendorLocations[36430] = {
    name = "Sally \\\"Salvager\\\" Sandscrew",
    mapID = 174,
    x = 0.282, y = 0.762,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[36432] = {
    name = "Chawg",
    mapID = 174,
    x = 0.37, y = 0.778,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[36464] = {
    name = "Chawg",
    mapID = 174,
    x = 0.244, y = 0.642,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[36465] = {
    name = "Chawg",
    mapID = 174,
    x = 0.358, y = 0.67,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[37761] = {
    name = "Sally \\\"Salvager\\\" Sandscrew",
    mapID = 194,
    x = 0.598, y = 0.726,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[39063] = {
    name = "Chawg",
    mapID = 174,
    x = 0.366, y = 0.424,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[44972] = {
    name = "Rocky Cliffedge",
    mapID = 207,
    x = 0.248, y = 0.626,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[45286] = {
    name = "KTC Train-a-Tron Deluxe",
    mapID = 174,
    x = 0.457, y = 0.658,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[45408] = {
    name = "D'lom the Collector",
    mapID = 207,
    x = 0.568, y = 0.132,
    faction = "Neutral",
    types = { "food", "transmog", "faction" },
    repFactionID = 1171,
    minStanding = 3000,
}

------------------------------------------------------------------
-- Wrath of the Lich King (Northrend)
------------------------------------------------------------------

VendorLocations[23735] = {
    name = "Bartleby Armorfist",
    mapID = 117,
    x = 0.596, y = 0.636,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[23802] = {
    name = "Wink Sprinklesprankle",
    mapID = 117,
    x = 0.584, y = 0.6275,
    faction = "Alliance",
    types = { "general" },
    note = "ATT — Walks in a circle inside Valgarde Inn.",
}

VendorLocations[24028] = {
    name = "Talu Frosthoof",
    mapID = 117,
    x = 0.482, y = 0.11,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[24330] = {
    name = "Orson Locke",
    mapID = 117,
    x = 0.538, y = 0.668,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[24341] = {
    name = "Barnabas Frye",
    mapID = 117,
    x = 0.795, y = 0.3047,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[24347] = {
    name = "Alexis Walker",
    mapID = 117,
    x = 0.792, y = 0.288,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[24539] = {
    name = "\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"Silvermoon\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" Harry",
    mapID = 117,
    x = 0.35, y = 0.808,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[25206] = {
    name = "Ahlurglgr",
    mapID = 114,
    x = 0.43, y = 0.138,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[26229] = {
    name = "Tiernan Anvilheart",
    mapID = 116,
    x = 0.596, y = 0.278,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[26484] = {
    name = "Hugh Glass",
    mapID = 116,
    x = 0.691, y = 0.401,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[26697] = {
    name = "Tewah Chillmane",
    mapID = 114,
    x = 0.766, y = 0.372,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[26868] = {
    name = "Provisioner Lorkran",
    mapID = 116,
    x = 0.226, y = 0.66,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[26941] = {
    name = "Brokkan Bear-Arms",
    mapID = 114,
    x = 0.4134, y = 0.3461,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[27012] = {
    name = "Beem Goldsprocket",
    mapID = 114,
    x = 0.577, y = 0.7232,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[27139] = {
    name = "Librarian Whitley",
    mapID = 114,
    x = 0.464, y = 0.326,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[27142] = {
    name = "Librarian Jeffers",
    mapID = 114,
    x = 0.4626, y = 0.3284,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[27147] = {
    name = "Librarian Erickson",
    mapID = 114,
    x = 0.467, y = 0.325,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[27151] = {
    name = "Deniigi",
    mapID = 117,
    x = 0.256, y = 0.576,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[27185] = {
    name = "Kuk'uq",
    mapID = 115,
    x = 0.494, y = 0.752,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[27391] = {
    name = "Woodsman Drake",
    mapID = 116,
    x = 0.324, y = 0.599,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[27730] = {
    name = "Purkom",
    mapID = 116,
    x = 0.138, y = 0.862,
    faction = "Horde",
    types = { "transmog" },
    note = "ATT — Is only visible while your faction controls Venture Bay.",
}

VendorLocations[27760] = {
    name = "\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"Grizzly\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" D. Adams",
    mapID = 116,
    x = 0.138, y = 0.864,
    faction = "Alliance",
    types = { "transmog" },
    note = "ATT — Is only visible while your faction controls Venture Bay.",
}

VendorLocations[28027] = {
    name = "High-Oracle Soo-say",
    mapID = 119,
    x = 0.5457, y = 0.5634,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[28038] = {
    name = "Purser Boulian",
    mapID = 119,
    x = 0.268, y = 0.593,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[28040] = {
    name = "Mardan Thunderhoof",
    mapID = 119,
    x = 0.272, y = 0.596,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[28682] = {
    name = "Inzi Charmlight",
    mapID = 125,
    x = 0.442, y = 0.623,
    faction = "Alliance",
    types = { "food" },
    note = "ATT — Inzi is walking around in the Tavern.",
}

VendorLocations[28714] = {
    name = "Ildine Sorrowspear",
    mapID = 125,
    x = 0.3878, y = 0.4156,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[28715] = {
    name = "Endora Moorehead",
    mapID = 125,
    x = 0.3862, y = 0.5557,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[28722] = {
    name = "Bryan Landers",
    mapID = 125,
    x = 0.39, y = 0.26,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[28726] = {
    name = "Dominique Stefano",
    mapID = 125,
    x = 0.356, y = 0.344,
    faction = "Alliance",
    types = { "general" },
    note = "ATT — Can be bought from Leatherworking- and Tailoring Suppliers, as well as some Trade vendors around the world.",
}

VendorLocations[28776] = {
    name = "Elizabeth Ross",
    mapID = 125,
    x = 0.518, y = 0.558,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[28951] = {
    name = "Breanni",
    mapID = 125,
    x = 0.587, y = 0.392,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[28989] = {
    name = "Aemara",
    mapID = 125,
    x = 0.606, y = 0.522,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[28990] = {
    name = "Anthony Durain",
    mapID = 125,
    x = 0.468, y = 0.276,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[28991] = {
    name = "Valaden Silverblade",
    mapID = 125,
    x = 0.545, y = 0.629,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[28992] = {
    name = "Valerie Langrom",
    mapID = 125,
    x = 0.516, y = 0.724,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[28994] = {
    name = "Wanda Chanter",
    mapID = 125,
    x = 0.491, y = 0.732,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[28995] = {
    name = "Paldesse",
    mapID = 125,
    x = 0.438, y = 0.494,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[28997] = {
    name = "Griselda Hunderland",
    mapID = 125,
    x = 0.463, y = 0.272,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[29014] = {
    name = "Grakjek",
    mapID = 119,
    x = 0.558, y = 0.702,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[29244] = {
    name = "Jesse Masters",
    mapID = 116,
    x = 0.316, y = 0.598,
    faction = "Alliance",
    types = { "food" },
    note = "ATT — Access to this vendor requires completing 'Replenishing the Storehouse' and the following 'Take Their Rear!'.",
}

VendorLocations[29275] = {
    name = "Aspen Grove Supplier",
    mapID = 116,
    x = 0.346, y = 0.55,
    faction = "Alliance",
    types = { "food" },
    note = "ATT — This vendor is only friendly to Alliance players, and even then it only applies until you finalise your relationship wit",
}

VendorLocations[29476] = {
    name = "Dagna Flintlock",
    mapID = 125,
    x = 0.6, y = 0.526,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[29478] = {
    name = "Jepetto Joybuzz",
    mapID = 125,
    x = 0.445, y = 0.457,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[29491] = {
    name = "Karandonna",
    mapID = 125,
    x = 0.444, y = 0.489,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[29494] = {
    name = "Shen Kang Cheng",
    mapID = 125,
    x = 0.496, y = 0.726,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[29495] = {
    name = "Norvin Alderman",
    mapID = 125,
    x = 0.447, y = 0.489,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[29496] = {
    name = "Kerta the Bold",
    mapID = 125,
    x = 0.544, y = 0.62,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[29497] = {
    name = "Walther Whiteford",
    mapID = 125,
    x = 0.558, y = 0.628,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[29499] = {
    name = "Bartram Haller",
    mapID = 125,
    x = 0.535, y = 0.624,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[29510] = {
    name = "Linna Bruder",
    mapID = 125,
    x = 0.346, y = 0.344,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[29511] = {
    name = "Lalla Brightweave",
    mapID = 125,
    x = 0.366, y = 0.328,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[29512] = {
    name = "Ainderu Summerleaf",
    mapID = 125,
    x = 0.364, y = 0.338,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[29523] = {
    name = "Bragund Brightlink",
    mapID = 125,
    x = 0.512, y = 0.728,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[29527] = {
    name = "Orton Bennet",
    mapID = 125,
    x = 0.519, y = 0.551,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[29528] = {
    name = "Debbi Moore",
    mapID = 125,
    x = 0.4961, y = 0.5547,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[29535] = {
    name = "Alchemist Cinesra",
    mapID = 126,
    x = 0.632, y = 0.114,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[29537] = {
    name = "Darahir",
    mapID = 126,
    x = 0.634, y = 0.162,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[29538] = {
    name = "Hexil Garrot",
    mapID = 126,
    x = 0.606, y = 0.119,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[29547] = {
    name = "Applebough",
    mapID = 125,
    x = 0.4344, y = 0.5696,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[29548] = {
    name = "Aimee",
    mapID = 125,
    x = 0.364, y = 0.338,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[29628] = {
    name = "Angelique Butler",
    mapID = 125,
    x = 0.37, y = 0.374,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[29702] = {
    name = "Chameli Banaphash",
    mapID = 125,
    x = 0.448, y = 0.466,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[29703] = {
    name = "Sheddle Glossgleam",
    mapID = 125,
    x = 0.45, y = 0.465,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[29714] = {
    name = "Lucian Trias",
    mapID = 125,
    x = 0.55, y = 0.311,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[29715] = {
    name = "Fialla Sweetberry",
    mapID = 125,
    x = 0.534, y = 0.346,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[29716] = {
    name = "Clockwork Assistant",
    mapID = 125,
    x = 0.448, y = 0.463,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[29744] = {
    name = "Rork Sharpchin",
    mapID = 120,
    x = 0.2882, y = 0.7411,
    faction = "Alliance",
    types = { "food", "transmog" },
}

VendorLocations[29904] = {
    name = "Smilin' Slirk Brassknob",
    mapID = 120,
    x = 0.4109, y = 0.8594,
    faction = "Alliance",
    types = { "food", "innkeeper" },
}

VendorLocations[29907] = {
    name = "Xark Bolthammer",
    mapID = 120,
    x = 0.4096, y = 0.8643,
    faction = "Alliance",
    types = { "repair" },
}

VendorLocations[30006] = {
    name = "Warsmith Sigfinna",
    mapID = 120,
    x = 0.4749, y = 0.7038,
    faction = "Alliance",
    types = { "repair", "transmog" },
}

VendorLocations[30067] = {
    name = "Initiate Claget",
    mapID = 118,
    x = 0.204, y = 0.478,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[30431] = {
    name = "Veteran Crusader Aliocha Segard",
    mapID = 118,
    x = 0.876, y = 0.756,
    faction = "Neutral",
    types = { "food", "transmog", "faction" },
    repFactionID = 1106,
    minStanding = 3000,
}

VendorLocations[30464] = {
    name = "\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"Honest\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" Max",
    mapID = 120,
    x = 0.406, y = 0.846,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[30472] = {
    name = "Olut Alegut",
    mapID = 120,
    x = 0.37, y = 0.496,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[30488] = {
    name = "Travis Day",
    mapID = 123,
    x = 0.51, y = 0.174,
    faction = "Alliance",
    types = { "food", "transmog" },
}

VendorLocations[30489] = {
    name = "Morgan Day",
    mapID = 123,
    x = 0.489, y = 0.175,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[30885] = {
    name = "Blazik Fireclaw",
    mapID = 126,
    x = 0.595, y = 0.579,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[31051] = {
    name = "Sorceress Kaylana",
    mapID = 123,
    x = 0.485, y = 0.212,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[31101] = {
    name = "Hoodoo Master Fu'jin",
    mapID = 123,
    x = 0.219, y = 0.354,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[31238] = {
    name = "Hira Snowdawn",
    mapID = 125,
    x = 0.6973, y = 0.4545,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[31247] = {
    name = "Roxi Ramrocket",
    mapID = 120,
    x = 0.406, y = 0.848,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[31579] = {
    name = "Arcanist Adurin",
    mapID = 125,
    x = 0.372, y = 0.545,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[31580] = {
    name = "Arcanist Ivrenne",
    mapID = 125,
    x = 0.369, y = 0.55,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[31581] = {
    name = "Magister Brasael",
    mapID = 125,
    x = 0.661, y = 0.234,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[31582] = {
    name = "Magistrix Lambriesse",
    mapID = 125,
    x = 0.656, y = 0.227,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[31863] = {
    name = "Nargle Lashcord",
    mapID = 126,
    x = 0.587, y = 0.59,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[31864] = {
    name = "Xazi Smolderpipe",
    mapID = 126,
    x = 0.588, y = 0.596,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[31865] = {
    name = "Zom Bocom",
    mapID = 126,
    x = 0.591, y = 0.596,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[31910] = {
    name = "Geen",
    mapID = 119,
    x = 0.546, y = 0.561,
    faction = "Neutral",
    types = { "food", "transmog", "faction" },
    repFactionID = 1105,
    minStanding = 3000,
}

VendorLocations[31911] = {
    name = "Tanak",
    mapID = 119,
    x = 0.551, y = 0.69,
    faction = "Neutral",
    types = { "food", "transmog", "faction" },
    repFactionID = 1104,
    minStanding = 3000,
}

VendorLocations[31916] = {
    name = "Tanaika",
    mapID = 117,
    x = 0.254, y = 0.586,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[32172] = {
    name = "Harold Winston",
    mapID = 125,
    x = 0.402, y = 0.343,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[32216] = {
    name = "Mei Francis",
    mapID = 125,
    x = 0.578, y = 0.425,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[32253] = {
    name = "Kyunghee",
    mapID = 125,
    x = 0.716, y = 0.318,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[32287] = {
    name = "Archmage Alvareaux",
    mapID = 125,
    x = 0.252, y = 0.478,
    faction = "Alliance",
    types = { "food", "transmog", "faction" },
    repFactionID = 1090,
    minStanding = 3000,
}

VendorLocations[32294] = {
    name = "Knight Dameron",
    mapID = 123,
    x = 0.517, y = 0.172,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[32296] = {
    name = "Stone Guard Mukar",
    mapID = 123,
    x = 0.517, y = 0.172,
    faction = "Horde",
    types = { "food", "transmog" },
}

VendorLocations[32337] = {
    name = "Christi Stockton",
    mapID = 125,
    x = 0.538, y = 0.326,
    faction = "Alliance",
    types = { "food", "transmog" },
}

VendorLocations[32419] = {
    name = "Umbiwa",
    mapID = 125,
    x = 0.674, y = 0.322,
    faction = "Horde",
    types = { "general" },
    note = "ATT — Umbiwa is walking around in the Tavern.",
}

VendorLocations[32420] = {
    name = "Mimbihi",
    mapID = 125,
    x = 0.674, y = 0.322,
    faction = "Horde",
    types = { "food" },
    note = "ATT — Mimbihi is walking around in the Tavern.",
}

VendorLocations[32509] = {
    name = "Brammold Deepmine",
    mapID = 125,
    x = 0.51, y = 0.536,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[32514] = {
    name = "Vanessa Sellers",
    mapID = 125,
    x = 0.384, y = 0.411,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[32515] = {
    name = "Braeg Stoutbeard",
    mapID = 125,
    x = 0.3733, y = 0.2869,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[32533] = {
    name = "Cielstrasza",
    mapID = 115,
    x = 0.598, y = 0.53,
    faction = "Neutral",
    types = { "food", "transmog", "faction" },
    repFactionID = 1091,
    minStanding = 3000,
    note = "ATT — This version is only visible on the vendor when you aren't at the required reputation to purchase it yet on your current",
}

VendorLocations[32538] = {
    name = "Duchess Mynx",
    mapID = 118,
    x = 0.434, y = 0.206,
    faction = "Neutral",
    types = { "food", "transmog", "faction" },
    repFactionID = 1098,
    minStanding = 3000,
}

VendorLocations[32540] = {
    name = "Lillehoff",
    mapID = 120,
    x = 0.6615, y = 0.6159,
    faction = "Alliance",
    types = { "food", "mounts", "profession" },
}

VendorLocations[32564] = {
    name = "Logistics Officer Silverstone",
    mapID = 114,
    x = 0.577, y = 0.664,
    faction = "Alliance",
    types = { "transmog", "faction" },
    repFactionID = 1037,
    minStanding = 21000,
}

VendorLocations[32565] = {
    name = "Gara Skullcrush",
    mapID = 114,
    x = 0.414, y = 0.537,
    faction = "Horde",
    types = { "transmog", "faction" },
    repFactionID = 1052,
    minStanding = 21000,
}

VendorLocations[32631] = {
    name = "Alfred Copperworth",
    mapID = 125,
    x = 0.262, y = 0.392,
    faction = "Alliance",
    types = { "food" },
    note = "ATT — Walks around the Purple Parlour.",
}

VendorLocations[32763] = {
    name = "Sairuk",
    mapID = 115,
    x = 0.486, y = 0.756,
    faction = "Neutral",
    types = { "transmog", "profession", "faction" },
    repFactionID = 1073,
    minStanding = 3000,
}

VendorLocations[32773] = {
    name = "Logistics Officer Brighton",
    mapID = 117,
    x = 0.596, y = 0.638,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[32774] = {
    name = "Sebastian Crane",
    mapID = 117,
    x = 0.796, y = 0.306,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[33307] = {
    name = "Corporal Arthur Flew",
    mapID = 118,
    x = 0.764, y = 0.192,
    faction = "Alliance",
    types = { "food", "transmog" },
}

VendorLocations[33310] = {
    name = "Derrick Brindlebeard",
    mapID = 118,
    x = 0.764, y = 0.194,
    faction = "Alliance",
    types = { "food", "transmog" },
}

VendorLocations[33553] = {
    name = "Freka Bloodaxe",
    mapID = 118,
    x = 0.764, y = 0.242,
    faction = "Horde",
    types = { "food", "transmog" },
}

VendorLocations[33554] = {
    name = "Samamba",
    mapID = 118,
    x = 0.76, y = 0.244,
    faction = "Horde",
    types = { "food", "transmog" },
}

VendorLocations[33555] = {
    name = "Eliza Killian",
    mapID = 118,
    x = 0.764, y = 0.24,
    faction = "Horde",
    types = { "food", "transmog" },
}

VendorLocations[33556] = {
    name = "Doru Thunderhorn",
    mapID = 118,
    x = 0.762, y = 0.244,
    faction = "Horde",
    types = { "food", "transmog" },
}

VendorLocations[33557] = {
    name = "Trellis Morningsun",
    mapID = 118,
    x = 0.762, y = 0.238,
    faction = "Horde",
    types = { "food", "transmog" },
}

VendorLocations[33594] = {
    name = "Fizzix Blastbolt",
    mapID = 118,
    x = 0.722, y = 0.208,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[33595] = {
    name = "Mera Mistrunner",
    mapID = 118,
    x = 0.724, y = 0.208,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[33602] = {
    name = "Anuur",
    mapID = 118,
    x = 0.714, y = 0.208,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[33650] = {
    name = "Rillie Spindlenut",
    mapID = 118,
    x = 0.764, y = 0.196,
    faction = "Alliance",
    types = { "food", "transmog" },
}

VendorLocations[33653] = {
    name = "Rook Hawkfist",
    mapID = 118,
    x = 0.762, y = 0.192,
    faction = "Alliance",
    types = { "food", "transmog" },
}

VendorLocations[33657] = {
    name = "Irisee",
    mapID = 118,
    x = 0.762, y = 0.192,
    faction = "Alliance",
    types = { "food", "transmog" },
}

VendorLocations[33853] = {
    name = "Broxel Goldgrasp",
    mapID = 118,
    x = 0.73, y = 0.23,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[33921] = {
    name = "Nargle Lashcord",
    mapID = 126,
    x = 0.587, y = 0.59,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[33922] = {
    name = "Xazi Smolderpipe",
    mapID = 126,
    x = 0.588, y = 0.596,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[33923] = {
    name = "Zom Bocom",
    mapID = 126,
    x = 0.591, y = 0.596,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[33925] = {
    name = "Zom Bocom",
    mapID = 126,
    x = 0.591, y = 0.596,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[33926] = {
    name = "Xazi Smolderpipe",
    mapID = 126,
    x = 0.588, y = 0.596,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[33927] = {
    name = "Nargle Lashcord",
    mapID = 126,
    x = 0.587, y = 0.59,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[33936] = {
    name = "Nargle Lashcord",
    mapID = 126,
    x = 0.587, y = 0.59,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[33937] = {
    name = "Xazi Smolderpipe",
    mapID = 126,
    x = 0.588, y = 0.596,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[33938] = {
    name = "Zom Bocom",
    mapID = 126,
    x = 0.591, y = 0.596,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[33963] = {
    name = "Magister Sarien",
    mapID = 125,
    x = 0.657, y = 0.244,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[33964] = {
    name = "Arcanist Firael",
    mapID = 125,
    x = 0.387, y = 0.551,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[34087] = {
    name = "Trapjaw Rix",
    mapID = 126,
    x = 0.599, y = 0.57,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[34092] = {
    name = "Trapjaw Rix",
    mapID = 126,
    x = 0.599, y = 0.57,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[34095] = {
    name = "Trapjaw Rix",
    mapID = 126,
    x = 0.599, y = 0.57,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[34252] = {
    name = "Dubin Clay",
    mapID = 125,
    x = 0.462, y = 0.272,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[34772] = {
    name = "Vasarin Redmorn",
    mapID = 118,
    x = 0.762, y = 0.24,
    faction = "Horde",
    types = { "transmog", "faction" },
    repFactionID = 1124,
    minStanding = 42000,
}

VendorLocations[34881] = {
    name = "Hiren Loresong",
    mapID = 118,
    x = 0.762, y = 0.196,
    faction = "Alliance",
    types = { "transmog", "faction" },
    repFactionID = 1094,
    minStanding = 42000,
}

VendorLocations[34885] = {
    name = "Dame Evniki Kapsalis",
    mapID = 118,
    x = 0.694, y = 0.231,
    faction = "Alliance",
    types = { "food", "transmog" },
}

VendorLocations[35131] = {
    name = "Durgan Thunderbeak",
    mapID = 114,
    x = 0.589, y = 0.681,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[35132] = {
    name = "Tohfo Skyhoof",
    mapID = 114,
    x = 0.422, y = 0.554,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[35494] = {
    name = "Arcanist Miluria",
    mapID = 125,
    x = 0.379, y = 0.543,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[35495] = {
    name = "Magistrix Vesara",
    mapID = 125,
    x = 0.65, y = 0.23,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[35496] = {
    name = "Rueben Lauren",
    mapID = 125,
    x = 0.441, y = 0.489,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[35497] = {
    name = "Rafael Langrom",
    mapID = 125,
    x = 0.512, y = 0.715,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[35498] = {
    name = "Horace Hunderland",
    mapID = 125,
    x = 0.466, y = 0.271,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[35500] = {
    name = "Matilda Brightlink",
    mapID = 125,
    x = 0.517, y = 0.73,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[35507] = {
    name = "Enchanter Isian",
    mapID = 125,
    x = 0.372, y = 0.556,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[35508] = {
    name = "Enchanter Erodin",
    mapID = 125,
    x = 0.372, y = 0.556,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[35573] = {
    name = "Arcanist Asarina",
    mapID = 118,
    x = 0.752, y = 0.216,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[35574] = {
    name = "Magistrix Iruvia",
    mapID = 118,
    x = 0.752, y = 0.22,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[35575] = {
    name = "Champion Isimode",
    mapID = 118,
    x = 0.752, y = 0.216,
    faction = "Alliance",
    types = { "transmog" },
    note = "ATT — |CFFFF0000Purchasing this exact piece (shared appearances don't work) and letting the 2 hour timer disappear unlocks the",
}

VendorLocations[35576] = {
    name = "Champion Faesrol",
    mapID = 118,
    x = 0.752, y = 0.22,
    faction = "Horde",
    types = { "transmog" },
    note = "ATT — |CFFFF0000Purchasing this exact piece (shared appearances don't work) and letting the 2 hour timer disappear unlocks the",
}

VendorLocations[35577] = {
    name = "Valiant Laradia",
    mapID = 118,
    x = 0.754, y = 0.216,
    faction = "Alliance",
    types = { "transmog" },
    note = "ATT — |CFFFF0000Purchasing this exact piece (shared appearances don't work) and letting the 2 hour timer disappear unlocks the",
}

VendorLocations[35578] = {
    name = "Valiant Bressia",
    mapID = 118,
    x = 0.754, y = 0.22,
    faction = "Horde",
    types = { "transmog" },
    note = "ATT — |CFFFF0000Purchasing this exact piece (shared appearances don't work) and letting the 2 hour timer disappear unlocks the",
}

VendorLocations[35579] = {
    name = "Aspirant Forudir",
    mapID = 118,
    x = 0.754, y = 0.216,
    faction = "Alliance",
    types = { "transmog" },
    note = "ATT — |CFFFF0000Purchasing this exact piece (shared appearances don't work) and letting the 2 hour timer disappear unlocks the",
}

VendorLocations[35580] = {
    name = "Aspirant Naradiel",
    mapID = 118,
    x = 0.754, y = 0.22,
    faction = "Horde",
    types = { "transmog" },
    note = "ATT — |CFFFF0000Purchasing this exact piece (shared appearances don't work) and letting the 2 hour timer disappear unlocks the",
}

VendorLocations[37941] = {
    name = "Magister Arlan",
    mapID = 125,
    x = 0.659, y = 0.229,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[37942] = {
    name = "Arcanist Uovril",
    mapID = 125,
    x = 0.383, y = 0.544,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[39172] = {
    name = "Marshal Magruder",
    mapID = 123,
    x = 0.518, y = 0.173,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[39173] = {
    name = "Champion Ros'slai",
    mapID = 123,
    x = 0.518, y = 0.173,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[40160] = {
    name = "Frozo the Renowned",
    mapID = 125,
    x = 0.4, y = 0.289,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[40205] = {
    name = "Zom Bocom",
    mapID = 126,
    x = 0.591, y = 0.596,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[40211] = {
    name = "Nargle Lashcord",
    mapID = 126,
    x = 0.587, y = 0.59,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[40212] = {
    name = "Trapjaw Rix",
    mapID = 126,
    x = 0.593, y = 0.573,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[52534] = {
    name = "Zom Bocom",
    mapID = 126,
    x = 0.591, y = 0.596,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[52541] = {
    name = "Nargle Lashcord",
    mapID = 126,
    x = 0.587, y = 0.59,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[54653] = {
    name = "Nargle Lashcord",
    mapID = 126,
    x = 0.587, y = 0.59,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[69318] = {
    name = "Kylo Kelwin",
    mapID = 126,
    x = 0.59, y = 0.576,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[69321] = {
    name = "Herwin Steampop",
    mapID = 126,
    x = 0.594, y = 0.578,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[69971] = {
    name = "Xazi Smolderpipe",
    mapID = 126,
    x = 0.585, y = 0.583,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[69973] = {
    name = "Zom Bocom",
    mapID = 126,
    x = 0.59, y = 0.588,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[123778] = {
    name = "George Goodman",
    mapID = 902,
    x = 0.618, y = 0.353,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[123779] = {
    name = "Sophie Aaren",
    mapID = 902,
    x = 0.639, y = 0.556,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[123780] = {
    name = "Olivia Zenith",
    mapID = 902,
    x = 0.629, y = 0.432,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[123781] = {
    name = "Emery Neill",
    mapID = 902,
    x = 0.563, y = 0.684,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[123782] = {
    name = "Ezra Grimm",
    mapID = 902,
    x = 0.415, y = 0.707,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[123783] = {
    name = "Robert Pierce",
    mapID = 902,
    x = 0.581, y = 0.461,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[129141] = {
    name = "Tonraq",
    mapID = 114,
    x = 0.778, y = 0.522,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[150946] = {
    name = "Shuurt the Clothripper",
    mapID = 116,
    x = 0.498, y = 0.515,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[151794] = {
    name = "Clockwerk",
    mapID = 120,
    x = 0.338, y = 0.58,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[169718] = {
    name = "Veteran Crusader Aliocha Segard",
    mapID = 118,
    x = 0.7104, y = 0.2166,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[173791] = {
    name = "Crusader Adevald Ironbeard",
    mapID = 118,
    x = 0.694, y = 0.233,
    faction = "Alliance",
    types = { "transmog" },
    note = "ATT — While this vendor and his items are still available, the currency required to buy the items is not. Tagging the vendor a",
}

------------------------------------------------------------------
-- The Burning Crusade (Outland)
------------------------------------------------------------------

VendorLocations[16583] = {
    name = "Rohok",
    mapID = 100,
    x = 0.532, y = 0.382,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[16585] = {
    name = "Cookie One-Eye",
    mapID = 100,
    x = 0.546, y = 0.41,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[16588] = {
    name = "Apothecary Antonivich",
    mapID = 100,
    x = 0.522, y = 0.364,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[16602] = {
    name = "Floyd Pinkus",
    mapID = 100,
    x = 0.567, y = 0.375,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[16826] = {
    name = "Sid Limbardi",
    mapID = 100,
    x = 0.542, y = 0.636,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[17585] = {
    name = "Quartermaster Urgronn",
    mapID = 100,
    x = 0.549, y = 0.378,
    faction = "Horde",
    types = { "food", "transmog", "faction" },
    repFactionID = 947,
    minStanding = 3000,
}

VendorLocations[17657] = {
    name = "Logistics Officer Ulrike",
    mapID = 100,
    x = 0.566, y = 0.626,
    faction = "Alliance",
    types = { "food", "transmog", "faction" },
    repFactionID = 946,
    minStanding = 3000,
}

VendorLocations[17904] = {
    name = "Fedryen Swiftspear",
    mapID = 102,
    x = 0.793, y = 0.637,
    faction = "Alliance",
    types = { "transmog", "faction" },
    repFactionID = 942,
    minStanding = 3000,
}

VendorLocations[18005] = {
    name = "Haalrun",
    mapID = 102,
    x = 0.678, y = 0.48,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[18011] = {
    name = "Zurai",
    mapID = 102,
    x = 0.852, y = 0.546,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[18015] = {
    name = "Gambarinka",
    mapID = 102,
    x = 0.316, y = 0.492,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[18017] = {
    name = "Seer Janidi",
    mapID = 102,
    x = 0.324, y = 0.518,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[18072] = {
    name = "Elementalist Sharvak",
    mapID = 107,
    x = 0.606, y = 0.221,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[18266] = {
    name = "Warrant Officer Tracy Proudwell",
    mapID = 100,
    x = 0.564, y = 0.628,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[18267] = {
    name = "Battlecryer Blackeye",
    mapID = 100,
    x = 0.559, y = 0.392,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[18382] = {
    name = "Mycah",
    mapID = 102,
    x = 0.1827, y = 0.5112,
    faction = "Alliance",
    types = { "food", "transmog", "faction" },
    repFactionID = 970,
}

VendorLocations[18484] = {
    name = "Wind Trader Lathrai",
    mapID = 111,
    x = 0.726, y = 0.316,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[18525] = {
    name = "G'eras",
    mapID = 111,
    x = 0.508, y = 0.424,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 935,
}

VendorLocations[18564] = {
    name = "Horde Field Scout",
    mapID = 102,
    x = 0.33, y = 0.49,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[18581] = {
    name = "Alliance Field Scout",
    mapID = 102,
    x = 0.646, y = 0.464,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[18749] = {
    name = "Dalinna",
    mapID = 100,
    x = 0.566, y = 0.372,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[18751] = {
    name = "Kalaen",
    mapID = 100,
    x = 0.5678, y = 0.3779,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[18753] = {
    name = "Felannia",
    mapID = 100,
    x = 0.522, y = 0.36,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[18754] = {
    name = "Barim Spilthoof",
    mapID = 100,
    x = 0.562, y = 0.386,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[18756] = {
    name = "Haris Pilton",
    mapID = 111,
    x = 0.756, y = 0.306,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[18771] = {
    name = "Brumman",
    mapID = 100,
    x = 0.54, y = 0.64,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[18772] = {
    name = "Hama",
    mapID = 100,
    x = 0.546, y = 0.636,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[18773] = {
    name = "Johan Barnes",
    mapID = 100,
    x = 0.536, y = 0.66,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[18774] = {
    name = "Tatiana",
    mapID = 100,
    x = 0.546, y = 0.636,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[18775] = {
    name = "Lebowski",
    mapID = 100,
    x = 0.556, y = 0.656,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[18802] = {
    name = "Alchemist Gribble",
    mapID = 100,
    x = 0.538, y = 0.658,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[18821] = {
    name = "Quartermaster Jaffrey Noreliqe",
    mapID = 107,
    x = 0.412, y = 0.442,
    faction = "Horde",
    types = { "transmog" },
    note = "ATT — This NPC is only accessible when the Horde controls Halaa.",
}

VendorLocations[18822] = {
    name = "Quartermaster Davian Vaclav",
    mapID = 107,
    x = 0.412, y = 0.442,
    faction = "Alliance",
    types = { "transmog" },
    note = "ATT — This NPC is only accessible when the Alliance controls Halaa.",
}

VendorLocations[18911] = {
    name = "Juno Dufrain",
    mapID = 102,
    x = 0.78, y = 0.66,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[18957] = {
    name = "Innkeeper Grilka",
    mapID = 108,
    x = 0.488, y = 0.45,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[18960] = {
    name = "Rungor",
    mapID = 108,
    x = 0.488, y = 0.46,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[18962] = {
    name = "Bar Talet",
    mapID = 108,
    x = 0.492, y = 0.454,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[18987] = {
    name = "Gaston",
    mapID = 100,
    x = 0.54, y = 0.636,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[18988] = {
    name = "Baxter",
    mapID = 100,
    x = 0.568, y = 0.374,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[18990] = {
    name = "Burko",
    mapID = 100,
    x = 0.224, y = 0.394,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[18991] = {
    name = "Aresella",
    mapID = 100,
    x = 0.262, y = 0.62,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[18993] = {
    name = "Naka",
    mapID = 102,
    x = 0.785, y = 0.63,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[18997] = {
    name = "Fallesh Sunfallow",
    mapID = 100,
    x = 0.264, y = 0.602,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[19001] = {
    name = "Talaara",
    mapID = 100,
    x = 0.232, y = 0.4,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[19004] = {
    name = "Vodesiin",
    mapID = 100,
    x = 0.244, y = 0.388,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[19015] = {
    name = "Mathar G'ochar",
    mapID = 107,
    x = 0.552, y = 0.37,
    faction = "Horde",
    types = { "faction" },
    repFactionID = 941,
    note = "ATT — This vendor pats around Garadar.",
}

VendorLocations[19017] = {
    name = "Borto",
    mapID = 107,
    x = 0.532, y = 0.718,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[19021] = {
    name = "Nancila",
    mapID = 107,
    x = 0.552, y = 0.706,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[19038] = {
    name = "Supply Officer Mills",
    mapID = 108,
    x = 0.558, y = 0.53,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[19042] = {
    name = "Leeli Longhaggle",
    mapID = 108,
    x = 0.576, y = 0.534,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[19043] = {
    name = "Ahemen",
    mapID = 111,
    x = 0.342, y = 0.2,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 932,
}

VendorLocations[19045] = {
    name = "Oloraak",
    mapID = 111,
    x = 0.58, y = 0.152,
    faction = "Neutral",
    types = { "food", "faction" },
    repFactionID = 1011,
}

VendorLocations[19047] = {
    name = "Lissaf",
    mapID = 111,
    x = 0.518, y = 0.178,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[19049] = {
    name = "Karokka",
    mapID = 111,
    x = 0.456, y = 0.198,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[19065] = {
    name = "Inessera",
    mapID = 111,
    x = 0.356, y = 0.198,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 932,
}

VendorLocations[19074] = {
    name = "Skreah",
    mapID = 111,
    x = 0.458, y = 0.208,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 1011,
}

VendorLocations[19182] = {
    name = "Shaarubo",
    mapID = 111,
    x = 0.752, y = 0.339,
    faction = "Neutral",
    types = { "food", "faction" },
    repFactionID = 1011,
}

VendorLocations[19186] = {
    name = "Kylene",
    mapID = 111,
    x = 0.756, y = 0.326,
    faction = "Neutral",
    types = { "food", "profession" },
    note = "ATT — Speak to her and tell her she's quite the cook to learn these recipes.",
}

VendorLocations[19195] = {
    name = "Jim Saltit",
    mapID = 111,
    x = 0.634, y = 0.686,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 1011,
}

VendorLocations[19196] = {
    name = "Cro Threadstrong",
    mapID = 111,
    x = 0.672, y = 0.676,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 1011,
}

VendorLocations[19213] = {
    name = "Eiin",
    mapID = 111,
    x = 0.662, y = 0.688,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 1011,
}

VendorLocations[19223] = {
    name = "Granny Smith",
    mapID = 111,
    x = 0.64, y = 0.688,
    faction = "Neutral",
    types = { "food", "faction" },
    repFactionID = 1011,
}

VendorLocations[19234] = {
    name = "Yurial Soulwater",
    mapID = 111,
    x = 0.446, y = 0.968,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 934,
}

VendorLocations[19236] = {
    name = "Quelama Lightblade",
    mapID = 111,
    x = 0.446, y = 0.76,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[19238] = {
    name = "Urumir Stavebright",
    mapID = 111,
    x = 0.496, y = 0.79,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 934,
}

VendorLocations[19239] = {
    name = "Mahir Redstroke",
    mapID = 111,
    x = 0.546, y = 0.826,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[19240] = {
    name = "Selanam the Blade",
    mapID = 111,
    x = 0.42, y = 0.752,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[19244] = {
    name = "Trader Endernor",
    mapID = 111,
    x = 0.446, y = 0.968,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 934,
}

VendorLocations[19296] = {
    name = "Innkeeper Biribi",
    mapID = 108,
    x = 0.566, y = 0.532,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[19321] = {
    name = "Quartermaster Endarin",
    mapID = 111,
    x = 0.48, y = 0.266,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 932,
    minStanding = 3000,
}

VendorLocations[19331] = {
    name = "Quartermaster Enuril",
    mapID = 111,
    x = 0.606, y = 0.642,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 934,
    minStanding = 3000,
}

VendorLocations[19333] = {
    name = "Grokom Deatheye",
    mapID = 104,
    x = 0.298, y = 0.312,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[19339] = {
    name = "Korthul",
    mapID = 104,
    x = 0.3, y = 0.31,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[19342] = {
    name = "Krek Cragcrush",
    mapID = 104,
    x = 0.292, y = 0.31,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[19351] = {
    name = "Daggle Ironshaper",
    mapID = 104,
    x = 0.368, y = 0.544,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[19373] = {
    name = "Mari Stonehand",
    mapID = 104,
    x = 0.368, y = 0.55,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[19383] = {
    name = "Captured Gnome",
    mapID = 102,
    x = 0.324, y = 0.48,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[19473] = {
    name = "Raiza",
    mapID = 105,
    x = 0.53, y = 0.59,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[19499] = {
    name = "Cahill",
    mapID = 105,
    x = 0.376, y = 0.638,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[19521] = {
    name = "Arrond",
    mapID = 104,
    x = 0.558, y = 0.582,
    faction = "Alliance",
    types = { "faction" },
    repFactionID = 934,
}

VendorLocations[19526] = {
    name = "Dunaman",
    mapID = 104,
    x = 0.632, y = 0.306,
    faction = "Alliance",
    types = { "transmog", "faction" },
    repFactionID = 932,
}

VendorLocations[19536] = {
    name = "Dealer Jadyan",
    mapID = 109,
    x = 0.44, y = 0.366,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[19537] = {
    name = "Dealer Malij",
    mapID = 109,
    x = 0.442, y = 0.34,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[19540] = {
    name = "Asarnan",
    mapID = 109,
    x = 0.442, y = 0.336,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[19661] = {
    name = "Viggz Shinesparked",
    mapID = 111,
    x = 0.648, y = 0.696,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 1011,
}

VendorLocations[19662] = {
    name = "Aaron Hollman",
    mapID = 111,
    x = 0.64, y = 0.718,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 1011,
}

VendorLocations[19663] = {
    name = "Madame Ruby",
    mapID = 111,
    x = 0.636, y = 0.7,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 1011,
}

VendorLocations[19664] = {
    name = "Muffin Man Moser",
    mapID = 111,
    x = 0.614, y = 0.692,
    faction = "Neutral",
    types = { "food", "faction" },
    repFactionID = 1011,
}

VendorLocations[19678] = {
    name = "Fantei",
    mapID = 111,
    x = 0.646, y = 0.706,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[19694] = {
    name = "Loolruna",
    mapID = 102,
    x = 0.686, y = 0.502,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[19718] = {
    name = "Provisioner Tsaalt",
    mapID = 108,
    x = 0.397, y = 0.701,
    faction = "Horde",
    types = { "food", "faction" },
    repFactionID = 1011,
    minStanding = 3000,
}

VendorLocations[19722] = {
    name = "Muheru the Weaver",
    mapID = 102,
    x = 0.404, y = 0.282,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[19772] = {
    name = "Spirit Sage Gartok",
    mapID = 108,
    x = 0.498, y = 0.466,
    faction = "Horde",
    types = { "food", "transmog" },
}

VendorLocations[19773] = {
    name = "Spirit Sage Zran",
    mapID = 108,
    x = 0.56, y = 0.536,
    faction = "Alliance",
    types = { "food", "transmog" },
}

VendorLocations[19836] = {
    name = "Mixie Farshot",
    mapID = 100,
    x = 0.611, y = 0.814,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[19837] = {
    name = "Daga Ramba",
    mapID = 105,
    x = 0.51, y = 0.578,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[20028] = {
    name = "Doba",
    mapID = 102,
    x = 0.422, y = 0.278,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[20096] = {
    name = "Uriku",
    mapID = 107,
    x = 0.562, y = 0.732,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[20097] = {
    name = "Nula the Butcher",
    mapID = 107,
    x = 0.58, y = 0.356,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[20112] = {
    name = "Wind Trader Tuluman",
    mapID = 109,
    x = 0.346, y = 0.378,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[20240] = {
    name = "Trader Narasu",
    mapID = 107,
    x = 0.545, y = 0.751,
    faction = "Alliance",
    types = { "transmog", "faction" },
    repFactionID = 978,
    minStanding = 3000,
}

VendorLocations[20241] = {
    name = "Provisioner Nasela",
    mapID = 107,
    x = 0.535, y = 0.37,
    faction = "Horde",
    types = { "transmog", "faction" },
    repFactionID = 941,
    minStanding = 3000,
}

VendorLocations[20242] = {
    name = "Karaaz",
    mapID = 109,
    x = 0.436, y = 0.344,
    faction = "Alliance",
    types = { "transmog", "faction" },
    repFactionID = 933,
    minStanding = 3000,
}

VendorLocations[20494] = {
    name = "Dama Wildmane",
    mapID = 104,
    x = 0.29, y = 0.294,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[20510] = {
    name = "Brunn Flamebeard",
    mapID = 104,
    x = 0.376, y = 0.56,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[20613] = {
    name = "Arodis Sunblade",
    mapID = 111,
    x = 0.426, y = 0.906,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 934,
}

VendorLocations[20616] = {
    name = "Asuur",
    mapID = 111,
    x = 0.236, y = 0.326,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 932,
}

VendorLocations[20807] = {
    name = "Scribe Saalyn",
    mapID = 111,
    x = 0.486, y = 0.266,
    faction = "Neutral",
    types = { "food", "faction" },
    repFactionID = 932,
    minStanding = 9000,
}

VendorLocations[20808] = {
    name = "Scribe Veredis",
    mapID = 111,
    x = 0.6, y = 0.646,
    faction = "Neutral",
    types = { "food", "faction" },
    repFactionID = 934,
    minStanding = 9000,
}

VendorLocations[20916] = {
    name = "Xerintha Ravenoak",
    mapID = 105,
    x = 0.624, y = 0.402,
    faction = "Alliance",
    types = { "general" },
    note = "ATT — This vendor stocks a limited supply of these items. Alliance players can purchase them from Sassa Weldwell, who sells un",
}

VendorLocations[20917] = {
    name = "Zinyen Swiftstrider",
    mapID = 105,
    x = 0.616, y = 0.384,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[20980] = {
    name = "Dealer Rashaad",
    mapID = 109,
    x = 0.434, y = 0.352,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[20986] = {
    name = "Dealer Tariq",
    mapID = 108,
    x = 0.394, y = 0.7,
    faction = "Horde",
    types = { "food", "faction" },
    repFactionID = 933,
}

VendorLocations[21113] = {
    name = "Sassa Weldwell",
    mapID = 105,
    x = 0.612, y = 0.688,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[21432] = {
    name = "Almaador",
    mapID = 111,
    x = 0.516, y = 0.416,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 935,
    minStanding = 3000,
}

VendorLocations[21474] = {
    name = "Coreiel",
    mapID = 107,
    x = 0.428, y = 0.426,
    faction = "Horde",
    types = { "transmog" },
    note = "ATT — This vendor is only accessible when the Horde controls Halaa.",
}

VendorLocations[21485] = {
    name = "Aldraan",
    mapID = 107,
    x = 0.428, y = 0.426,
    faction = "Alliance",
    types = { "transmog" },
    note = "ATT — This vendor is only accessible when the Alliance controls Halaa.",
}

VendorLocations[21493] = {
    name = "Kablamm Farflinger",
    mapID = 109,
    x = 0.329, y = 0.637,
    faction = "Alliance",
    types = { "general" },
    note = "ATT — Goblin Engineers can speak to Kablamm to learn the recipe.",
}

VendorLocations[21494] = {
    name = "Smiles O'Byron",
    mapID = 105,
    x = 0.602, y = 0.652,
    faction = "Alliance",
    types = { "general" },
    note = "ATT — Gnomish Engineers can speak to Smiles to learn the recipe.",
}

VendorLocations[21655] = {
    name = "Nakodu",
    mapID = 111,
    x = 0.626, y = 0.69,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 1011,
    minStanding = 3000,
}

VendorLocations[21905] = {
    name = "Veynna Dawnstar",
    mapID = 111,
    x = 0.448, y = 0.916,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 934,
}

VendorLocations[21906] = {
    name = "Kelara",
    mapID = 111,
    x = 0.248, y = 0.27,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 932,
}

VendorLocations[22099] = {
    name = "Wyrmcult Provisioner",
    mapID = 105,
    x = 0.338, y = 0.346,
    faction = "Alliance",
    types = { "food", "transmog" },
    note = "ATT — To access this vendor, you must be wearing an Overseer Disguise. To get the disguise, you must either be currently on, o",
}

VendorLocations[22208] = {
    name = "Nasmara Moonsong",
    mapID = 111,
    x = 0.664, y = 0.69,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 1011,
}

VendorLocations[22212] = {
    name = "Andrion Darkspinner",
    mapID = 111,
    x = 0.666, y = 0.686,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 1011,
}

VendorLocations[22213] = {
    name = "Gidge Spellweaver",
    mapID = 111,
    x = 0.666, y = 0.686,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 1011,
}

VendorLocations[22225] = {
    name = "Reagan Mancuso",
    mapID = 100,
    x = 0.4582, y = 0.3779,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[22227] = {
    name = "Markus Scylan",
    mapID = 100,
    x = 0.5467, y = 0.6357,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[22266] = {
    name = "Ogri'la Grubgiver",
    mapID = 105,
    x = 0.278, y = 0.582,
    faction = "Alliance",
    types = { "food", "faction" },
    repFactionID = 1038,
}

VendorLocations[22270] = {
    name = "Ogri'la Merchant",
    mapID = 105,
    x = 0.278, y = 0.585,
    faction = "Alliance",
    types = { "faction" },
    repFactionID = 1038,
}

VendorLocations[23007] = {
    name = "Paulsta'ats",
    mapID = 107,
    x = 0.305, y = 0.569,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[23064] = {
    name = "Eebee Jinglepocket",
    mapID = 111,
    x = 0.513, y = 0.297,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[23110] = {
    name = "Ogri'la Keg King",
    mapID = 105,
    x = 0.279, y = 0.576,
    faction = "Alliance",
    types = { "food", "faction" },
    repFactionID = 1038,
}

VendorLocations[23245] = {
    name = "Aether-Tech Master",
    mapID = 105,
    x = 0.544, y = 0.108,
    faction = "Alliance",
    types = { "transmog" },
    note = "ATT — The Skyguard sends out a group to study the Bash'ir Crystalforge at Bash'ir Landing once every two hours.|nOnce the even",
}

VendorLocations[23263] = {
    name = "Brendan Turner",
    mapID = 111,
    x = 0.605, y = 0.693,
    faction = "Neutral",
    types = { "food", "faction" },
    repFactionID = 1011,
}

VendorLocations[23367] = {
    name = "Grella",
    mapID = 108,
    x = 0.643, y = 0.662,
    faction = "Horde",
    types = { "food", "transmog", "faction" },
    repFactionID = 1031,
    minStanding = 3000,
}

VendorLocations[23396] = {
    name = "Krixel Pinchwhistle",
    mapID = 109,
    x = 0.33, y = 0.64,
    faction = "Alliance",
    types = { "transmog" },
    note = "ATT — Items on this vendor require Legionnaire/Knight-Captain rank or higher to purchase.",
}

VendorLocations[23428] = {
    name = "Jho'nass",
    mapID = 105,
    x = 0.28, y = 0.586,
    faction = "Alliance",
    types = { "food", "transmog", "faction" },
    repFactionID = 1038,
}

VendorLocations[23483] = {
    name = "Arcanist Xorith",
    mapID = 111,
    x = 0.606, y = 0.636,
    faction = "Neutral",
    types = { "food", "faction" },
    repFactionID = 934,
}

VendorLocations[23484] = {
    name = "Haldor the Compulsive",
    mapID = 111,
    x = 0.48, y = 0.268,
    faction = "Neutral",
    types = { "food", "faction" },
    repFactionID = 932,
}

VendorLocations[23489] = {
    name = "Drake Dealer Hurlunk",
    mapID = 104,
    x = 0.656, y = 0.859,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 1015,
    minStanding = 42000,
    note = "ATT — To access this vendor, you must reach Exalted with the Netherwing and claim one of the netherwing drakes in Shattrath.",
}

VendorLocations[23699] = {
    name = "Kevin Browning",
    mapID = 111,
    x = 0.706, y = 0.518,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[26352] = {
    name = "Big Zokk Torquewrench",
    mapID = 109,
    x = 0.332, y = 0.641,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[27666] = {
    name = "Ontuvo",
    mapID = 111,
    x = 0.488, y = 0.418,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[27667] = {
    name = "Anwehu",
    mapID = 111,
    x = 0.488, y = 0.428,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 1077,
}

VendorLocations[27711] = {
    name = "Technician Halmaha",
    mapID = 111,
    x = 0.2793, y = 0.476,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 932,
}

VendorLocations[30734] = {
    name = "Jezebel Bican",
    mapID = 100,
    x = 0.54, y = 0.656,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[30735] = {
    name = "Kul Inkspiller",
    mapID = 100,
    x = 0.524, y = 0.36,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[32354] = {
    name = "Leeni \\\"Smiley\\\" Smalls",
    mapID = 109,
    x = 0.33, y = 0.64,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[32355] = {
    name = "Big Zokk Torquewrench",
    mapID = 109,
    x = 0.332, y = 0.641,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[32356] = {
    name = "Kezzik the Striker",
    mapID = 109,
    x = 0.331, y = 0.64,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[32405] = {
    name = "Kezzik the Striker",
    mapID = 109,
    x = 0.331, y = 0.643,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[33630] = {
    name = "Aelthin",
    mapID = 111,
    x = 0.386, y = 0.718,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[33633] = {
    name = "Enchantress Andiala",
    mapID = 111,
    x = 0.562, y = 0.744,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 934,
}

VendorLocations[33637] = {
    name = "Kirembri Silvermane",
    mapID = 111,
    x = 0.586, y = 0.752,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 934,
}

VendorLocations[33638] = {
    name = "Scribe Lanloer",
    mapID = 111,
    x = 0.364, y = 0.446,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 934,
}

VendorLocations[33674] = {
    name = "Alchemist Kanhu",
    mapID = 111,
    x = 0.386, y = 0.3,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[33676] = {
    name = "Zurii",
    mapID = 111,
    x = 0.364, y = 0.446,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 932,
}

VendorLocations[33679] = {
    name = "Recorder Lidio",
    mapID = 111,
    x = 0.559, y = 0.7434,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 932,
}

VendorLocations[33680] = {
    name = "Nemiha",
    mapID = 111,
    x = 0.362, y = 0.47,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 932,
}

VendorLocations[33916] = {
    name = "Big Zokk Torquewrench",
    mapID = 109,
    x = 0.332, y = 0.641,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[33918] = {
    name = "Kezzik the Striker",
    mapID = 109,
    x = 0.331, y = 0.643,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[33919] = {
    name = "Leeni \\\"Smiley\\\" Smalls",
    mapID = 109,
    x = 0.33, y = 0.64,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[33930] = {
    name = "Leeni \\\"Smiley\\\" Smalls",
    mapID = 109,
    x = 0.33, y = 0.64,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[33931] = {
    name = "Kezzik the Striker",
    mapID = 109,
    x = 0.331, y = 0.643,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[33932] = {
    name = "Big Zokk Torquewrench",
    mapID = 109,
    x = 0.332, y = 0.641,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[33933] = {
    name = "Big Zokk Torquewrench",
    mapID = 109,
    x = 0.332, y = 0.641,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[33940] = {
    name = "Kezzik the Striker",
    mapID = 109,
    x = 0.331, y = 0.643,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[33941] = {
    name = "Leeni \\\"Smiley\\\" Smalls",
    mapID = 109,
    x = 0.33, y = 0.64,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[34089] = {
    name = "Grex Brainboiler",
    mapID = 109,
    x = 0.331, y = 0.64,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[34091] = {
    name = "Grex Brainboiler",
    mapID = 109,
    x = 0.331, y = 0.64,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[34094] = {
    name = "Grex Brainboiler",
    mapID = 109,
    x = 0.331, y = 0.64,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[35099] = {
    name = "Bana Wildmane",
    mapID = 100,
    x = 0.542, y = 0.416,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[35101] = {
    name = "Grunda Bronzewing",
    mapID = 100,
    x = 0.542, y = 0.626,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[40209] = {
    name = "Grex Brainboiler",
    mapID = 109,
    x = 0.33, y = 0.64,
    faction = "Alliance",
    types = { "transmog" },
    note = "ATT — Items on this vendor require Legionnaire/Knight-Captain rank or higher to purchase.",
}

VendorLocations[52278] = {
    name = "Linsa",
    mapID = 111,
    x = 0.588, y = 0.464,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[54648] = {
    name = "Leeni \\\"Smiley\\\" Smalls",
    mapID = 109,
    x = 0.33, y = 0.64,
    faction = "Horde",
    types = { "transmog" },
    note = "ATT — Items on this vendor require Legionnaire/Knight-Captain rank or higher to purchase.",
}

VendorLocations[54649] = {
    name = "Big Zokk Torquewrench",
    mapID = 109,
    x = 0.332, y = 0.64,
    faction = "Alliance",
    types = { "transmog" },
    note = "ATT — Items on this vendor require Legionnaire/Knight-Captain rank or higher to purchase.",
}

VendorLocations[54650] = {
    name = "Kezzik the Striker",
    mapID = 109,
    x = 0.33, y = 0.642,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[58152] = {
    name = "Tini Smalls",
    mapID = 109,
    x = 0.33, y = 0.642,
    faction = "Horde",
    types = { "transmog" },
    note = "ATT — Items on this vendor require Legionnaire/Knight-Captain rank or higher to purchase.",
}

VendorLocations[98685] = {
    name = "Cupri",
    mapID = 111,
    x = 0.544, y = 0.388,
    faction = "Horde",
    types = { "food", "transmog", "faction" },
    repFactionID = 922,
    minStanding = 42000,
}

VendorLocations[107599] = {
    name = "Izzee the 'Clutch'",
    mapID = 109,
    x = 0.33, y = 0.642,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[107610] = {
    name = "Kitzie Crankshot",
    mapID = 109,
    x = 0.33, y = 0.642,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[107619] = {
    name = "Blaze Magmaburn",
    mapID = 109,
    x = 0.332, y = 0.64,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[115546] = {
    name = "Lunelli",
    mapID = 111,
    x = 0.642, y = 0.714,
    faction = "Neutral",
    types = { "profession" },
    note = "ATT — She will only sell these recipes to those who have completed the quests that reward them.",
}

VendorLocations[150945] = {
    name = "Selis Silksong",
    mapID = 111,
    x = 0.677, y = 0.277,
    faction = "Neutral",
    types = { "transmog" },
}

------------------------------------------------------------------
-- Mists of Pandaria
------------------------------------------------------------------

VendorLocations[55143] = {
    name = "Sally Fizzlefury",
    mapID = 376,
    x = 0.16, y = 0.83,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[56406] = {
    name = "Rivett Clutchpop",
    mapID = 371,
    x = 0.272, y = 0.506,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[56687] = {
    name = "Metalworker Sashi",
    mapID = 371,
    x = 0.581, y = 0.836,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[56705] = {
    name = "Singegruff",
    mapID = 371,
    x = 0.466, y = 0.456,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[58414] = {
    name = "San Redscale",
    mapID = 371,
    x = 0.567, y = 0.443,
    faction = "Neutral",
    types = { "food", "transmog", "faction" },
    repFactionID = 1271,
    minStanding = 9000,
    note = "ATT — Purchasable/learnable by any character exalted with Order of the Cloud Serpent.",
}

VendorLocations[58706] = {
    name = "Gina Mudclaw",
    mapID = 376,
    x = 0.532, y = 0.516,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 1272,
}

VendorLocations[58718] = {
    name = "Merchant Greenfield",
    mapID = 376,
    x = 0.528, y = 0.52,
    faction = "Neutral",
    types = { "food", "faction" },
    repFactionID = 1272,
}

VendorLocations[59583] = {
    name = "Trader Jambeezi",
    mapID = 376,
    x = 0.556, y = 0.498,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[59698] = {
    name = "Brother Furtrim",
    mapID = 379,
    x = 0.572, y = 0.61,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[59908] = {
    name = "Jaluu the Generous",
    mapID = 390,
    x = 0.632, y = 0.22,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 1269,
}

VendorLocations[61215] = {
    name = "Claretta",
    mapID = 376,
    x = 0.848, y = 0.216,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[61598] = {
    name = "Silkweaver Rui",
    mapID = 371,
    x = 0.581, y = 0.841,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[61650] = {
    name = "Big Keech",
    mapID = 390,
    x = 0.709, y = 0.405,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[61749] = {
    name = "The Metal Paw",
    mapID = 379,
    x = 0.714, y = 0.921,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[62088] = {
    name = "Lali the Assistant",
    mapID = 390,
    x = 0.828, y = 0.304,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[62737] = {
    name = "Supplier Xin",
    mapID = 388,
    x = 0.708, y = 0.558,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[63721] = {
    name = "Nat Pagle",
    mapID = 418,
    x = 0.684, y = 0.435,
    faction = "Neutral",
    types = { "transmog", "profession", "faction" },
    repFactionID = 1302,
}

VendorLocations[63994] = {
    name = "Challenger Wuli",
    mapID = 390,
    x = 0.612, y = 0.208,
    faction = "Horde",
    types = { "transmog" },
    note = "ATT — You can only buy items from this vendor if you have the Challenge Conquerer: Gold Feat of Strength on your toon. You can",
}

VendorLocations[64001] = {
    name = "Sage Lotusbloom",
    mapID = 390,
    x = 0.627, y = 0.233,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[64028] = {
    name = "Challenger Soong",
    mapID = 390,
    x = 0.863, y = 0.615,
    faction = "Alliance",
    types = { "transmog" },
    note = "ATT — You can only buy items from this vendor if you have the Challenge Conquerer: Gold Feat of Strength on your toon. You can",
}

VendorLocations[64032] = {
    name = "Sage Whiteheart",
    mapID = 390,
    x = 0.846, y = 0.638,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[64051] = {
    name = "Esha the Loommaiden",
    mapID = 391,
    x = 0.315, y = 0.536,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[64052] = {
    name = "Raishen the Needle",
    mapID = 393,
    x = 0.647, y = 0.441,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[64054] = {
    name = "Krogo Darkhide",
    mapID = 391,
    x = 0.305, y = 0.465,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[64058] = {
    name = "Jorunga Stonehoof",
    mapID = 391,
    x = 0.26, y = 0.462,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[64062] = {
    name = "Gentle Dari",
    mapID = 391,
    x = 0.326, y = 0.737,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[64067] = {
    name = "Barleyflower",
    mapID = 392,
    x = 0.687, y = 0.695,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[64084] = {
    name = "Jojo",
    mapID = 393,
    x = 0.63, y = 0.268,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[64085] = {
    name = "Cullen Hammerbrow",
    mapID = 393,
    x = 0.712, y = 0.505,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[64094] = {
    name = "Tanner Pang",
    mapID = 393,
    x = 0.756, y = 0.502,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[64096] = {
    name = "Serenka",
    mapID = 393,
    x = 0.472, y = 0.612,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[64126] = {
    name = "Stephen Wong",
    mapID = 391,
    x = 0.275, y = 0.65,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[64395] = {
    name = "Nam Ironpaw",
    mapID = 376,
    x = 0.536, y = 0.512,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[64465] = {
    name = "Noodles",
    mapID = 376,
    x = 0.526, y = 0.516,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[64518] = {
    name = "Uncle Bigpocket",
    mapID = 379,
    x = 0.654, y = 0.616,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[64595] = {
    name = "Rushi the Fox",
    mapID = 388,
    x = 0.488, y = 0.705,
    faction = "Neutral",
    types = { "food", "transmog", "faction" },
    repFactionID = 1270,
}

VendorLocations[64599] = {
    name = "Ambersmith Zikk",
    mapID = 422,
    x = 0.55, y = 0.355,
    faction = "Neutral",
    types = { "food", "transmog", "faction" },
    repFactionID = 1337,
}

VendorLocations[64605] = {
    name = "Tan Shin Tiao",
    mapID = 390,
    x = 0.822, y = 0.294,
    faction = "Alliance",
    types = { "food", "transmog", "faction" },
    repFactionID = 1345,
}

VendorLocations[64606] = {
    name = "Commander Oxheart",
    mapID = 388,
    x = 0.378, y = 0.646,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[64607] = {
    name = "Commander Lo Ping",
    mapID = 388,
    x = 0.378, y = 0.646,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[64691] = {
    name = "Lorewalker Huynh",
    mapID = 390,
    x = 0.82, y = 0.293,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[64922] = {
    name = "Brann Bronzebeard",
    mapID = 390,
    x = 0.834, y = 0.309,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[64978] = {
    name = "Number Nine Jia",
    mapID = 379,
    x = 0.452, y = 0.432,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[65171] = {
    name = "Alin the Finder",
    mapID = 388,
    x = 0.714, y = 0.572,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[65172] = {
    name = "Len at Arms",
    mapID = 390,
    x = 0.141, y = 0.788,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[66356] = {
    name = "Master Hwang",
    mapID = 379,
    x = 0.5044, y = 0.4261,
    faction = "Neutral",
    types = { "transmog" },
    note = "ATT — The blue-quality staves on this vendor are quest rewards. You must have completed the respective quests to purchase the",
}

VendorLocations[66359] = {
    name = "Master Tan",
    mapID = 379,
    x = 0.5002, y = 0.3853,
    faction = "Neutral",
    types = { "transmog" },
    note = "ATT — The blue-quality fist weapons on this vendor require that you have completed the level 30 Monk quest 'Continue Your Trai",
}

VendorLocations[66678] = {
    name = "Krystel",
    mapID = 390,
    x = 0.846, y = 0.604,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[66685] = {
    name = "Danky",
    mapID = 390,
    x = 0.616, y = 0.216,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[66973] = {
    name = "Kai Featherfall",
    mapID = 390,
    x = 0.822, y = 0.34,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[67565] = {
    name = "Barnaby Fletcher",
    mapID = 376,
    x = 0.532, y = 0.516,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[67751] = {
    name = "Ongrom Black Tooth",
    mapID = 418,
    x = 0.0971, y = 0.51,
    faction = "Horde",
    types = { "food" },
    note = "ATT — Using the Rodent Crate will spawn 5-7 Sumprush Rodents in the surrounding area. Any players may engage in battle with th",
}

VendorLocations[67881] = {
    name = "Proveditor Grantley",
    mapID = 418,
    x = 0.944, y = 0.293,
    faction = "Alliance",
    types = { "food" },
    note = "ATT — Using the Rodent Crate will spawn 5-7 Sumprush Rodents in the surrounding area. Any players may engage in battle with th",
}

VendorLocations[69059] = {
    name = "Agent Malley",
    mapID = 418,
    x = 0.945, y = 0.292,
    faction = "Alliance",
    types = { "transmog", "faction" },
    repFactionID = 1376,
}

VendorLocations[69060] = {
    name = "Tuskripper Grukna",
    mapID = 418,
    x = 0.108, y = 0.534,
    faction = "Horde",
    types = { "transmog", "faction" },
    repFactionID = 1375,
}

VendorLocations[70346] = {
    name = "Ao Pye",
    mapID = 388,
    x = 0.38, y = 0.646,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 1435,
}

VendorLocations[70436] = {
    name = "Blacktalon Quartermaster",
    mapID = 433,
    x = 0.542, y = 0.729,
    faction = "Neutral",
    types = { "food", "transmog" },
}

VendorLocations[70535] = {
    name = "Teng of the Flying Daggers",
    mapID = 504,
    x = 0.516, y = 0.466,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[73082] = {
    name = "Master Li",
    mapID = 554,
    x = 0.347, y = 0.596,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[73293] = {
    name = "Whizzig",
    mapID = 554,
    x = 0.35, y = 0.528,
    faction = "Neutral",
    types = { "food" },
    note = "ATT — This vendor is rare and is not always available.",
}

VendorLocations[73305] = {
    name = "Mistweaver Ai",
    mapID = 554,
    x = 0.426, y = 0.557,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[73306] = {
    name = "Mistweaver Ku",
    mapID = 554,
    x = 0.426, y = 0.546,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[73307] = {
    name = "Speaker Gulan",
    mapID = 554,
    x = 0.749, y = 0.449,
    faction = "Neutral",
    types = { "transmog" },
    note = "ATT — Earn Bloody Coins by transforming into an Emissary of Ordos and getting killing blows on enemy players.",
}

VendorLocations[73656] = {
    name = "Crafter Kwon",
    mapID = 554,
    x = 0.385, y = 0.464,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[73657] = {
    name = "Great Chef Woo",
    mapID = 554,
    x = 0.418, y = 0.637,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — You can turn in various zone drops to this vendor for Timeless Coins.  The quests can be repeated indefinitely.",
}

VendorLocations[73674] = {
    name = "Blizzix Sparkshiv",
    mapID = 392,
    x = 0.429, y = 0.747,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[73819] = {
    name = "Ku-Mo",
    mapID = 554,
    x = 0.411, y = 0.638,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[74010] = {
    name = "Nadina Stargem",
    mapID = 392,
    x = 0.433, y = 0.76,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[74012] = {
    name = "Ki'agnuu",
    mapID = 392,
    x = 0.431, y = 0.787,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[74019] = {
    name = "Tu'aho Pathcutter",
    mapID = 392,
    x = 0.434, y = 0.804,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[74020] = {
    name = "Welbiz Cheerwhistle",
    mapID = 394,
    x = 0.41, y = 0.425,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[74021] = {
    name = "Clarice Chapmann",
    mapID = 394,
    x = 0.43, y = 0.455,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[74022] = {
    name = "Thelett Shaleheart",
    mapID = 394,
    x = 0.419, y = 0.429,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[74027] = {
    name = "Lorry Warmheart",
    mapID = 394,
    x = 0.431, y = 0.468,
    faction = "Horde",
    types = { "general" },
}

VendorLocations[75688] = {
    name = "Roo Desvin",
    mapID = 379,
    x = 0.354, y = 0.832,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[75689] = {
    name = "Lucan Malory",
    mapID = 376,
    x = 0.122, y = 0.342,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[75690] = {
    name = "Lok'nor Bloodfist",
    mapID = 379,
    x = 0.354, y = 0.832,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[75691] = {
    name = "Hayden Christophen",
    mapID = 376,
    x = 0.122, y = 0.342,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[75692] = {
    name = "Ethan Natice",
    mapID = 376,
    x = 0.12, y = 0.342,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[75693] = {
    name = "Doris Chiltonius",
    mapID = 379,
    x = 0.354, y = 0.832,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[75694] = {
    name = "Armsmaster Holinka",
    mapID = 376,
    x = 0.12, y = 0.34,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[75695] = {
    name = "Acon Deathwielder",
    mapID = 379,
    x = 0.354, y = 0.832,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[78456] = {
    name = "Starlight Sinclair",
    mapID = 376,
    x = 0.12, y = 0.34,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[78461] = {
    name = "Shonn Su",
    mapID = 379,
    x = 0.354, y = 0.832,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[118828] = {
    name = "Mistweaver Xia",
    mapID = 554,
    x = 0.43, y = 0.554,
    faction = "Alliance",
    types = { "food", "transmog" },
}

VendorLocations[146961] = {
    name = "Jade Lovelyshirts",
    mapID = 376,
    x = 0.619, y = 0.588,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[160711] = {
    name = "Zhang Ku",
    mapID = 1530,
    x = 0.445, y = 0.754,
    faction = "Neutral",
    types = { "food", "transmog", "faction" },
    repFactionID = 2415,
    minStanding = 42000,
}

VendorLocations[227774] = {
    name = "Field Repair Anvil",
    mapID = 379,
    x = 0.5385, y = 0.6554,
    faction = "Alliance",
    types = { "repair" },
}

VendorLocations[237817] = {
    name = "Nostwin",
    mapID = 554,
    x = 0.427, y = 0.566,
    faction = "Neutral",
    types = { "transmog" },
}

------------------------------------------------------------------
-- Shadowlands
------------------------------------------------------------------

VendorLocations[156218] = {
    name = "Deadfoot",
    mapID = 1525,
    x = 0.486, y = 0.686,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[156690] = {
    name = "Distributor Au'nagl",
    mapID = 1670,
    x = 0.47, y = 0.236,
    faction = "Neutral",
    types = { "profession" },
}

VendorLocations[156769] = {
    name = "Keeper Ta'hult",
    mapID = 1670,
    x = 0.649, y = 0.673,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[156822] = {
    name = "Mistress Mihaela",
    mapID = 1525,
    x = 0.614, y = 0.638,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2413,
    minStanding = 3000,
}

VendorLocations[158556] = {
    name = "Aithlyn",
    mapID = 1565,
    x = 0.484, y = 0.504,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2465,
}

VendorLocations[158625] = {
    name = "Trader Ta'bix",
    mapID = 1533,
    x = 0.334, y = 0.364,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — Take this to Ta'lan the Antiquary in Oribos (The Broker's Den) |cffffffff(51.3, 43.0)|r.",
}

VendorLocations[158986] = {
    name = "Absolooshun",
    mapID = 1525,
    x = 0.722, y = 0.398,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[159238] = {
    name = "Atticus",
    mapID = 1536,
    x = 0.552, y = 0.682,
    faction = "Neutral",
    types = { "food" },
    note = "ATT — This becomes available within Chill's Reach during 'A Brokered Deal'.",
}

VendorLocations[160084] = {
    name = "Ta'rmoro",
    mapID = 1525,
    x = 0.504, y = 0.814,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[160091] = {
    name = "Ta'ruca",
    mapID = 1525,
    x = 0.511, y = 0.785,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[160470] = {
    name = "Adjutant Nikos",
    mapID = 1533,
    x = 0.522, y = 0.47,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2407,
}

VendorLocations[162447] = {
    name = "Spindlenose",
    mapID = 1565,
    x = 0.596, y = 0.529,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2464,
    minStanding = 1,
}

VendorLocations[163714] = {
    name = "Master Clerk Salorn",
    mapID = 1565,
    x = 0.43, y = 0.47,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[164095] = {
    name = "Purveyor Zo'kuul",
    mapID = 1670,
    x = 0.36, y = 0.586,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[164588] = {
    name = "Shinbone Slim",
    mapID = 1536,
    x = 0.47, y = 0.488,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[164725] = {
    name = "Tanor",
    mapID = 1565,
    x = 0.65, y = 0.196,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[164795] = {
    name = "Clyde",
    mapID = 1536,
    x = 0.552, y = 0.684,
    faction = "Neutral",
    types = { "transmog" },
    note = "ATT — Contains one random weapon.",
}

VendorLocations[164966] = {
    name = "Temel",
    mapID = 1525,
    x = 0.28, y = 0.43,
    faction = "Neutral",
    types = { "food", "transmog" },
    note = "ATT — This is intended to be purchased on a 'Main' Venthyr character to send to 'Alt' Venthyr characters to get a head-start o",
}

VendorLocations[165341] = {
    name = "Droman Dawnblossom",
    mapID = 1565,
    x = 0.38, y = 0.368,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — Talk to Droman Dawnblossom. Then pick up the Fae Net item that is leaning against a table to the right of Droman. Then e",
}

VendorLocations[165419] = {
    name = "Grand Marshal Mudrag",
    mapID = 1525,
    x = 0.406, y = 0.469,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[165453] = {
    name = "Lady Ilinca",
    mapID = 1525,
    x = 0.285, y = 0.411,
    faction = "Neutral",
    types = { "faction" },
    repFactionID = 2445,
    minStanding = 9000,
}

VendorLocations[165859] = {
    name = "Dimwiddle",
    mapID = 1525,
    x = 0.608, y = 0.625,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[166076] = {
    name = "Mats",
    mapID = 1525,
    x = 0.326, y = 0.493,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[166640] = {
    name = "Au'larrynar",
    mapID = 1536,
    x = 0.536, y = 0.479,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[167815] = {
    name = "Mims",
    mapID = 1525,
    x = 0.326, y = 0.493,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[167881] = {
    name = "Ta'lan the Antiquary",
    mapID = 1672,
    x = 0.513, y = 0.43,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — Take this to Acquirer Ta'gosh in Oribos |cffffffff(61.7, 72.3)|r.",
}

VendorLocations[168011] = {
    name = "Zo'sorg",
    mapID = 1670,
    x = 0.35, y = 0.576,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[168429] = {
    name = "Melody Madcap",
    mapID = 1536,
    x = 0.402, y = 0.412,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[169524] = {
    name = "Acquirer Ta'gosh",
    mapID = 1670,
    x = 0.617, y = 0.723,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — Take this to Ta'ruca in Revendreth |cffffffff(51.1, 78.5)|r.",
}

VendorLocations[169964] = {
    name = "One-Eyed Joby",
    mapID = 1536,
    x = 0.532, y = 0.412,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[171526] = {
    name = "Kobri",
    mapID = 1533,
    x = 0.526, y = 0.474,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[171808] = {
    name = "Ta'tru",
    mapID = 1525,
    x = 0.511, y = 0.788,
    faction = "Neutral",
    types = { "food" },
    note = "ATT — Take this to Ta'lan the Antiquary in Oribos (downstairs in The Broker's Den) |cffffffff(51.4, 42.9)|r.",
}

VendorLocations[171958] = {
    name = "Phixin",
    mapID = 1707,
    x = 0.304, y = 0.397,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[171959] = {
    name = "Orluna",
    mapID = 1707,
    x = 0.271, y = 0.409,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[171973] = {
    name = "Binkiros",
    mapID = 1707,
    x = 0.316, y = 0.48,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[171981] = {
    name = "Zeleskos",
    mapID = 1707,
    x = 0.311, y = 0.473,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[172176] = {
    name = "Su Zettai",
    mapID = 1698,
    x = 0.525, y = 0.412,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[172634] = {
    name = "Brightgleam",
    mapID = 1565,
    x = 0.332, y = 0.516,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[173003] = {
    name = "Nalcorn Talsen",
    mapID = 1536,
    x = 0.506, y = 0.534,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2410,
}

VendorLocations[173371] = {
    name = "Lady Rovinette",
    mapID = 1525,
    x = 0.283, y = 0.437,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2445,
    minStanding = 3000,
}

VendorLocations[173570] = {
    name = "Snickersnee",
    mapID = 1525,
    x = 0.408, y = 0.466,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[173705] = {
    name = "Archivist Janeera",
    mapID = 1525,
    x = 0.73, y = 0.52,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2439,
    minStanding = 9000,
}

VendorLocations[174403] = {
    name = "Seed Merchant Daybreak",
    mapID = 1662,
    x = 0.346, y = 0.606,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[174582] = {
    name = "Caretaker Caryn",
    mapID = 1707,
    x = 0.264, y = 0.338,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — Contains around 15-20 of each rare-quality crafting material for Path of Ascension crafting.",
}

VendorLocations[174609] = {
    name = "Zaki",
    mapID = 1702,
    x = 0.518, y = 0.196,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[174709] = {
    name = "Stoneweaver McConnell",
    mapID = 1700,
    x = 0.454, y = 0.65,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[174710] = {
    name = "Chachi the Artiste",
    mapID = 1699,
    x = 0.54, y = 0.256,
    faction = "Neutral",
    types = { "transmog" },
    note = "ATT — Requires Renown 65",
}

VendorLocations[174711] = {
    name = "Freeman",
    mapID = 1525,
    x = 0.32, y = 0.412,
    faction = "Neutral",
    types = { "transmog", "faction" },
    repFactionID = 2445,
    minStanding = 21000,
}

VendorLocations[174766] = {
    name = "Cortinarius",
    mapID = 1819,
    x = 0.561, y = 0.513,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[174914] = {
    name = "Elwyn",
    mapID = 1701,
    x = 0.602, y = 0.332,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[174937] = {
    name = "Adjutant Galos",
    mapID = 1708,
    x = 0.633, y = 0.306,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[175310] = {
    name = "Mellisa Fate",
    mapID = 1698,
    x = 0.608, y = 0.443,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[175311] = {
    name = "Slayer Araya",
    mapID = 1698,
    x = 0.571, y = 0.483,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[175312] = {
    name = "Taiya Tacere",
    mapID = 1698,
    x = 0.612, y = 0.474,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[175369] = {
    name = "Vorpalia",
    mapID = 1700,
    x = 0.403, y = 0.461,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[175370] = {
    name = "Odious Gwor",
    mapID = 1698,
    x = 0.605, y = 0.486,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[175371] = {
    name = "Mortis Elfsen",
    mapID = 1698,
    x = 0.611, y = 0.457,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[175406] = {
    name = "Gregor the Pallidblade",
    mapID = 1700,
    x = 0.706, y = 0.273,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[175407] = {
    name = "Lord Afanas",
    mapID = 1700,
    x = 0.552, y = 0.541,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[175413] = {
    name = "Sparklebreeze",
    mapID = 1702,
    x = 0.469, y = 0.543,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[175414] = {
    name = "Adera",
    mapID = 1702,
    x = 0.481, y = 0.535,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[175415] = {
    name = "Harkoth",
    mapID = 1702,
    x = 0.494, y = 0.544,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[175417] = {
    name = "Sulanoom",
    mapID = 1702,
    x = 0.494, y = 0.544,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[175418] = {
    name = "Mar'lan",
    mapID = 1701,
    x = 0.459, y = 0.564,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[175521] = {
    name = "Alisius",
    mapID = 1707,
    x = 0.561, y = 0.845,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[175522] = {
    name = "Kelli Hoo",
    mapID = 1707,
    x = 0.55, y = 0.829,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[175523] = {
    name = "Provisioner Prothos",
    mapID = 1707,
    x = 0.57, y = 0.798,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[175524] = {
    name = "Battlemaster Endios",
    mapID = 1707,
    x = 0.58, y = 0.814,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[175574] = {
    name = "Angler Danica",
    mapID = 1533,
    x = 0.496, y = 0.632,
    faction = "Neutral",
    types = { "profession" },
}

VendorLocations[175823] = {
    name = "Forgelite Neptira",
    mapID = 1708,
    x = 0.569, y = 0.309,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[176064] = {
    name = "Adjutant Mikaros",
    mapID = 1670,
    x = 0.476, y = 0.772,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[176065] = {
    name = "Liawyn",
    mapID = 1670,
    x = 0.47, y = 0.768,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[176066] = {
    name = "Darvel the Frugal",
    mapID = 1670,
    x = 0.466, y = 0.772,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[176067] = {
    name = "Dar Vattish",
    mapID = 1670,
    x = 0.478, y = 0.779,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[176197] = {
    name = "Griftah",
    mapID = 1670,
    x = 0.51, y = 0.434,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[176368] = {
    name = "Archivist Leonara",
    mapID = 1670,
    x = 0.461, y = 0.777,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[177829] = {
    name = "Ko'tul",
    mapID = 1670,
    x = 0.638, y = 0.36,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[177958] = {
    name = "Firim",
    mapID = 1970,
    x = 0.53, y = 0.291,
    faction = "Neutral",
    types = { "food" },
    note = "ATT — This item is only available after completing the Daily Quest: Materials of Creation (64717) or Hallow Efforts (64579).",
}

VendorLocations[178176] = {
    name = "Night Guardian Jethraasa",
    mapID = 1700,
    x = 0.551, y = 0.461,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[178257] = {
    name = "Archivist Roh-Suir",
    mapID = 1961,
    x = 0.616, y = 0.217,
    faction = "Neutral",
    types = { "food", "transmog", "faction" },
    repFactionID = 2472,
    minStanding = 1,
    note = "ATT — |cFFfe040fYou will not receive a Covenant specific Legendary if you are not part of said Covenant.|r",
}

VendorLocations[179214] = {
    name = "Bonesmith Heirmir",
    mapID = 1961,
    x = 0.635, y = 0.253,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[179321] = {
    name = "Duchess Mynx",
    mapID = 1961,
    x = 0.635, y = 0.233,
    faction = "Neutral",
    types = { "food", "transmog", "faction" },
    repFactionID = 2470,
    minStanding = 3000,
    note = "ATT — These items can also drop from War Chests awarded by Covenant Assaults, the Death's Advance War Chest, and occasionally ",
}

VendorLocations[181135] = {
    name = "Servitor Interface",
    mapID = 1970,
    x = 0.702, y = 0.286,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[181681] = {
    name = "Tu'kol",
    mapID = 1670,
    x = 0.638, y = 0.36,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[182257] = {
    name = "Vilo",
    mapID = 1970,
    x = 0.348, y = 0.641,
    faction = "Neutral",
    types = { "food", "transmog", "faction" },
    repFactionID = 2478,
}

VendorLocations[182864] = {
    name = "Au'Dara",
    mapID = 1670,
    x = 0.597, y = 0.706,
    faction = "Neutral",
    types = { "food" },
    note = "ATT — Next to the flightmaster.",
}

VendorLocations[183962] = {
    name = "Olea Manu",
    mapID = 1970,
    x = 0.372, y = 0.447,
    faction = "Neutral",
    types = { "transmog" },
    note = "ATT — Only Available after Hanoas Questline",
}

VendorLocations[185092] = {
    name = "Shade of Irik-tu",
    mapID = 1970,
    x = 0.346, y = 0.481,
    faction = "Neutral",
    types = { "general" },
    note = "ATT — Only available while dead.",
}

VendorLocations[185587] = {
    name = "Rafiq",
    mapID = 1970,
    x = 0.606, y = 0.51,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[185713] = {
    name = "Hadja",
    mapID = 1970,
    x = 0.352, y = 0.657,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[185748] = {
    name = "Mai Toa",
    mapID = 1970,
    x = 0.586, y = 0.498,
    faction = "Neutral",
    types = { "food" },
}

VendorLocations[187651] = {
    name = "Rendle",
    mapID = 1970,
    x = 0.346, y = 0.64,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[188377] = {
    name = "So'turu",
    mapID = 1670,
    x = 0.67, y = 0.322,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[188386] = {
    name = "Ta'choso",
    mapID = 1670,
    x = 0.673, y = 0.327,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[188391] = {
    name = "Ko'ropo",
    mapID = 1670,
    x = 0.667, y = 0.316,
    faction = "Neutral",
    types = { "general" },
}

VendorLocations[252687] = {
    name = "Collector Ta'steld",
    mapID = 1670,
    x = 0.563, y = 0.637,
    faction = "Neutral",
    types = { "food", "transmog" },
}

------------------------------------------------------------------
-- Instances / misc
------------------------------------------------------------------

VendorLocations[14828] = {
    name = "Gelvas Grimegate",
    mapID = 407,
    x = 0.477, y = 0.647,
    faction = "Alliance",
    types = { "food", "transmog" },
}

VendorLocations[14844] = {
    name = "Sylannia",
    mapID = 407,
    x = 0.51, y = 0.692,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[14845] = {
    name = "Stamp Thunderhorn",
    mapID = 407,
    x = 0.528, y = 0.679,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[14846] = {
    name = "Lhara",
    mapID = 407,
    x = 0.48, y = 0.695,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[14847] = {
    name = "Professor Thaddeus Paleo",
    mapID = 407,
    x = 0.519, y = 0.609,
    faction = "Alliance",
    types = { "general" },
    note = "ATT — You can trade in a joker for any one of the cards you are missing to Thaddeus Paleo at the Darkmoon Faire.",
}

VendorLocations[14860] = {
    name = "Flik",
    mapID = 407,
    x = 0.554, y = 0.701,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[55072] = {
    name = "Barum",
    mapID = 407,
    x = 0.475, y = 0.663,
    faction = "Alliance",
    types = { "transmog" },
    note = "ATT — This vendor sells additional ensembles which are only visible to those who completed the original T0.5 questline. If you",
}

VendorLocations[55103] = {
    name = "Galissa Sundew",
    mapID = 407,
    x = 0.525, y = 0.887,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[55278] = {
    name = "Boomie Sparks",
    mapID = 407,
    x = 0.482, y = 0.719,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[55305] = {
    name = "Carl Goodup",
    mapID = 407,
    x = 0.493, y = 0.784,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[56041] = {
    name = "Rona Greenteeth",
    mapID = 407,
    x = 0.366, y = 0.586,
    faction = "Alliance",
    types = { "food", "transmog" },
    note = "ATT — Rona serves food that she caught and prepared herself, though it's questionable what the food is made of. Sadly the vast",
}

VendorLocations[56069] = {
    name = "Tatia Brine",
    mapID = 407,
    x = 0.5237, y = 0.8876,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[56335] = {
    name = "Daenrand Dawncrest",
    mapID = 407,
    x = 0.476, y = 0.667,
    faction = "Alliance",
    types = { "food", "transmog" },
}

VendorLocations[57983] = {
    name = "Baruma",
    mapID = 407,
    x = 0.476, y = 0.66,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[85484] = {
    name = "Chester",
    mapID = 407,
    x = 0.514, y = 0.75,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[108785] = {
    name = "Scarlet Quartermaster",
    mapID = 407,
    x = 0.582, y = 0.806,
    faction = "Alliance",
    types = { "transmog" },
    note = "ATT — You must be wearing Tabard of the Scarlet Crusade in order to purchase items from the Scarlet Quartermaster. A tabard th",
}

VendorLocations[151950] = {
    name = "Mrrglrlr",
    mapID = 1355,
    x = 0.39, y = 0.538,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[151953] = {
    name = "Hurlgrl",
    mapID = 1355,
    x = 0.386, y = 0.546,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[152084] = {
    name = "Mrrl",
    mapID = 1355,
    x = 0.391, y = 0.544,
    faction = "Alliance",
    types = { "reagents", "food" },
    note = "ATT — Contains Mardivas reagents.",
}

VendorLocations[153024] = {
    name = "Suva",
    mapID = 1355,
    x = 0.502, y = 0.639,
    faction = "Horde",
    types = { "transmog" },
}

VendorLocations[153509] = {
    name = "Artisan Okata",
    mapID = 1355,
    x = 0.378, y = 0.558,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[153510] = {
    name = "Artisan Itanu",
    mapID = 1355,
    x = 0.378, y = 0.557,
    faction = "Alliance",
    types = { "food" },
}

VendorLocations[153512] = {
    name = "Finder Pruc",
    mapID = 1355,
    x = 0.491, y = 0.622,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[153514] = {
    name = "Finder Palta",
    mapID = 1355,
    x = 0.492, y = 0.62,
    faction = "Horde",
    types = { "food" },
}

VendorLocations[154002] = {
    name = "Atolia Seapearl",
    mapID = 1355,
    x = 0.51, y = 0.655,
    faction = "Horde",
    types = { "food", "transmog", "faction" },
    repFactionID = 2373,
    note = "ATT — Requires completing the achievement |cffffff00Nautical Battlefield Training|r. ",
}

VendorLocations[154140] = {
    name = "Speaker Utia",
    mapID = 1355,
    x = 0.38, y = 0.557,
    faction = "Alliance",
    types = { "food", "transmog", "faction" },
    repFactionID = 2400,
    note = "ATT — Requires completing the achievement |cffffff00Nautical Battlefield Training|r. ",
}

VendorLocations[154652] = {
    name = "Dazzerian",
    mapID = 1355,
    x = 0.488, y = 0.606,
    faction = "Horde",
    types = { "food" },
    note = "ATT — Requires completing the achievement |cffffff00Fighting on Two Fronts|r. ",
}

VendorLocations[154653] = {
    name = "Tomas Riogain",
    mapID = 1355,
    x = 0.381, y = 0.554,
    faction = "Alliance",
    types = { "food" },
    note = "ATT — Requires completing the achievement |cffffff00Fighting on Two Fronts|r. ",
}

VendorLocations[154860] = {
    name = "Feylana the Handler",
    mapID = 1355,
    x = 0.736, y = 0.46,
    faction = "Alliance",
    types = { "general" },
}

VendorLocations[156800] = {
    name = "Quartermaster Richter",
    mapID = 1409,
    x = 0.522, y = 0.552,
    faction = "Alliance",
    types = { "transmog" },
}

VendorLocations[167213] = {
    name = "Provisioner Jin'hake",
    mapID = 1409,
    x = 0.524, y = 0.556,
    faction = "Horde",
    types = { "transmog" },
}

------------------------------------------------------------------
-- Midnight vendors not yet in VendorMap's own data (added 2026-09-29,
-- pulled directly from Wowhead NPC pages' embedded g_mapperData - the same
-- coordinate data VendorMap itself is generated from, just fetched by hand
-- for these because VendorMap hadn't caught up to Midnight's newest zones
-- yet as of this addon's own research pass)
------------------------------------------------------------------

VendorLocations[242725] = {
    name = "Armorer Goldcrest",
    mapID = 2395,
    x = 0.434, y = 0.474,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[249197] = {
    name = "Armorer Kalinovan",
    mapID = 241,
    x = 0.496, y = 0.812,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[257505] = {
    name = "Bloodletter Kisa",
    mapID = 2444,
    x = 0.348, y = 0.79,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[231405] = {
    name = "Boatswain Hardee",
    mapID = 2346,
    x = 0.632, y = 0.162,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[240838] = {
    name = "Caeris Fairdawn",
    mapID = 2395,
    x = 0.434, y = 0.474,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[243221] = {
    name = "Captain Dawnrunner",
    mapID = 2393,
    x = 0.34, y = 0.81,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[267315] = {
    name = "Fieldsmith Ventem",
    mapID = 2599,
    x = 0.604, y = 0.164,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[250450] = {
    name = "Fixer So'kir",
    mapID = 2339,
    x = 0.522, y = 0.462,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[250454] = {
    name = "Fixer So'tho",
    mapID = 2339,
    x = 0.524, y = 0.464,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[243220] = {
    name = "Irissa Bloodstar",
    mapID = 2393,
    x = 0.34, y = 0.804,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[268228] = {
    name = "Jan'sari the Watchful",
    mapID = 2512,
    x = 0.588, y = 0.46,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[243224] = {
    name = "Knight-Lord Bloodvalor",
    mapID = 2393,
    x = 0.342, y = 0.814,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[231408] = {
    name = "Lab Assistant Laszly",
    mapID = 2346,
    x = 0.272, y = 0.724,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[219222] = {
    name = "Lalandi",
    mapID = 2339,
    x = 0.552, y = 0.762,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[240279] = {
    name = "Magovu",
    mapID = 2437,
    x = 0.458, y = 0.658,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[251259] = {
    name = "Mothkeeper Wew'tam",
    mapID = 2413,
    x = 0.492, y = 0.544,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[240407] = {
    name = "Naynar",
    mapID = 2413,
    x = 0.51, y = 0.508,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[242726] = {
    name = "Neriv",
    mapID = 2395,
    x = 0.434, y = 0.474,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[242724] = {
    name = "Ranger Allorn",
    mapID = 2395,
    x = 0.434, y = 0.474,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[231406] = {
    name = "Rocco Razzboom",
    mapID = 2346,
    x = 0.39, y = 0.22,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[219216] = {
    name = "Rogurn",
    mapID = 2339,
    x = 0.598, y = 0.694,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[231407] = {
    name = "Shredz the Scrapper",
    mapID = 2346,
    x = 0.532, y = 0.724,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[231396] = {
    name = "Sitch Lowdown",
    mapID = 2346,
    x = 0.304, y = 0.388,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[231409] = {
    name = "Smaks Topskimmer",
    mapID = 2346,
    x = 0.436, y = 0.502,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[195912] = {
    name = "Storm Hunter William",
    mapID = 84,
    x = 0.25, y = 0.532,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[195899] = {
    name = "Storm Huntress Suhrakka",
    mapID = 1,
    x = 0.558, y = 0.124,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[248328] = {
    name = "Void Researcher Anomander",
    mapID = 2405,
    x = 0.524, y = 0.728,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[255422] = {
    name = "Voidknight Vivi",
    mapID = 2444,
    x = 0.404, y = 0.828,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[265581] = {
    name = "Zuronar",
    mapID = 2599,
    x = 0.63, y = 0.204,
    faction = "Neutral",
    types = { "transmog" },
}

VendorLocations[199720] = {
    name = "Glamora",
    mapID = 2112,
    x = 0.454, y = 0.384,
    faction = "Neutral",
    types = { "transmog" },
}


------------------------------------------------------------------
-- Mount vendors added by Xal's Reins (2026-10-06)
-- Looked up individually from Wowhead / warcraft.wiki.gg NPC pages -
-- these were missing from the VendorMap extract above. Coordinates are
-- the page's own, map IDs checked against the UiMapID tables.
------------------------------------------------------------------

-- Ramkahen, Uldum
VendorLocations[48617] = {
    name = "Blacksmith Abasi",
    mapID = 249,
    x = 0.54, y = 0.332,
    faction = "Neutral",
    types = { "mount" },
}

-- Hellscream's Grasp, Tol Barad Peninsula
VendorLocations[48531] = {
    name = "Pogg",
    mapID = 245,
    x = 0.545, y = 0.807,
    faction = "Horde",
    types = { "mount" },
}

-- Baradin Base Camp, Tol Barad Peninsula
VendorLocations[47328] = {
    name = "Quartermaster Brazie",
    mapID = 245,
    x = 0.725, y = 0.625,
    faction = "Alliance",
    types = { "mount" },
}

-- The Exodar
VendorLocations[17584] = {
    name = "Torallius the Pack Handler",
    mapID = 103,
    x = 0.815, y = 0.52,
    faction = "Alliance",
    types = { "mount" },
}

-- Royal Exchange, Silvermoon City (Midnight - moved from Thuron's Livery, Eversong Woods)
VendorLocations[254366] = {
    name = "Winaestra",
    mapID = 2393,
    x = 0.672, y = 0.66,
    faction = "Horde",
    types = { "mount" },
}

-- Ve'nari's Refuge, The Maw
VendorLocations[162804] = {
    name = "Ve'nari",
    mapID = 1543,
    x = 0.468, y = 0.416,
    faction = "Neutral",
    types = { "mount" },
}

-- Central Encampment, Emerald Dream
VendorLocations[212797] = {
    name = "Talisa Whisperbloom",
    mapID = 2200,
    x = 0.498, y = 0.62,
    faction = "Neutral",
    types = { "mount" },
}

-- Trading Post, Canals, Stormwind City
VendorLocations[185468] = {
    name = "Tawny Seabraid",
    mapID = 84,
    x = 0.51, y = 0.718,
    faction = "Alliance",
    types = { "mount" },
}

-- Trading Post, Valley of Strength, Orgrimmar
VendorLocations[185473] = {
    name = "Zen'kala",
    mapID = 85,
    x = 0.485, y = 0.761,
    faction = "Horde",
    types = { "mount" },
}

-- Shadow Point, K'aresh
VendorLocations[245344] = {
    name = "Zo'turu",
    mapID = 2371,
    x = 0.42, y = 0.222,
    faction = "Neutral",
    types = { "mount" },
}

------------------------------------------------------------------
-- Midnight (12.0+) mount vendors added by Xal's Reins (2026-10-06)
-- Coordinates and map IDs are the NPC pages' own (Wowhead, cross-checked
-- against warcraft.wiki.gg where a page existed).
------------------------------------------------------------------

-- Silvermoon City - Undercoin vendor
VendorLocations[242398] = {
    name = "Naleidea Rivergleam",
    mapID = 2393,
    x = 0.526, y = 0.78,
    faction = "Neutral",
    types = { "mount" },
}

-- Silvermoon City - Voidlight Marl / Delver's Journey vendor
VendorLocations[242399] = {
    name = "Telemancer Astrandis",
    mapID = 2393,
    x = 0.524, y = 0.786,
    faction = "Neutral",
    types = { "mount" },
}

-- Silvermoon City - Prey mounts
VendorLocations[252956] = {
    name = "Construct V'anore",
    mapID = 2393,
    x = 0.558, y = 0.658,
    faction = "Neutral",
    types = { "mount" },
}

-- Silvermoon City - Prey mounts (wiki places it at 0.558, 0.658)
VendorLocations[259939] = {
    name = "Construct E'nui",
    mapID = 2393,
    x = 0.568, y = 0.67,
    faction = "Neutral",
    types = { "mount" },
}

-- Silvermoon City, Bazaar - Ritual Sites vendor
VendorLocations[255503] = {
    name = "Sergeant Vornin",
    mapID = 2393,
    x = 0.484, y = 0.504,
    faction = "Neutral",
    types = { "mount" },
}

-- Silvermoon City - Decor Duel (event retired)
VendorLocations[256084] = {
    name = "Gamesmaster Fleurian",
    mapID = 2393,
    x = 0.314, y = 0.764,
    faction = "Neutral",
    types = { "mount" },
}

-- Slayer's Rise, Voidstorm - Slayer's Duellum
VendorLocations[258328] = {
    name = "Thraxadar",
    mapID = 2444,
    x = 0.392, y = 0.81,
    faction = "Neutral",
    types = { "mount" },
}

-- The Coiled Isle - Bloodsworn Crew
VendorLocations[257598] = {
    name = "Second Mate Sluggs",
    mapID = 2512,
    x = 0.516, y = 0.498,
    faction = "Neutral",
    types = { "mount" },
}

-- Vaults of Atal'Utek
VendorLocations[272751] = {
    name = "Skull of Er'inye",
    mapID = 2509,
    x = 0.512, y = 0.624,
    faction = "Neutral",
    types = { "mount" },
}
