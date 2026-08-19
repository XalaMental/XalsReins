-- MinimapButton.lua
-- Xal's Reins
--
-- The minimap launcher icon, via LibDataBroker + LibDBIcon - the same
-- combination almost every WoW addon with a minimap button uses.
--
-- Left-click opens the main tracker, right-click opens options. The tracker
-- carries its own link through to the collection window, so the minimap
-- doesn't need to duplicate that.
local addonName, addonTable = ...
local MinimapButton = addonTable.MinimapButton

-- Full custom-shaped icon rather than Blizzard's circular border/mask, using
-- LibDBIcon's SetButtonSize/RemoveButtonBorder/RemoveButtonBackground/
-- SetButtonIcon. Explicit .png extension - an extensionless path leaves it
-- ambiguous which file to resolve to if a stale .tga ever sits alongside a
-- newer .png with the same base name, and WoW will happily keep loading the
-- old one.
local MINIMAP_ICON = "Interface\\AddOns\\XalsReins\\Textures\\MinimapIcon_v1.png"
local MINIMAP_ICON_SIZE = 34

function MinimapButton:Register()
    local ldb = LibStub("LibDataBroker-1.1"):NewDataObject("XalsReins", {
        type = "launcher",
        text = "Xal's Reins",
        icon = MINIMAP_ICON,
        OnClick = function(_, button)
            if button == "RightButton" then
                if addonTable.SettingsPanel and addonTable.SettingsPanel.Open then
                    addonTable.SettingsPanel:Open()
                end
            else
                if addonTable.MainTracker and addonTable.MainTracker.Toggle then
                    addonTable.MainTracker:Toggle()
                end
            end
        end,
        OnTooltipShow = function(tooltip)
            tooltip:AddLine("Xal's Reins")

            local MountData = addonTable.MountData
            if MountData then
                MountData:Ensure()
                local s = MountData.stats
                if s and s.total > 0 then
                    tooltip:AddLine("|cffffffff" .. s.collected .. "|r of |cffffffff" ..
                        s.total .. "|r mounts collected")
                end
            end

            tooltip:AddLine("|cff999999Left-click|r to open the mount tracker")
            tooltip:AddLine("|cff999999Right-click|r for options")
        end,
    })

    XalsReinsDB.minimap = XalsReinsDB.minimap or { hide = false }
    local icon = LibStub("LibDBIcon-1.0")
    icon:Register("XalsReins", ldb, XalsReinsDB.minimap)

    if icon.SetButtonSize then
        icon:SetButtonSize("XalsReins", MINIMAP_ICON_SIZE)
        icon:RemoveButtonBorder("XalsReins")
        icon:RemoveButtonBackground("XalsReins")
        icon:SetButtonIcon("XalsReins", MINIMAP_ICON, MINIMAP_ICON_SIZE, "CENTER", 0, 0)
    end
end

-- Backing the Options checkbox - LibDBIcon's own Show/Hide API, not a manual
-- texture toggle, so it stays consistent with how the library expects its
-- icon's visibility to be controlled.
function MinimapButton:SetShown(shown)
    XalsReinsDB.minimap = XalsReinsDB.minimap or { hide = false }
    XalsReinsDB.minimap.hide = not shown

    local icon = LibStub("LibDBIcon-1.0", true)
    if not icon then return end

    if shown then
        icon:Show("XalsReins")
    else
        icon:Hide("XalsReins")
    end
end
