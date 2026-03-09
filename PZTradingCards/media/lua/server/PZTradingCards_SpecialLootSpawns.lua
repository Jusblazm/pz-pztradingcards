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
end

SpecialLootSpawns.OnCreateCatalog = function(item)
    if not item then return end
    item:getModData().literatureTitle = item:getFullType()
end