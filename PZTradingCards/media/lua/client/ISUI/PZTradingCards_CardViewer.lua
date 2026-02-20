-- PZTradingCards_CardViewer
PZTradingCards_CardViewer = {}

local ISPanel = ISPanel

PZTradingCards_CardViewer = ISPanel:derive("PZTradingCards_CardViewer")

local CARD_W = 506
local CARD_H = 761
local SCALE = 0.5

function PZTradingCards_CardViewer:new(x, y, texturePath)
    local width = CARD_W * SCALE
    local height = CARD_H * SCALE

    local o = ISPanel:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self

    o.texturePath = texturePath
    o.texture = getTexture(texturePath)

    o.background = false
    o.borderColor = { r = 0, g = 0, b = 0, a = 0 }

    return o
end

function PZTradingCards_CardViewer:initialise()
    ISPanel.initialise(self)
    self:setWantKeyEvents(true)
end

function PZTradingCards_CardViewer:prerender()
    --
end

function PZTradingCards_CardViewer:render()
    if self.texture then
        self:drawTextureScaled(self.texture, 0, 0, self.width, self.height, 1)
    end
end

function PZTradingCards_CardViewer:onMouseDown(x, y)
    self:removeFromUIManager()
    return
end

function PZTradingCards_CardViewer:onKeyRelease(key)
    if key == Keyboard.KEY_ESCAPE then
        self:removeFromUIManager()
        return
    end
end

function PZTradingCards_CardViewer.displayTradingCardArtwork(item)
    if not item then return end

    local cardID = item:getModData().cardID
    if not cardID then return end

    local shortType = item:getType()
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

    if not modelPrefix then return end

    local texturePath = "media/ui/PZTradingCards/" .. modelPrefix .. tostring(cardID) .. ".png"
    local w = 506 * 0.5
    local h = 761 * 0.5
    local x = (getCore():getScreenWidth() - w) / 2
    local y = (getCore():getScreenHeight() - h) / 2

    local panel = PZTradingCards_CardViewer:new(x, y, texturePath)
    panel:initialise()
    panel:addToUIManager()
    panel:setVisible(true)

    PZTradingCards_CardViewer.instance = panel
end

return PZTradingCards_CardViewer