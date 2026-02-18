-- PZTradingCards_ContextMenu
local function onFillInventoryObjectContextMenu(playerIndex, context, items)
    local player = getSpecificPlayer(playerIndex)

    for _, v in ipairs(items) do
        local item = v.items and v.items[1] or v
        if not item then return end

        if item:getFullType() == "Base.PZTradingCardBoosterPack" then
            context:addOption(getText("ContextMenu_PZTradingCards_Inventory_OpenBoosterPack"), item, function()
                ISTimedActionQueue.add(PZTradingCards_OpenBoosterPackAction:new(player, item))
            end)
        end
    end
end

Events.OnFillInventoryObjectContextMenu.Add(onFillInventoryObjectContextMenu)