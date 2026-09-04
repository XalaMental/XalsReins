-- MountData.lua
-- Xal's Reins - the mount roster data layer.
--
-- Everything here comes straight out of C_MountJournal; no external database
-- ships with this addon and nothing needs updating when Blizzard adds mounts.
--
-- Deliberately uses C_MountJournal.GetMountIDs() rather than the
-- GetNumDisplayedMounts/GetDisplayedMountInfo pair: the displayed-mount
-- functions respect whatever filters the player has set inside Blizzard's own
-- Mount Journal window, which would silently hide rows from us. GetMountIDs is
-- the full, unfiltered roster - collected and uncollected together - and we
-- never touch the player's own journal filter settings to get it.

local addonName, addonTable = ...
local MountData = addonTable.MountData

MountData.roster = nil   -- array of entries, sorted by name
MountData.byID   = nil   -- mountID -> entry
MountData.extra  = {}    -- mountID -> lazily fetched description/source
MountData.stats  = nil

-- Mount source categories reuse the pet journal's own label globals
-- (BATTLE_PET_SOURCE_1, _2, ...). The exact number->label mapping is confirmed
-- live in-game via "/xro sources" rather than hardcoded here, so a missing or
-- renamed global degrades to a readable placeholder instead of erroring.
function MountData.SourceLabel(sourceType)
    if not sourceType then return "Unknown" end
    -- sourceType 0 means uncategorised and has no BATTLE_PET_SOURCE_0 global;
    -- confirmed live (Amani Hex Bear). Don't surface "Source 0" to players.
    if sourceType == 0 then return "Unknown" end
    return _G["BATTLE_PET_SOURCE_" .. sourceType] or ("Source " .. tostring(sourceType))
end

function MountData.FactionLabel(entry)
    if not entry.isFactionSpecific then return nil end
    if entry.faction == 0 then return "Horde" end
    if entry.faction == 1 then return "Alliance" end
    return nil
end

local playerFaction
function MountData:PlayerFaction()
    if not playerFaction then
        playerFaction = UnitFactionGroup("player")
    end
    return playerFaction
end

-- Raw tooltip lines for a mount's summon spell. This is where the
-- restrictions that C_MountJournal has no structural flag for actually live -
-- class locks, race locks, profession requirements, reputation gates - as
-- real text the client generates for THIS character.
--
-- Cached per mount; the scan is far too expensive to run across the whole
-- roster at login.
function MountData:GetTooltipLines(mountID)
    local entry = self.byID and self.byID[mountID]
    if not entry or not entry.spellID then return {} end

    if entry.tooltipLines then return entry.tooltipLines end

    local lines = {}
    if C_TooltipInfo and C_TooltipInfo.GetSpellByID then
        local data = C_TooltipInfo.GetSpellByID(entry.spellID)
        if data then
            -- Older builds hand back unpopulated line args until surfaced.
            if TooltipUtil and TooltipUtil.SurfaceArgs then
                TooltipUtil.SurfaceArgs(data)
                for _, line in ipairs(data.lines or {}) do
                    TooltipUtil.SurfaceArgs(line)
                end
            end

            for _, line in ipairs(data.lines or {}) do
                if line.leftText and line.leftText ~= "" then
                    lines[#lines + 1] = {
                        text  = line.leftText,
                        type  = line.type,
                        color = line.leftColor,
                    }
                end
            end
        end
    end

    entry.tooltipLines = lines
    return lines
end

-- Pulls the restriction lines out of that tooltip. Two signals, either is
-- enough: the line is explicitly typed as a usage requirement, or the client
-- coloured it red, which is what it does for a requirement THIS character
-- fails. Red is the important one - it means the game has already worked out
-- that this character can't have it, whatever the reason happens to be.
function MountData:GetRequirements(mountID)
    local reqs = {}
    for _, line in ipairs(self:GetTooltipLines(mountID)) do
        local isRequirementType = line.type == Enum.TooltipDataLineType.UsageRequirement
        local isRed = false
        if line.color and line.color.r then
            isRed = line.color.r > 0.8 and line.color.g < 0.2 and line.color.b < 0.2
        end

        if isRequirementType or isRed then
            reqs[#reqs + 1] = { text = line.text, failing = isRed }
        end
    end
    return reqs
end

-- "Can THIS character go and get this mount" - the only per-character question
-- a collector cares about. Deliberately ignores isUsable (situational: flips
-- false just for standing indoors) and shouldHideOnChar (mostly the faction
-- restriction again, plus oddities like the Swift Spectral Gryphon).
--
-- Faction comes from real journal data and is checked at build time for every
-- mount. Everything else - class, race, profession, reputation - is read out
-- of the spell tooltip on demand, because those have no structural flag
-- anywhere in C_MountJournal.
function MountData:EvaluateAcquisition(entry)
    entry.canAcquire = true
    entry.blockedReason = nil

    local mountFaction = MountData.FactionLabel(entry)
    if mountFaction then
        entry.factionLabel = mountFaction
        if mountFaction ~= self:PlayerFaction() then
            entry.canAcquire = false
            entry.blockedReason = mountFaction .. " only"
        end
    end

    return entry
end

-- The professions this character actually has, lowercased for comparison.
-- Rebuilt on demand rather than cached at login, since a profession can be
-- learned or dropped mid-session.
function MountData:PlayerProfessions()
    local have = {}
    if not GetProfessions then return have end

    local prof1, prof2 = GetProfessions()
    for _, index in ipairs({ prof1, prof2 }) do
        if index and GetProfessionInfo then
            local name = GetProfessionInfo(index)
            if name and name ~= "" then have[name:lower()] = true end
        end
    end
    return have
end

-- Profession is INFORMATIONAL, not a block (decided 2026-08-18).
--
-- "Profession: Engineering" in the source text means an engineer CRAFTS it,
-- not that you must be one to ride it - the spell carries no usage requirement
-- at all (confirmed live: 0 tooltip requirement lines on Turbo-Charged Flying
-- Machine). Crafted mounts can be bought or made by a guildmate, so hiding
-- them would remove mounts the player could genuinely go and get.
--
-- Kept local rather than read across from another file: a cross-file lookup
-- here fails OPEN and silently changes behaviour.
local REAL_PROFESSIONS = {
    ["alchemy"] = true, ["blacksmithing"] = true, ["enchanting"] = true,
    ["engineering"] = true, ["herbalism"] = true, ["inscription"] = true,
    ["jewelcrafting"] = true, ["leatherworking"] = true, ["mining"] = true,
    ["skinning"] = true, ["tailoring"] = true,
}

-- Exposed so the /xro why diagnostic can report each step separately.
function MountData:IsRealProfession(name)
    if not name then return false end
    return REAL_PROFESSIONS[name:lower()] == true
end

-- Returns the profession this character is missing for a mount, or nil. Used
-- as a NOTE on the detail popup; never as a reason to hide anything.
function MountData:MissingProfession(entry)
    local required = self:GetSourceProfession(entry)
    if not required then return nil end

    -- Only meaningful for a genuine profession; the same label is used for
    -- crafting systems anyone can use, e.g. Protoform Synthesis.
    if not self:IsRealProfession(required) then return nil end

    if self:PlayerProfessions()[required:lower()] then return nil end
    return required
end

-- The full per-character answer, tooltip scan included. Separate from
-- EvaluateAcquisition so the cheap faction check can run across the whole
-- roster at login while this only runs for mounts actually being looked at.
function MountData:WhyBlocked(mountID)
    local entry = self.byID and self.byID[mountID]
    if not entry then return nil end

    -- Deduped: the background refinement pass stores its verdict on the entry,
    -- and the same check runs again here, so without this the reason came out
    -- as "Requires Engineering, Requires Engineering".
    local reasons, seen = {}, {}
    local function add(reason)
        if not reason or reason == "" or seen[reason] then return end
        seen[reason] = true
        reasons[#reasons + 1] = reason
    end

    add(entry.blockedReason)

    for _, req in ipairs(self:GetRequirements(mountID)) do
        if req.failing then add(req.text) end
    end

    if #reasons == 0 then return nil end
    return table.concat(reasons, ", ")
end

-- Builds the whole roster once. Cheap enough to run at login: this only calls
-- GetMountInfoByID, never the heavier GetMountInfoExtraByID, which is fetched
-- on demand per mount and cached in MountData.extra.
function MountData:Build()
    local ids = C_MountJournal.GetMountIDs()
    if not ids or #ids == 0 then return false end

    local roster, byID = {}, {}
    local stats = {
        total = 0, collected = 0, missing = 0,
        factionLocked = 0, cantAcquire = 0,
        bySource = {},
    }

    for i = 1, #ids do
        local id = ids[i]
        local name, spellID, icon, _, _, sourceType, _, isFactionSpecific,
              faction, shouldHideOnChar, isCollected = C_MountJournal.GetMountInfoByID(id)

        if name then
            local entry = {
                mountID           = id,
                name              = name,
                spellID           = spellID,
                icon              = icon,
                sourceType        = sourceType,
                sourceLabel       = MountData.SourceLabel(sourceType),
                isFactionSpecific = isFactionSpecific,
                faction           = faction,
                shouldHideOnChar  = shouldHideOnChar,
                isCollected       = isCollected,
            }

            self:EvaluateAcquisition(entry)

            roster[#roster + 1] = entry
            byID[id] = entry

            stats.total = stats.total + 1
            if isCollected then
                stats.collected = stats.collected + 1
            else
                stats.missing = stats.missing + 1
            end
            if isFactionSpecific then stats.factionLocked = stats.factionLocked + 1 end
            if not entry.canAcquire then stats.cantAcquire = stats.cantAcquire + 1 end

            local bucket = stats.bySource[entry.sourceLabel]
            if not bucket then
                bucket = { total = 0, collected = 0, sourceType = sourceType }
                stats.bySource[entry.sourceLabel] = bucket
            end
            bucket.total = bucket.total + 1
            if isCollected then bucket.collected = bucket.collected + 1 end
        end
    end

    table.sort(roster, function(a, b) return a.name < b.name end)

    self.roster, self.byID, self.stats = roster, byID, stats
    return true
end

-- Builds on first use if login somehow ran before the journal was populated.
function MountData:Ensure()
    if not self.roster then self:Build() end
    return self.roster
end

-- The "how do I get it" text. Blizzard ships this per mount, already
-- localized - drop and boss name, vendor and location, cost, quest,
-- achievement - so we never scrape it and it can't go stale.
function MountData:GetExtra(mountID)
    local cached = self.extra[mountID]
    if cached then return cached end

    local displayID, description, source, isSelfMount, mountTypeID =
        C_MountJournal.GetMountInfoExtraByID(mountID)

    cached = {
        displayID   = displayID,
        description = description,
        source      = source,
        isSelfMount = isSelfMount,
        mountTypeID = mountTypeID,
    }
    self.extra[mountID] = cached
    return cached
end

-- Case-insensitive substring match on the mount name.
function MountData:Search(text, limit)
    local roster = self:Ensure()
    if not roster or not text or text == "" then return {} end

    local needle = text:lower()
    local hits = {}
    for i = 1, #roster do
        local entry = roster[i]
        if entry.name:lower():find(needle, 1, true) then
            hits[#hits + 1] = entry
            if limit and #hits >= limit then break end
        end
    end
    return hits
end

-- Returns source labels sorted biggest bucket first, for grouped display.
function MountData:SourcesByCount()
    self:Ensure()
    if not self.stats then return {} end

    local list = {}
    for label, bucket in pairs(self.stats.bySource) do
        list[#list + 1] = {
            label      = label,
            total      = bucket.total,
            collected  = bucket.collected,
            sourceType = bucket.sourceType,
        }
    end
    table.sort(list, function(a, b) return a.total > b.total end)
    return list
end

-- Fired from NEW_MOUNT_ADDED so the cached roster doesn't go stale mid-session.
function MountData:MarkCollected(mountID)
    local entry = self.byID and self.byID[mountID]
    if not entry or entry.isCollected then return nil end

    entry.isCollected = true
    if self.stats then
        self.stats.collected = self.stats.collected + 1
        self.stats.missing   = self.stats.missing - 1
        local bucket = self.stats.bySource[entry.sourceLabel]
        if bucket then bucket.collected = bucket.collected + 1 end
    end
    return entry
end

-- ── Reference links ──────────────────────────────────────────────
-- Both are derived from data the game already gives us, so every mount gets a
-- working link with nothing hand-maintained and nothing to go stale.
--
-- Wowhead resolves /spell=<spellID> straight to the mount's own page (verified
-- against real pages, e.g. spell=59976 Black Proto-Drake, spell=48778 Acherus
-- Deathcharger), so every mount gets a real link with nothing to maintain.
function MountData:GetWowheadURL(entry)
    if not entry or not entry.spellID then return nil end
    return "https://www.wowhead.com/spell=" .. entry.spellID
end

-- Video guides are NOT derivable - there is no per-mount video ID anywhere in
-- game data, so these are hand-researched, verified links kept in
-- VideoLinks.lua. No entry means no link, which means no button on the detail
-- popup: a search URL dressed up as a video guide is worse than nothing.
--
-- Keyed by mount NAME rather than mountID because mount IDs only exist inside
-- the running client - the table has to be writable from outside the game.
-- Falls back gracefully on non-English clients, where names won't match and
-- the button simply won't appear.
function MountData:GetVideoURL(entry)
    if not entry or not entry.name then return nil end
    local links = addonTable.VideoLinks
    if not links then return nil end
    local url = links[entry.name]
    if url and url ~= "" then return url end
    return nil
end

-- ── Current zone matching ────────────────────────────────────────
-- The mount journal has no zone field, so this matches the game's own
-- sourcing text against where the player currently is.
--
-- Honest about its limits: it catches mounts whose source text names the
-- place ("Vendor: X, Dalaran", "Drop: Y, Karazhan"). A raid drop that names
-- only a boss won't match from outside - but standing inside that instance
-- will, because GetInstanceInfo hands back the instance name and the source
-- text almost always contains it.
function MountData:CurrentZoneNames()
    local names = {}
    local function add(v)
        if v and v ~= "" then names[#names + 1] = v:lower() end
    end

    add(GetRealZoneText())
    add(GetZoneText())
    add(GetSubZoneText())

    local instanceName, instanceType = GetInstanceInfo()
    -- Outside an instance this returns the continent, which is far too broad
    -- to filter on, so only take it when actually inside one.
    if instanceType and instanceType ~= "none" then
        add(instanceName)
    end

    return names
end

-- The source text is structured, not prose: it carries labelled lines like
-- "Zone: Maldraxxus" and "Covenant: Necrolord". Pull the labelled zone out
-- directly rather than substring-matching the whole blob, which is both more
-- accurate and immune to a zone name appearing incidentally in some other
-- line. Uses the client's own localized ZONE label.
function MountData:GetSourceZone(entry)
    local extra = self:GetExtra(entry.mountID)
    local source = extra and extra.source
    if not source or source == "" then return nil end

    -- Open-world mounts label their place "Zone:", instance drops use
    -- "Location:" (confirmed live: Abyss Worm -> Location: Tomb of Sargeras).
    -- Both are checked, the client's own localized labels first.
    local labels = {}
    if type(ZONE) == "string" and ZONE ~= "" then labels[#labels + 1] = ZONE end
    labels[#labels + 1] = "Zone"
    if type(LOCATION_COLON) == "string" and LOCATION_COLON ~= "" then
        labels[#labels + 1] = (LOCATION_COLON:gsub(":%s*$", ""))
    end
    labels[#labels + 1] = "Location"

    for i = 1, #labels do
        local zone = source:match(labels[i] .. ":%s*([^\r\n]+)")
        -- Called through the table, not as an upvalue: this function is
        -- defined above CleanValue in the file, so a local reference here
        -- would be nil. Table lookup resolves at call time.
        zone = self.CleanValue(zone)
        if zone then return zone end
    end
    return nil
end

-- Matches against `source` only. The flavour description is deliberately
-- excluded - it mentions places in prose constantly and would match nearly
-- everything.
function MountData:MatchesCurrentZone(entry, zoneNames)
    zoneNames = zoneNames or self:CurrentZoneNames()
    if #zoneNames == 0 then return false end

    -- Preferred: the explicit labelled zone.
    local sourceZone = self:GetSourceZone(entry)
    if sourceZone then
        sourceZone = sourceZone:lower()
        for i = 1, #zoneNames do
            if sourceZone == zoneNames[i] or sourceZone:find(zoneNames[i], 1, true) then
                return true
            end
        end
        -- A labelled zone that doesn't match is a definite no; don't fall
        -- through and let some unrelated line produce a false positive.
        return false
    end

    -- Fallback for entries with no labelled zone (many drops name only a
    -- boss or instance).
    local extra = self:GetExtra(entry.mountID)
    local source = extra and extra.source
    if not source or source == "" then return false end

    source = source:lower()
    for i = 1, #zoneNames do
        if source:find(zoneNames[i], 1, true) then return true end
    end
    return false
end

-- ── Raid / dungeon classification ────────────────────────────────
-- The journal says a mount drops in "Tomb of Sargeras" but not whether that's
-- a raid or a dungeon. The Encounter Journal enumerates both lists, so one
-- pass over it gives a name -> kind lookup with nothing hardcoded and nothing
-- to maintain as new instances ship.
MountData.instanceKinds = nil   -- lowercased instance name -> "raid" | "dungeon"

function MountData:BuildInstanceIndex()
    if self.instanceKinds then return self.instanceKinds end
    if not EJ_GetNumTiers or not EJ_SelectTier or not EJ_GetInstanceByIndex then
        return nil
    end

    local kinds = {}
    local restoreTier = EJ_GetCurrentTier and EJ_GetCurrentTier() or nil

    for tier = 1, (EJ_GetNumTiers() or 0) do
        EJ_SelectTier(tier)
        for _, isRaid in ipairs({ false, true }) do
            local index = 1
            while true do
                local _, name = EJ_GetInstanceByIndex(index, isRaid)
                if not name then break end
                kinds[name:lower()] = isRaid and "raid" or "dungeon"
                index = index + 1
            end
        end
    end

    -- Put the Encounter Journal back where the player had it.
    if restoreTier then EJ_SelectTier(restoreTier) end

    self.instanceKinds = kinds
    return kinds
end

-- "raid", "dungeon", or nil. Uses the same labelled place value the zone
-- filter reads - instance drops label it "Location:", open world uses "Zone:".
function MountData:GetInstanceKind(entry)
    local place = self:GetSourceZone(entry)
    if not place then return nil, nil end

    local kinds = self:BuildInstanceIndex()
    if not kinds then return nil, place end

    return kinds[place:lower()], place
end

-- ── Section classification ───────────────────────────────────────
-- Which section a mount belongs to. Every signal below was confirmed against
-- real source text from a live account (see reins_changelog_dev.md).
--
-- Precedence is "whatever describes what you actually DO to get it":
--   Limited time > Crafting > Reputation > Achievement > Zone > Unknown
-- So a reputation mount sold by a vendor in Tiragarde Sound files under
-- Reputation, not under Tiragarde Sound - you grind the rep, the zone is
-- incidental. Limited time outranks everything because it's the one you can
-- actually miss.

MountData.SECTION_LIMITED     = "Limited Time"
MountData.SECTION_CRAFTING    = "Crafting"
MountData.SECTION_REPUTATION  = "Reputation"
MountData.SECTION_ACHIEVEMENT = "Achievements"
MountData.SECTION_UNKNOWN     = "Uncategorised"

-- Matched against the pet-journal source labels. These are localized strings,
-- so on a non-English client these fall through to Zone/Uncategorised rather
-- than misfiling anything. Keying on the raw sourceType numbers instead would
-- be locale-proof; "/xro sources" prints them.
local LIMITED_TIME_SOURCES = {
    ["World Event"]       = true,
    ["Trading Post"]      = true,
    ["Promotion"]         = true,
    ["Trading Card Game"] = true,
}

-- Strips WoW escape sequences and odd whitespace out of a captured value.
--
-- This matters more than it looks: colour codes are INVISIBLE in chat, so a
-- value carrying them prints as a clean "Engineering" while never matching the
-- string "engineering". That's exactly what broke the profession check, and it
-- was silently affecting zone matching too since both read fields this way.
local function CleanValue(v)
    if not v then return nil end
    -- Confirmed live 2026-09-02: Blizzard's structured source text sometimes
    -- separates facts with the literal two-character sequence "|n" (a manual
    -- line-break marker Blizzard's own text uses elsewhere) instead of a real
    -- line-break byte. The capture pattern that finds this value only
    -- excludes actual line-break bytes, so it never stopped there - "Zone:
    -- Ardenweald|nCost: 30000" was captured as one long value, a different
    -- string per mount depending on what followed, even though the real zone
    -- was identical every time. Cut here, before anything else.
    v = v:gsub("|n.*$", "")
    v = v:gsub("|c%x%x%x%x%x%x%x%x", "")   -- colour open
    v = v:gsub("|r", "")                   -- colour close
    v = v:gsub("|H.-|h(.-)|h", "%1")       -- hyperlinks, keep the visible text
    v = v:gsub("|T.-|t", "")               -- inline textures
    v = v:gsub("|A.-|a", "")               -- inline atlas markup
    v = v:gsub("\194\160", " ")            -- non-breaking space - was matching the literal text "94p" instead of the actual character (confirmed 2026-09-02), which is why the same real zone kept splitting into several separate groups
    v = v:gsub("^%s+", ""):gsub("%s+$", "")
    if v == "" then return nil end
    return v
end
MountData.CleanValue = CleanValue

-- Generic labelled-line reader; the source text is structured, not prose.
function MountData:GetSourceField(entry, ...)
    local extra = self:GetExtra(entry.mountID)
    local source = extra and extra.source
    if not source or source == "" then return nil end

    for i = 1, select("#", ...) do
        local label = select(i, ...)
        if type(label) == "string" and label ~= "" then
            local value = CleanValue(source:match(label .. ":%s*([^\r\n]+)"))
            if value then return value end
        end
    end
    return nil
end

function MountData:GetSourceFaction(entry)
    return self:GetSourceField(entry, type(FACTION) == "string" and FACTION or nil, "Faction")
end

function MountData:GetSourceProfession(entry)
    return self:GetSourceField(entry, type(PROFESSION) == "string" and PROFESSION or nil, "Profession")
end

function MountData:SectionFor(entry)
    if LIMITED_TIME_SOURCES[entry.sourceLabel] then
        return self.SECTION_LIMITED
    end

    if entry.sourceLabel == "Profession" or self:GetSourceProfession(entry) then
        return self.SECTION_CRAFTING
    end

    if self:GetSourceFaction(entry) then
        return self.SECTION_REPUTATION
    end

    if entry.sourceLabel == "Achievement" then
        return self.SECTION_ACHIEVEMENT
    end

    local zone = self:GetSourceZone(entry)
    if zone then return zone end

    return self.SECTION_UNKNOWN
end

-- Groups a list into ordered sections. The four named categories come first in
-- a fixed order, then zones alphabetically, then the uncategorised remainder.
-- includeZones=false collapses the zone level away, for when the zone filter
-- is already restricting everything to one place.
function MountData:GroupIntoSections(list, includeZones)
    local buckets, zoneNames = {}, {}

    for i = 1, #list do
        local entry = list[i]
        local key = self:SectionFor(entry)
        local isNamed = key == self.SECTION_LIMITED or key == self.SECTION_CRAFTING
            or key == self.SECTION_REPUTATION or key == self.SECTION_ACHIEVEMENT
            or key == self.SECTION_UNKNOWN

        if not isNamed and not includeZones then
            key = "This Zone"
        end

        local bucket = buckets[key]
        if not bucket then
            bucket = {}
            buckets[key] = bucket
            if not isNamed and key ~= "This Zone" then
                zoneNames[#zoneNames + 1] = key
            end
        end
        bucket[#bucket + 1] = entry
    end

    table.sort(zoneNames)

    local order = {
        self.SECTION_LIMITED,
        self.SECTION_CRAFTING,
        self.SECTION_REPUTATION,
        self.SECTION_ACHIEVEMENT,
        "This Zone",
    }
    for i = 1, #zoneNames do order[#order + 1] = zoneNames[i] end
    order[#order + 1] = self.SECTION_UNKNOWN

    local sections = {}
    for i = 1, #order do
        local key = order[i]
        if buckets[key] then
            sections[#sections + 1] = { name = key, entries = buckets[key] }
            buckets[key] = nil
        end
    end
    return sections
end

-- ── New mounts since last login ──────────────────────────────────
-- The roster is read live, so a mount Blizzard adds in a patch appears on its
-- own - but its prerequisite chain won't exist until someone writes one. This
-- remembers which mountIDs have been seen before so the addon can say what's
-- new rather than the player having to remember to go looking after a patch.
--
-- First run seeds silently: announcing all 1600-odd mounts as "new" would be
-- useless noise.
function MountData:DetectNewMounts()
    if type(XalsReinsDB) ~= "table" then return {} end

    local roster = self:Ensure()
    if not roster then return {} end

    local known = XalsReinsDB.knownMountIDs
    local firstRun = (known == nil)
    known = known or {}

    local new = {}
    for i = 1, #roster do
        local entry = roster[i]
        if not known[entry.mountID] then
            known[entry.mountID] = true
            if not firstRun and not self:IsPlaceholder(entry) then
                new[#new + 1] = entry
            end
        end
    end

    XalsReinsDB.knownMountIDs = known

    -- Kept so it can be re-shown later; a login message is easy to scroll past.
    if #new > 0 then
        local names = {}
        for i = 1, #new do names[i] = new[i].name end
        XalsReinsDB.lastNewMounts = names
    end

    return new
end

-- ── Trading Post rotation ────────────────────────────────────────
-- The Trading Post rotates monthly. The journal marks a mount's source as
-- "Trading Post" forever, so last year's offering reads as gettable when it
-- isn't - you'd have to wait for it to come round again.
--
-- C_PerksProgram gives us the real answer: GetAvailableVendorItemIDs() is
-- this month's list, and each GetVendorItemInfo carries a mountID, so
-- offerings map straight onto our roster with no guesswork.
MountData.tradingPostMounts = nil   -- mountID -> vendor item info, nil until loaded

function MountData:RefreshTradingPost()
    if not C_PerksProgram or not C_PerksProgram.GetAvailableVendorItemIDs then return false end

    local ids = C_PerksProgram.GetAvailableVendorItemIDs()
    if not ids or #ids == 0 then
        -- Perks data isn't loaded yet. Deliberately leave tradingPostMounts as
        -- nil rather than an empty table: an empty table would mean "nothing is
        -- offered", which would wrongly hide every Trading Post mount.
        return false
    end

    local offered = {}
    for i = 1, #ids do
        local info = C_PerksProgram.GetVendorItemInfo(ids[i])
        if info and info.mountID and info.mountID ~= 0 then
            offered[info.mountID] = info
        end
    end

    self.tradingPostMounts = offered
    return true
end

-- Only meaningful once the offering list has actually loaded; returns nil when
-- we genuinely don't know, so callers can tell "not offered" from "no data".
function MountData:IsOfferedThisMonth(entry)
    if not self.tradingPostMounts then return nil end
    return self.tradingPostMounts[entry.mountID] ~= nil
end

function MountData:IsTradingPost(entry)
    return entry.sourceLabel == "Trading Post"
end

-- ── Holiday availability ─────────────────────────────────────────
-- Some mounts only exist while a recurring event is running - Darkmoon Faire,
-- Hallow's End, Brewfest and so on. The calendar knows what's live, so this
-- reads it rather than hardcoding dates that would drift every year.
--
-- Returns a set of lowercased holiday titles running TODAY, or nil when the
-- calendar data isn't available. nil matters: it means "don't know", and the
-- UI must not claim an event isn't running just because we couldn't look.
local holidayCache, holidayCacheAt = nil, nil
local HOLIDAY_CACHE_SECONDS = 300

function MountData:GetActiveHolidays()
    if holidayCache and holidayCacheAt and GetTime
        and (GetTime() - holidayCacheAt) < HOLIDAY_CACHE_SECONDS then
        return holidayCache
    end

    if not C_Calendar or not C_Calendar.GetNumDayEvents or not C_Calendar.GetDayEvent then
        return nil
    end
    if not C_DateAndTime or not C_DateAndTime.GetCurrentCalendarTime then
        return nil
    end

    -- The calendar often has no data until something asks it to load.
    if C_Calendar.OpenCalendar then C_Calendar.OpenCalendar() end

    local today = C_DateAndTime.GetCurrentCalendarTime()
    if not today or not today.monthDay then return nil end

    local count = C_Calendar.GetNumDayEvents(0, today.monthDay)
    if not count then return nil end

    local active = {}
    for i = 1, count do
        local event = C_Calendar.GetDayEvent(0, today.monthDay, i)
        if event and event.title and event.calendarType == "HOLIDAY" then
            -- START / ONGOING / END all mean it's running today; only a blank
            -- sequenceType is ambiguous, and those are kept too rather than
            -- risk hiding a live event.
            active[event.title:lower()] = true
        end
    end

    holidayCache = active
    holidayCacheAt = GetTime and GetTime() or nil
    return active
end

-- true = running, false = not running, nil = couldn't tell.
-- Matches loosely both ways, since the calendar's title and the name written
-- in the data file won't always be worded identically.
function MountData:IsHolidayActive(name)
    if not name or name == "" then return nil end

    local active = self:GetActiveHolidays()
    if not active then return nil end

    local needle = name:lower()
    for title in pairs(active) do
        if title == needle or title:find(needle, 1, true) or needle:find(title, 1, true) then
            return true
        end
    end
    return false
end

-- The event a mount is tied to, if its data entry declares one. Written as a
-- named key alongside the numbered steps: `availability = "Darkmoon Faire"`.
function MountData:GetAvailability(entry)
    local all = addonTable.MountSteps
    if not all or not entry or not entry.name then return nil end
    local data = all[entry.name]
    return data and data.availability or nil
end

-- ── Prerequisite steps ───────────────────────────────────────────
-- See MountSteps.lua. The chain itself is hand-written; whether the player has
-- DONE each step is checked live, which is the part that makes it useful.
function MountData:GetSteps(entry)
    local all = addonTable.MountSteps
    if not all or not entry or not entry.name then return nil end
    local steps = all[entry.name]
    if not steps or #steps == 0 then return nil end
    return steps
end

-- true = done, false = not done, nil = nothing to check against.
--
-- Not every prerequisite is a quest. Achievements, holding a specific item,
-- and accumulating a currency are all common gates and all checkable live, so
-- each has its own field. Anything not covered still works as plain text - it
-- just shows with a neutral marker instead of a tick.
function MountData:StepStatus(step)
    if not step then return nil end

    if step.questID and C_QuestLog and C_QuestLog.IsQuestFlaggedCompleted then
        return C_QuestLog.IsQuestFlaggedCompleted(step.questID) and true or false
    end

    if step.achievementID and GetAchievementInfo then
        -- 4th return is `completed`, and it's account-wide.
        local _, _, _, completed = GetAchievementInfo(step.achievementID)
        return completed and true or false
    end

    if step.itemID then
        local needed = step.count or 1
        local count
        if C_Item and C_Item.GetItemCount then
            -- Search everywhere the player could reasonably be keeping it.
            count = C_Item.GetItemCount(step.itemID, true, false, true, true)
        elseif GetItemCount then
            count = GetItemCount(step.itemID, true)
        end
        if count then return count >= needed end
        return nil
    end

    if step.currencyID and C_CurrencyInfo and C_CurrencyInfo.GetCurrencyInfo then
        local info = C_CurrencyInfo.GetCurrencyInfo(step.currencyID)
        if info and info.quantity then
            return info.quantity >= (step.amount or 1)
        end
        return nil
    end

    if step.factionID and step.reaction and C_Reputation
        and C_Reputation.GetFactionDataByID then
        local data = C_Reputation.GetFactionDataByID(step.factionID)
        if data and data.reaction then
            return data.reaction >= step.reaction
        end
        return false
    end

    return nil
end

-- Steps rendered as a checklist against this character. Returns the text and
-- how many of the checkable steps are done.
-- Returns: text, howManyDone, howManySteps, howManyUntrackable
function MountData:GetStepLines(entry)
    local steps = self:GetSteps(entry)
    if not steps then return nil, 0, 0, 0 end

    -- The denominator is EVERY step, not just the checkable ones. Counting only
    -- what we can verify produced "0 of 1 done" beside three visible lines,
    -- which just reads as broken. A step we can't verify is unknown, not done.
    --
    -- The unknown marker is "?" rather than a dash: a dash sits where a bullet
    -- would and was being read as "completed".
    local lines, done, untracked = {}, 0, 0
    for i = 1, #steps do
        local step = steps[i]
        local status = self:StepStatus(step)
        local marker

        if status == true then
            marker = "|cff44dd66v|r "
            done = done + 1
        elseif status == false then
            marker = "|cffdd5555x|r "
        else
            marker = "|cff999999?|r "
            untracked = untracked + 1
        end

        -- Steps backed by a real ID become clickable, so "complete quest X"
        -- leads somewhere instead of leaving the player hunting for where it
        -- even starts. Custom link type, handled by the detail popup.
        local text = step.text or "?"
        local kind, id
        if step.questID then
            kind, id = "quest", step.questID
        elseif step.achievementID then
            kind, id = "achievement", step.achievementID
        elseif step.itemID then
            kind, id = "item", step.itemID
        elseif step.currencyID then
            kind, id = "currency", step.currencyID
        end

        -- Show the game's own name for the quest when it differs from what was
        -- written down, so a renamed quest reads correctly in game rather than
        -- sending the player looking for a name that no longer exists.
        if step.questID then
            local title = self:GetQuestTitle(step.questID)
            if title and not text:find(title, 1, true) then
                text = text .. "  |cffffd100(" .. title .. ")|r"
            end
        end

        if kind then
            text = "|cff5599ff|Hxalsreins:" .. kind .. ":" .. id .. "|h[" .. text .. "]|h|r"
        end

        lines[#lines + 1] = marker .. text

        -- Where the quest actually starts. A bare quest name is useless if you
        -- don't know who gives it, and the game exposes no giver for a quest
        -- you haven't picked up - so this is written into the data.
        if step.start and step.start ~= "" then
            lines[#lines + 1] = "   |cff999999" .. step.start .. "|r"
        end
    end

    return table.concat(lines, "\n"), done, #steps, untracked
end

-- The quest's REAL name, straight from the game. Works for quests the player
-- has never accepted, which is exactly the case we need.
--
-- The server doesn't always have it cached, so a miss triggers an async load
-- and the popup refreshes when QUEST_DATA_LOAD_RESULT fires. This also quietly
-- catches bad data: a questID that returns no title after loading is either
-- wrong or removed, and a title that differs from the written text means the
-- quest was renamed (Dragonriding -> Skyriding, for instance).
local questTitleRequested = {}

function MountData:GetQuestTitle(questID)
    if not questID or not C_QuestLog then return nil end

    if C_QuestLog.GetTitleForQuestID then
        local title = C_QuestLog.GetTitleForQuestID(questID)
        if title and title ~= "" then return title end
    end

    if C_QuestLog.RequestLoadQuestByID and not questTitleRequested[questID] then
        questTitleRequested[questID] = true
        C_QuestLog.RequestLoadQuestByID(questID)
    end
    return nil
end

-- Wowhead URL for whatever a step links to. Same derivation as the mount
-- links: the URL scheme carries the ID directly, so nothing is maintained.
function MountData:StepURL(kind, id)
    if not kind or not id then return nil end
    return "https://www.wowhead.com/" .. kind .. "=" .. id
end

-- ── Unobtainable / placeholder filtering ─────────────────────────
-- See Unobtainable.lua. The journal happily lists mounts from events that
-- closed years ago and Blizzard's own "(PH)" placeholder entries, none of
-- which belong in a to-do list.
function MountData:IsPlaceholder(entry)
    local prefixes = addonTable.PlaceholderPrefixes
    if not prefixes or not entry.name then return false end
    for i = 1, #prefixes do
        if entry.name:sub(1, #prefixes[i]) == prefixes[i] then return true end
    end
    return false
end

function MountData:IsUnobtainable(entry)
    if self:IsPlaceholder(entry) then return true end

    local fragments = addonTable.UnobtainableSources
    if not fragments then return false end

    local extra = self:GetExtra(entry.mountID)
    local source = extra and extra.source
    if not source or source == "" then return false end

    source = source:lower()
    for i = 1, #fragments do
        if source:find(fragments[i]:lower(), 1, true) then return true end
    end
    return false
end

-- Groups a list by instance name, for the Raids and Dungeons tabs. Only
-- mounts whose place resolves to the requested kind are included.
function MountData:GroupByInstance(list, wantKind)
    local buckets, names = {}, {}

    for i = 1, #list do
        local entry = list[i]
        local kind, place = self:GetInstanceKind(entry)
        if kind == wantKind and place then
            local bucket = buckets[place]
            if not bucket then
                bucket = {}
                buckets[place] = bucket
                names[#names + 1] = place
            end
            bucket[#bucket + 1] = entry
        end
    end

    table.sort(names)

    local sections = {}
    for i = 1, #names do
        sections[#sections + 1] = { name = names[i], entries = buckets[names[i]] }
    end
    return sections
end

-- ── The to-do list ───────────────────────────────────────────────
-- The main tracker's contents: mounts this account does NOT own, filtered down
-- to the ones the character currently logged in could actually go and get.
--
-- Faction is resolved for every mount at build time, so it's applied here
-- immediately. Class/race/profession locks need a tooltip scan per mount,
-- which is far too slow to run across the whole roster inline - RefineTodo()
-- below does that progressively in the background and prunes as it learns.
function MountData:GetTodoList()
    local roster = self:Ensure()
    if not roster then return {} end

    local todo = {}
    for i = 1, #roster do
        local entry = roster[i]
        local outOfRotation = false
        if self:IsTradingPost(entry) then
            -- nil means the offering list hasn't loaded; don't hide anything
            -- on the strength of missing data.
            outOfRotation = self:IsOfferedThisMonth(entry) == false
        end

        if not entry.isCollected and entry.canAcquire and not entry.refinedBlocked
            and not self:IsUnobtainable(entry) and not outOfRotation then
            todo[#todo + 1] = entry
        end
    end
    return todo
end

-- Progressive background pass: walks the uncollected mounts a few at a time
-- and marks any the tooltip says this character fails. Spread across frames so
-- login never stalls on a thousand tooltip scans. Calls onProgress(done, total)
-- as it goes so the tracker can refresh itself while this fills in.
function MountData:RefineTodo(onProgress)
    if self.refineTicker then return end

    local roster = self:Ensure()
    if not roster then return end

    local pending = {}
    for i = 1, #roster do
        local entry = roster[i]
        if not entry.isCollected and entry.canAcquire and entry.refinedBlocked == nil then
            pending[#pending + 1] = entry
        end
    end

    local total, index, PER_TICK = #pending, 0, 25
    if total == 0 then
        if onProgress then onProgress(0, 0) end
        return
    end

    self.refineTicker = C_Timer.NewTicker(0.05, function(ticker)
        for _ = 1, PER_TICK do
            index = index + 1
            if index > total then
                ticker:Cancel()
                self.refineTicker = nil
                if onProgress then onProgress(total, total) end
                return
            end

            local entry = pending[index]
            local blocked = false

            for _, req in ipairs(self:GetRequirements(entry.mountID)) do
                if not blocked and req.failing then
                    blocked = true
                    entry.blockedReason = entry.blockedReason or req.text
                    break
                end
            end
            entry.refinedBlocked = blocked
        end

        if onProgress then onProgress(index, total) end
    end)
end
