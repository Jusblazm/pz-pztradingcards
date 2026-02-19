-- PZTradingCards_Distributions
require "Items/ProceduralDistributions"
require "Items/SuburbsDistributions"

local boosterPacks = {
    "Base.PZTradingCardBoosterPack",
    "Base.PZTradingCardBloodshedBoosterPack"
}

----------------------------------------
-- Procedural Distributions
----------------------------------------

local baseWeight = 2.5

local locationMultipliers = {
    ["ArtStoreLiterature"] = 1,
    ["ArtStoreOther"] = 0.1,
    ["CrateSpiffoMerch"] = 1.3,
    ["CrateBooks"] = 0.9,
    ["PostOfficeBooks"] = 0.5,
    ["PostOfficeMagazines"] = 0.5,
    ["ComicStoreShelfGames"] = 2,
    ["ComicStoreCounter"] = 2,
    ["CarnivalPrizes"] = 1,
    ["CrateRandomJunk"] = 0.5,
    ["JunkHoard"] = 0.3,
    ["DerelictHouseJunk"] = 0.4,
    ["DerelictHouseSquatter"] = 0.1,
    ["CrateToys"] = 1,
    ["GasStoreSpecial"] = 2,
    ["Gifts"] = 1.2,
    ["GiftStoreToys"] = 3,
    ["GigamartLiterature"] = 4,
    ["GigamartSchool"] = 2,
    ["GigamartToys"] = 6,
    ["Hobbies"] = 5,
    ["LiquorStoreMagazineRack"] = 2,
    ["MagazineRackMixed"] = 5,
    ["SpiffosDesk"] = 3

}

for location, multiplier in pairs(locationMultipliers) do
    local dist = ProceduralDistributions.list[location]
    if dist and dist.items then
        local items = dist.items
        for _, pack in ipairs(boosterPacks) do
            table.insert(items, pack)
            table.insert(items, baseWeight * multiplier)
        end
    end
end

local singleCards = {
    "Base.PZTradingCardBasic",
    "Base.PZTradingCardBloodshed",
    "Base.PZTradingCardBorderFoil"
}

local locationMultipliers = {
    ["CrateSpiffoMerch"] = 1.3,
    ["CrateToys"] = 2.1,
    ["CrateRandomJunk"] = 1.3,
    ["JunkHoard"] = 2.2,
    ["ClassroomDesk"] = 1,
    ["ComicStoreCounter"] = 2.2,
    ["ClassroomSecondaryDesk"] = 1.5,
    ["CarnivalPrizes"] = 3,
    ["BedroomSidetable"] = 0.3,
    ["BedroomSidetableChild"] = 1,
    ["BedroomDresserChild"] = 0.6,
    ["SchoolLockers"] = 2.7,
    ["LaundryLoad1"] = 0.05,
    ["LaundryLoad2"] = 0.05,
    ["LaundryLoad3"] = 0.05,
    ["LaundryLoad4"] = 0.05,
    ["LaundryLoad5"] = 0.05,
    ["LaundryLoad6"] = 0.05,
    ["LaundryLoad7"] = 0.05,
    ["LaundryLoad8"] = 0.05
}

for location, multiplier in pairs(locationMultipliers) do
    local dist = ProceduralDistributions.list[location]
    if dist and dist.items then
        local items = dist.items
        for _, card in ipairs(singleCards) do
            table.insert(items, card)
            table.insert(items, baseWeight * multiplier)
        end
    end
end