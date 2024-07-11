Config = {}

---@type boolean If true, the price of the item will change a bit after every restart.
Config.priceVariation = true

---@type boolean If true, the script will use ox_target interactions for peds and not the default 'E' interaction.
Config.oxTarget = true
---@type number If not using ox_target, this is the distance at which the player can interact with the ped.
Config.interactDistance = 3.0

---@param message string
---@param type 'success'|'error'|'info'
---@param playerId number?
Config.showNotification = function(message, type, playerId)
    local data = { description = message, type = type }

    if playerId then return lib.notify(playerId, data) end
    lib.notify(data)
end
