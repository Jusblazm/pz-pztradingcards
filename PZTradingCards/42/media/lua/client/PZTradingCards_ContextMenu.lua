-- PZTradingCards_ContextMenu
local PZTradingCards_Utils = require("PZTradingCards_Utils")
local PZTradingCards_CardViewer = require("ISUI/PZTradingCards_CardViewer")

local function onFillInventoryObjectContextMenu(playerIndex, context, items)
    local player = getSpecificPlayer(playerIndex)

    for _, v in ipairs(items) do
        local item = v.items and v.items[1] or v
        if not item then return end

        if PZTradingCards_Utils.isValidBoosterPack(item:getFullType()) then
            context:addOption(getText("ContextMenu_PZTradingCards_Inventory_OpenBoosterPack"), item, function()
                ISTimedActionQueue.add(PZTradingCards_OpenBoosterPackAction:new(player, item))
            end)
        end

        if PZTradingCards_Utils.isValidTradingCard(item:getFullType()) then
            context:addOption(getText("ContextMenu_PZTradingCards_Inventory_ViewCardArtwork"), item, function()
                PZTradingCards_CardViewer.displayTradingCardArtwork(item)
            end)
        end
    end
end

Events.OnFillInventoryObjectContextMenu.Add(onFillInventoryObjectContextMenu)