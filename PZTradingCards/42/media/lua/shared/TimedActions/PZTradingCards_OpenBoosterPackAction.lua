-- PZTradingCards_OpenBoosterPackAction
require "TimedActions/ISBaseTimedAction"

PZTradingCards_OpenBoosterPackAction = ISBaseTimedAction:derive("PZTradingCards_OpenBoosterPackAction")

function PZTradingCards_OpenBoosterPackAction:isValid()
    return self.item and self.character:getInventory():contains(self.item)
end

function PZTradingCards_OpenBoosterPackAction:perform()
    ISBaseTimedAction.perform(self)
end

function PZTradingCards_OpenBoosterPackAction:complete()
    local inv = self.character:getInventory()

    inv:Remove(self.item)
    sendRemoveItemFromContainer(inv, self.item)

    for i=1, 7 do
        local basicCard = instanceItem("Base.PZTradingCardBasic")
        inv:AddItem(basicCard)
        sendAddItemToContainer(inv, basicCard)
    end

    local foilCard = instanceItem("Base.PZTradingCardBorderFoil")
    inv:AddItem(foilCard)
    sendAddItemToContainer(inv, foilCard)

    local roll = ZombRand(100)+1
    local finalFoilCard

    if roll <= 65 then
        finalFoilCard = instanceItem("Base.PZTradingCardBorderFoil")
    elseif roll <= 90 then
        finalFoilCard = instanceItem("Base.PZTradingCardPortraitFoil")
    else
        finalFoilCard = instanceItem("Base.PZTradingCardFullFoil")
    end
    
    inv:AddItem(finalFoilCard)
    sendAddItemToContainer(inv, finalFoilCard)
end

function PZTradingCards_OpenBoosterPackAction:getDuration()
    if self.character:isTimedActionInstant() then
        return 1
    end
    return 60
end

function PZTradingCards_OpenBoosterPackAction:new(character, item)
    local o = ISBaseTimedAction.new(self, character)
    o.character = character
    o.item = item
    o.maxTime = o:getDuration()
    return o
end