Client = {}

---@param sprite number;
---@param color number;
---@param position vector3;
---@param name string;
---@param scale? number;
---@param short? boolean;
function Client.createBlip(sprite, color, position, name, scale, short)
    if short == nil then short = true end
    local createdBlip = AddBlipForCoord(position.x, position.y, position.z)

    SetBlipSprite(createdBlip, sprite)
    SetBlipScale(createdBlip, scale or 1.0)
    SetBlipColour(createdBlip, color)
    SetBlipAsShortRange(createdBlip, short)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(name)
    EndTextCommandSetBlipName(createdBlip)

    return createdBlip
end

---@param model string|number
---@param position vector4
---@param animation PedAnimation?;
function Client.spawnPed(model, position, animation)
    model = lib.requestModel(model)
    if not model then return end

    local entity = CreatePed(0, model, position.x, position.y, position.z, position.w, false, true)

    if animation and animation.dict then
        lib.requestAnimDict(animation.dict)
        TaskPlayAnim(entity, animation.dict, animation.name, 8.0, 0.0, -1, animation.flag, 0, false, false, false)
    elseif animation and animation.name then
        TaskStartScenarioInPlace(entity, animation.name, 0, true)
    end

    SetModelAsNoLongerNeeded(model)
    FreezeEntityPosition(entity, true)
    SetEntityInvincible(entity, true)
    SetBlockingOfNonTemporaryEvents(entity, true)

    return entity
end

require 'src.modules.shops.client'
