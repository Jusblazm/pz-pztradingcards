-- PZTradingCards_SpecialLootSpawns
SpecialLootSpawns = SpecialLootSpawns or {}

SpecialLootSpawns.OnCreatePZTradingCard = function(item)
    if not item then return end
    local PZTradingCards_Utils = require("PZTradingCards_Utils")

    local cardID = PZTradingCards_Utils.getWeightedCardID()
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

SpecialLootSpawns.OnCreateCatalog = function(item)
    if not item then return end
    item:getModData().literatureTitle = item:getFullType()
end