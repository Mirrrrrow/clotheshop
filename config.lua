Config = {}

---@type boolean If true, the price of the item will change a bit after every restart
Config.priceVariation = true

---@param message string
---@param type 'success'|'error'|'info'
---@param playerId number?
Config.showNotification = function(message, type, playerId)
    local data = { description = message, type = type }

    if playerId then return lib.notify(playerId, data) end
    lib.notify(data)
end
