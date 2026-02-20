-- PZTradingCards_CatalogsLoader
local gameVersion = getCore():getVersionNumber()
local MailOrderCatalogs = nil

if gameVersion and tonumber(gameVersion) >= 42 then
    MailOrderCatalogs = "\\JusMailOrderCatalogs"
else
    MailOrderCatalogs = "JusMailOrderCatalogs"
end

if getActivatedMods():contains(MailOrderCatalogs) then
    local registrar = require("MailOrderCatalogs_CatalogRegistrar")

    local function registerCatalogs()
        local site = require("catalogs/spiffotradingcards_com")
        local catalog = "Base.PZTradingCardsCatalog"
        registrar.registerWebsite(site, catalog)
        local site = require("catalogs/scalpersrus_net")
        local catalog = "Base.ScalpersRUsCatalog"
        registrar.registerWebsite(site, catalog)
    end
    Events.OnInitGlobalModData.Add(registerCatalogs)
    Events.OnGameStart.Add(registerCatalogs)
end