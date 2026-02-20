-- PZTradingCards_Utils
local PZTradingCards_Utils = {}

local CARD_COUNT = 37
local CARD_WEIGHTS = {
    [7] = 34, [20] = 45, [21] = 45,
    [27] = 25, [28] = 38, [29] = 27,
    [32] = 18, [34] = 5, [35] = 1,
    [36] = 3, [37] = 21
}

PZTradingCards_Utils.validBoosterPacks = {
    ["Base.PZTradingCardBoosterPack"] = true,
    ["Base.PZTradingCardBloodshedBoosterPack"] = true,
}

PZTradingCards_Utils.validTradingCards = {
    ["Base.PZTradingCardBasic"] = true,
    ["Base.PZTradingCardBloodshed"] = true,
    ["Base.PZTradingCardBorderFoil"] = true,
    ["Base.PZTradingCardFullFoil"] = true,
    ["Base.PZTradingCardPortraitFoil"] = true,
}

function PZTradingCards_Utils.isValidBoosterPack(itemFullType)
    return PZTradingCards_Utils.validBoosterPacks[itemFullType]
end

function PZTradingCards_Utils.isValidTradingCard(itemFullType)
    return PZTradingCards_Utils.validTradingCards[itemFullType]
end

function PZTradingCards_Utils.getWeightedCardID()
    local totalWeight = 0

    for i=1, CARD_COUNT do
        totalWeight = totalWeight + (CARD_WEIGHTS[i] or 50)
    end

    local roll = ZombRand(totalWeight)
    local cumulative = 0

    for i=1, CARD_COUNT do
        cumulative = cumulative + (CARD_WEIGHTS[i] or 50)
        if roll < cumulative then
            return i
        end
    end
    return 1
end

return PZTradingCards_Utils