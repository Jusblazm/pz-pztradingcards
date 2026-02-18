-- MailOrderCatalogs_Distributions
require "Items/ProceduralDistributions"
require "Items/SuburbsDistributions"

----------------------------------------
-- Holiday Item Distributions
----------------------------------------

local candyTable = {
    "CandyStoreSnacks",
    "GasStorageCombo",
    "GigamartCandy",
    "GroceryStorageCrate1",
    "SafehouseFood",
    "StoreShelfCombo",
    "StoreShelfSnacks",
    "UniversitySideTable"
}

local hanukkahItem = "Base.PZTradingCardBloodshed"
local hanukkahWeight = 500

for _, location in ipairs(candyTable) do
    local dist = ProceduralDistributions.list[location]
    if dist and dist.items then
        local items = dist.items
        table.insert(items, hanukkahItem)
        table.insert(items, hanukkahWeight)
    end
end