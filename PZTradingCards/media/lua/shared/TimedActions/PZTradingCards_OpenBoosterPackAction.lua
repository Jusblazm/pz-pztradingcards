-- PZTradingCards_OpenBoosterPackAction
require "TimedActions/ISBaseTimedAction"

PZTradingCards_OpenBoosterPackAction = ISBaseTimedAction:derive("PZTradingCards_OpenBoosterPackAction")

function PZTradingCards_OpenBoosterPackAction:isValid()
    return self.item and self.character:getInventory():contains(self.item)
end

function PZTradingCards_OpenBoosterPackAction:start()
    self:setActionAnim("Loot")
    self.character:SetVariable("LootPosition", "Mid")
end

function PZTradingCards_OpenBoosterPackAction:stop()
    ISBaseTimedAction.stop(self)
end

function PZTradingCards_OpenBoosterPackAction:perform()
    ISBaseTimedAction.perform(self)
    local inv = self.character:getInventory()

    inv:Remove(self.item)

    if self.item:getFullType() == "Base.PZTradingCardBoosterPack" then
        for i=1, 7 do
            local basicCard = instanceItem("Base.PZTradingCardBasic")
            inv:AddItem(basicCard)
        end

        local foilCard = instanceItem("Base.PZTradingCardBorderFoil")
        inv:AddItem(foilCard)

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
    else
        for i=1, 9 do
            local basicCard = instanceItem("Base.PZTradingCardBloodshed")
            inv:AddItem(basicCard)
        end
    end
end

function PZTradingCards_OpenBoosterPackAction:new(character, item)
    local o = ISBaseTimedAction.new(self, character)
    o.character = character
    o.item = item
    o.maxTime = 60
    return o
end