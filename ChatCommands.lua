-- ChatCommands.lua
-- Xal's Reins - slash command handling.
--
-- This is the power-user fallback, not the main way in - the mount list window
-- is the real interface. Until that window exists, these commands are also how
-- we read the raw roster data back out of the game to confirm what the API
-- actually returns.

local addonName, addonTable = ...
local ChatCommands = addonTable.ChatCommands
local MountData    = addonTable.MountData

local ACCENT = "|cffb88c38"
local WHITE  = "|cffffffff"
local GREEN  = "|cff44dd66"
local GREY   = "|cff999999"
local RED    = "|cffdd5555"
local RESET  = "|r"

local function Say(msg)
    print(ACCENT .. "Xal's Reins:" .. RESET .. " " .. (msg or ""))
end

local function Line(msg)
    print("  " .. (msg or ""))
end

local function PrintSummary()
    local roster = MountData:Ensure()
    if not roster or not MountData.stats then
        Say("couldn't read the mount journal yet - try again in a moment.")
        return
    end

    local s = MountData.stats
    local pct = s.total > 0 and math.floor((s.collected / s.total) * 100 + 0.5) or 0

    Say(WHITE .. s.total .. RESET .. " mounts in the journal.")
    Line(GREEN .. s.collected .. RESET .. " collected, " ..
         WHITE .. s.missing .. RESET .. " missing (" .. pct .. "%).")
    Line(GREY .. s.factionLocked .. " faction-specific, " ..
         s.cantAcquire .. " this character can't get." .. RESET)
    Line(GREY .. "/xro sources" .. RESET .. " for the breakdown, " ..
         GREY .. "/xro find <name>" .. RESET .. " to look one up.")
end

local function PrintSources()
    local list = MountData:SourcesByCount()
    if #list == 0 then
        Say("no source data yet.")
        return
    end

    Say("mounts by source category:")
    for i = 1, #list do
        local row = list[i]
        Line(WHITE .. row.label .. RESET ..
             GREY .. "  (sourceType " .. tostring(row.sourceType) .. ")" .. RESET ..
             " - " .. GREEN .. row.collected .. RESET .. " / " .. row.total)
    end
end

local function PrintMount(entry, showDescription)
    local extra = MountData:GetExtra(entry.mountID)
    local mark  = entry.isCollected and (GREEN .. "[have]" .. RESET) or (GREY .. "[need]" .. RESET)

    Line(mark .. " " .. WHITE .. entry.name .. RESET ..
         GREY .. "  (id " .. entry.mountID .. ", spell " .. tostring(entry.spellID) .. ")" .. RESET)

    local blocked = MountData:WhyBlocked(entry.mountID)
    if blocked then
        Line("   " .. RED .. "This character can't get it:" .. RESET .. " " .. blocked)
    end

    -- The source text already leads with its own category label, so printing
    -- entry.sourceLabel in front of it produced "Drop: Drop: <boss>".
    if extra.source and extra.source ~= "" then
        Line("   " .. (extra.source:gsub("[\r\n]+", "  |  ")))
    else
        Line("   " .. GREY .. entry.sourceLabel .. " - no source text" .. RESET)
    end

    if showDescription and extra.description and extra.description ~= "" then
        Line("   " .. GREY .. extra.description:gsub("\n", " ") .. RESET)
    end
end

local function PrintDump(countArg)
    local roster = MountData:Ensure()
    if not roster then
        Say("couldn't read the mount journal yet.")
        return
    end

    local count = tonumber(countArg) or 5
    if count < 1 then count = 1 end
    if count > 25 then count = 25 end

    Say("first " .. count .. " mounts, full detail:")
    for i = 1, math.min(count, #roster) do
        PrintMount(roster[i], true)
    end
end

local function PrintFind(text)
    if not text or text == "" then
        Say("usage: /xro find <part of a mount name>")
        return
    end

    local hits = MountData:Search(text, 12)
    if #hits == 0 then
        Say("nothing matching " .. WHITE .. text .. RESET .. ".")
        return
    end

    Say(#hits .. " match(es) for " .. WHITE .. text .. RESET .. ":")
    for i = 1, #hits do
        PrintMount(hits[i], false)
    end
end

-- Diagnostic (temporary, 2026-09-02): shows exactly why entries that display
-- the same zone name are ending up in separate groups - the CLEANED zone
-- value used for grouping, byte-escaped so any invisible character shows up
-- as a visible \NNN code instead of disappearing.
local function PrintZoneDump(query)
    if not query or query == "" then
        Say("usage: /xro zonedump <part of a zone name>")
        return
    end
    local roster = MountData:Ensure()
    if not roster then
        Say("couldn't read the mount journal yet - try again in a moment.")
        return
    end

    local q = query:lower()
    local seen = {}
    for i = 1, #roster do
        local entry = roster[i]
        local zone = MountData:GetSourceZone(entry)
        if zone and zone:lower():find(q, 1, true) then
            local bytes = {}
            for c in zone:gmatch(".") do
                local b = c:byte()
                if b < 32 or b > 126 then
                    bytes[#bytes + 1] = string.format("\\%d", b)
                else
                    bytes[#bytes + 1] = c
                end
            end
            local escaped = table.concat(bytes)
            if not seen[escaped] then
                seen[escaped] = true
                Say(WHITE .. entry.name .. RESET .. GREY .. " -> " .. RESET .. escaped)
            end
        end
    end
end

-- Diagnostic: dumps every raw tooltip line the client generates for a mount's
-- summon spell, with its line type and colour. This is how we find out what
-- class/race/profession restrictions actually look like in real data, rather
-- than guessing at the matching rules.
local function PrintLines(text)
    if not text or text == "" then
        Say("usage: /xro lines <part of a mount name>")
        return
    end

    local hits = MountData:Search(text, 1)
    if #hits == 0 then
        Say("nothing matching " .. WHITE .. text .. RESET .. ".")
        return
    end

    local entry = hits[1]
    Say("raw tooltip lines for " .. WHITE .. entry.name .. RESET ..
        GREY .. " (spell " .. tostring(entry.spellID) .. ")" .. RESET .. ":")

    local lines = MountData:GetTooltipLines(entry.mountID)
    if #lines == 0 then
        Line(GREY .. "(no tooltip lines returned)" .. RESET)
        return
    end

    for i = 1, #lines do
        local l = lines[i]
        local colorBit = ""
        if l.color and l.color.r then
            colorBit = string.format("  rgb %.2f/%.2f/%.2f", l.color.r, l.color.g, l.color.b)
        end
        Line(GREY .. i .. ". [type " .. tostring(l.type) .. colorBit .. "]" .. RESET .. " " .. l.text)
    end
end

-- What the addon believes is on this month's Trading Post, straight from
-- C_PerksProgram. Lets the rotation filter be checked against what's actually
-- showing in game.
local function PrintTradingPost()
    if not MountData:RefreshTradingPost() and not MountData.tradingPostMounts then
        Say("Trading Post data hasn't loaded yet - open the Trading Post once, then try again.")
        return
    end

    MountData:Ensure()
    local offered = MountData.tradingPostMounts or {}
    local count = 0
    for _ in pairs(offered) do count = count + 1 end

    if count == 0 then
        Say("no mounts on this month's Trading Post.")
        return
    end

    Say(count .. " mount(s) on this month's Trading Post:")
    for mountID in pairs(offered) do
        local entry = MountData.byID and MountData.byID[mountID]
        local name = entry and entry.name or ("mountID " .. mountID)
        local mark = (entry and entry.isCollected) and (GREEN .. "[have]" .. RESET)
            or (GREY .. "[need]" .. RESET)
        Line(mark .. " " .. WHITE .. name .. RESET)
    end
end

-- Shows every step of the "can this character get it" decision for one mount,
-- so a wrong verdict can be diagnosed in one command instead of guessing.
local function PrintWhy(text)
    if not text or text == "" then
        Say("usage: /xro why <part of a mount name>")
        return
    end

    local hits = MountData:Search(text, 1)
    if #hits == 0 then
        Say("nothing matching " .. WHITE .. text .. RESET .. ".")
        return
    end

    local entry = hits[1]
    Say("acquisition check for " .. WHITE .. entry.name .. RESET .. ":")

    Line(GREY .. "collected:" .. RESET .. " " .. tostring(entry.isCollected))
    Line(GREY .. "faction lock:" .. RESET .. " " ..
        (MountData.FactionLabel(entry) or "none") ..
        GREY .. "   you are:" .. RESET .. " " .. tostring(MountData:PlayerFaction()))

    local required = MountData:GetSourceProfession(entry)
    Line(GREY .. "source profession:" .. RESET .. " " .. (required or "none") ..
        GREY .. "  (" .. (required and #required or 0) .. " chars)" .. RESET)

    local have = MountData:PlayerProfessions()
    local names = {}
    for name in pairs(have) do names[#names + 1] = name end
    Line(GREY .. "your professions:" .. RESET .. " " ..
        (#names > 0 and table.concat(names, ", ") or "none detected"))

    Line(GREY .. "recognised as a real profession:" .. RESET .. " " ..
        tostring(MountData:IsRealProfession(required)))
    Line(GREY .. "missing profession (note only, never blocks):" .. RESET .. " " ..
        (MountData:MissingProfession(entry) or "none"))

    local reqs = MountData:GetRequirements(entry.mountID)
    Line(GREY .. "tooltip requirement lines:" .. RESET .. " " .. #reqs)
    for i = 1, #reqs do
        Line("   " .. (reqs[i].failing and RED .. "[failing]" .. RESET or GREY .. "[ok]" .. RESET) ..
            " " .. reqs[i].text)
    end

    Line(GREY .. "unobtainable:" .. RESET .. " " .. tostring(MountData:IsUnobtainable(entry)))
    Line(GREY .. "FINAL:" .. RESET .. " " .. (MountData:WhyBlocked(entry.mountID) or "can get it"))
end

-- Lists mounts that have a prerequisite chain written for them, so they can be
-- found without digging through the data file.
local function PrintSteps(filterArg)
    MountData:Ensure()
    local all = addonTable.MountSteps
    if not all then
        Say("no step data loaded.")
        return
    end

    local needle = filterArg ~= "" and filterArg:lower() or nil
    local names = {}
    for name in pairs(all) do
        if not needle or name:lower():find(needle, 1, true) then
            names[#names + 1] = name
        end
    end
    table.sort(names)

    if #names == 0 then
        Say("no mounts with steps match that.")
        return
    end

    -- Count unmatched names across EVERY entry, not just the page shown.
    -- A name that doesn't match the journal means those steps can never appear,
    -- and listing only 20 rows would hide that.
    local byName = {}
    for _, e in ipairs(MountData.roster or {}) do byName[e.name] = e end

    local missing = {}
    for i = 1, #names do
        if not byName[names[i]] then missing[#missing + 1] = names[i] end
    end

    Say(#names .. " mount(s) have steps" ..
        (needle and (" matching " .. WHITE .. filterArg .. RESET) or "") .. ":")

    if #missing > 0 then
        -- Could be a wrong name OR a mount that simply isn't released yet, and
        -- the addon can't tell those apart - so don't call it an error.
        Line(RED .. #missing .. " name(s) aren't in your journal" .. RESET ..
            GREY .. " - wrong name, or not released yet:" .. RESET)
        for i = 1, #missing do
            Line("   " .. RED .. missing[i] .. RESET)
        end
    else
        Line(GREEN .. "all names match the journal." .. RESET)
    end

    for i = 1, #names do
        local entry = byName[names[i]]

        local _, done, totalSteps = MountData:GetStepLines(entry or { name = names[i] })
        local progress = ""
        if entry and totalSteps and totalSteps > 0 then
            progress = GREY .. "  (" .. done .. "/" .. totalSteps .. " done)" .. RESET
        elseif not entry then
            -- Name doesn't match anything in the journal, so its steps would
            -- never show. Worth surfacing rather than hiding.
            progress = RED .. "  (not in journal)" .. RESET
        end

        Line(WHITE .. names[i] .. RESET .. progress)
    end

end

-- The research backlog: mounts you still need that have no prerequisite chain
-- written for them. Grouped by source, because that's what decides whether a
-- mount even WANTS steps - a plain boss drop usually doesn't.
local function PrintMissingSteps(filterArg)
    local roster = MountData:Ensure()
    if not roster then
        Say("couldn't read the mount journal yet.")
        return
    end

    local all = addonTable.MountSteps or {}
    local needle = filterArg ~= "" and filterArg:lower() or nil

    -- Sources where a missing chain is worth investigating. A plain Drop is
    -- usually just "kill it and hope", which needs nothing written down.
    local WANTS_STEPS = {
        ["Quest"] = true, ["Achievement"] = true, ["Vendor"] = true,
        ["Profession"] = true, ["World Event"] = true, ["Instance"] = true,
    }

    local buckets, order, total, worth = {}, {}, 0, 0
    for i = 1, #roster do
        local e = roster[i]
        if not e.isCollected
            and not all[e.name]
            and not MountData:IsPlaceholder(e)
            and not MountData:IsUnobtainable(e)
            and (not needle or e.name:lower():find(needle, 1, true)) then

            local label = e.sourceLabel or "Unknown"
            if not buckets[label] then
                buckets[label] = {}
                order[#order + 1] = label
            end
            buckets[label][#buckets[label] + 1] = e.name
            total = total + 1
            if WANTS_STEPS[label] then worth = worth + 1 end
        end
    end

    if total == 0 then
        Say("nothing missing steps" .. (needle and " that matches that" or "") .. ".")
        return
    end

    table.sort(order)
    Say(total .. " mount(s) you still need have no steps written" ..
        GREY .. "  (" .. worth .. " in categories that usually want them)" .. RESET)

    for i = 1, #order do
        local label = order[i]
        local list = buckets[label]
        table.sort(list)

        local mark = WANTS_STEPS[label] and (ACCENT .. label .. RESET)
            or (GREY .. label .. RESET)
        Line(mark .. GREY .. "  (" .. #list .. ")" .. RESET)
        for j = 1, #list do
            Line("   " .. WHITE .. list[j] .. RESET)
        end
    end
end

-- Re-shows the last "new since your last login" list. A login message is easy
-- to scroll past, and after a patch this is the list that matters.
local function PrintNewMounts()
    local names = type(XalsReinsDB) == "table" and XalsReinsDB.lastNewMounts or nil
    if not names or #names == 0 then
        Say("no new mounts recorded since the addon started tracking.")
        return
    end

    MountData:Ensure()
    Say(#names .. " mount(s) were new at the last patch/login:")
    for i = 1, #names do
        local entry
        for _, e in ipairs(MountData.roster or {}) do
            if e.name == names[i] then entry = e break end
        end
        local note = ""
        if entry and not MountData:GetSteps(entry) then
            note = GREY .. "  (no steps written yet)" .. RESET
        end
        Line(WHITE .. names[i] .. RESET .. note)
    end
end

local function PrintHelp()
    Say("commands:")
    Line(WHITE .. "/xro" .. RESET .. " - open the mount tracker")
    Line(WHITE .. "/xro collection" .. RESET .. " - open your collected mounts")
    Line(WHITE .. "/xro summary" .. RESET .. " - collection summary in chat")
    Line(WHITE .. "/xro sources" .. RESET .. " - mounts grouped by how they're obtained")
    Line(WHITE .. "/xro find <name>" .. RESET .. " - look up a mount and how to get it")
    Line(WHITE .. "/xro dump [n]" .. RESET .. " - full detail for the first n mounts (default 5)")
    Line(WHITE .. "/xro post" .. RESET .. " - what's on this month's Trading Post")
    Line(WHITE .. "/xro steps" .. RESET .. " - mounts that have a prerequisite chain")
    Line(WHITE .. "/xro missing" .. RESET .. " - mounts you need that have no chain written yet")
    Line(WHITE .. "/xro new" .. RESET .. " - mounts that appeared at the last patch")
    Line(WHITE .. "/xro why <name>" .. RESET .. " - why a mount is or isn't on your list")
    Line(WHITE .. "/xro lines <name>" .. RESET .. " - raw tooltip lines for a mount (diagnostic)")
    Line(WHITE .. "/xro options" .. RESET .. " - open the settings window")
end

function ChatCommands:Handle(input)
    input = (input or ""):gsub("^%s+", ""):gsub("%s+$", "")
    local cmd, rest = input:match("^(%S*)%s*(.*)$")
    cmd = (cmd or ""):lower()

    if cmd == "" then
        addonTable.MainTracker:Toggle()
    elseif cmd == "summary" or cmd == "stats" then
        PrintSummary()
    elseif cmd == "collection" or cmd == "collected" then
        addonTable.CollectionWindow:Toggle()
    elseif cmd == "sources" then
        PrintSources()
    elseif cmd == "find" or cmd == "search" then
        PrintFind(rest)
    elseif cmd == "dump" then
        PrintDump(rest)
    elseif cmd == "post" or cmd == "tradingpost" then
        PrintTradingPost()
    elseif cmd == "new" then
        PrintNewMounts()
    elseif cmd == "missing" then
        PrintMissingSteps(rest)
    elseif cmd == "steps" then
        PrintSteps(rest)
    elseif cmd == "why" then
        PrintWhy(rest)
    elseif cmd == "lines" then
        PrintLines(rest)
    elseif cmd == "zonedump" then
        PrintZoneDump(rest)
    elseif cmd == "options" or cmd == "config" or cmd == "settings" then
        addonTable.SettingsPanel:Open()
    else
        PrintHelp()
    end
end

SLASH_XALSREINS1 = "/xro"
SlashCmdList["XALSREINS"] = function(input)
    ChatCommands:Handle(input)
end
