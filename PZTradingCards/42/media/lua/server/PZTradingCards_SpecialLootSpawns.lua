-- PZTradingCards_SpecialLootSpawns
SpecialLootSpawns = SpecialLootSpawns or {}

local CARD_COUNT = 37

SpecialLootSpawns.OnCreatePZTradingCard = function(item)
    if not item then return end

    local cardID = ZombRand(1, CARD_COUNT+1)
    item:getModData().cardID = cardID

    local shortType = item:getType()

    local translationKey = "Base." .. shortType .. tostring(cardID)
    item:setName(getItemNameFromFullType(translationKey))

    local modelPrefix = nil

    if shortType == "PZTradingCardBasic" then
        modelPrefix = "TradingCard_Basic"
    elseif shortType == "PZTradingCardBloodshed" then
        modelPrefix = "TradingCard_Bloodshed"
    elseif shortType == "PZTradingCardBorderFoil" then
        modelPrefix = "TradingCard_BorderFoil"
    elseif shortType == "PZTradingCardFullFoil" then
        modelPrefix = "TradingCard_FullFoil"
    elseif shortType == "PZTradingCardPortraitFoil" then
        modelPrefix = "TradingCard_PortraitFoil"
    end

    if modelPrefix then
        item:setWorldStaticModel(modelPrefix .. tostring(cardID))
    end
end