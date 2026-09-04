-- .luacheckrc
-- Xal's Reins
--
-- Scoped to the actual WoW API calls and globals this addon uses (not a
-- copy-pasted full addon's config) - add to `globals`/`read_globals` as new
-- API calls get added, rather than pulling in a giant generic list.
std = "lua51"

-- This addon's own globals: the SavedVariables tables and the slash command
-- entries, all of which are genuinely written to.
globals = {
    "XalsReinsDB",
    "XalsReinsCharDB",
    "StaticPopupDialogs", -- a real mutable table addons add popup entries to
    "SLASH_XALSREINS1",
    "SlashCmdList",
}

-- Read-only: real WoW client API/globals.
read_globals = {
    "CreateFrame",
    "UIParent",
    "PixelUtil",
    "Settings",
    "InterfaceOptions_AddCategory",
    "InterfaceOptionsFrame_OpenToCategory",
    "StaticPopup_Show",
    "C_MountJournal",
    "C_QuestLog",
    "C_Reputation",
    "C_CurrencyInfo",
    "C_Calendar",
    "C_DateAndTime",
    "GetTime",
    "time",
    "C_Item",
    "GetItemCount",
    "GetAchievementInfo",
    "LibStub",
    "C_TooltipInfo",
    "C_PerksProgram",
    "TooltipUtil",
    "Enum",
    "UnitFactionGroup",
    "GetProfessions",
    "GetProfessionInfo",
    "GetRealZoneText",
    "GetZoneText",
    "GetSubZoneText",
    "GetInstanceInfo",
    "EJ_GetNumTiers",
    "EJ_SelectTier",
    "EJ_GetCurrentTier",
    "EJ_GetInstanceByIndex",
    "ZONE",
    "LOCATION_COLON",
    "FACTION",
    "PROFESSION",
    "COST",
    "ACHIEVEMENT",
    "C_AddOns",
    "C_Timer",
    "GameFontHighlightSmall",
    "InputBoxTemplate",
    "UISpecialFrames",
    "BackdropTemplateMixin",
    "hooksecurefunc",
    "wipe",
    "tinsert",
}

-- Textures/backdrop tables and long chained SetPoint calls read as "unused
-- variable"/line-length noise in generated UI code like this - not real bugs.
-- Matches Compendium's config. `addonName` specifically comes from the
-- standard `local addonName, addonTable = ...` header every file carries and
-- is intentionally unused in most of them.
max_line_length = false
unused_args = false
ignore = { "211/addonName" }
