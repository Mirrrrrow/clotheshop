local TEXTUI_TEXT <const> = locale('textui.open_shop')
---@param point CPoint
local function onEnterShop(point)
    if point.entity then return end

    if not point.ped then return end

    local ped = point.ped
    local coords = point.coords
    point.entity = Client.spawnPed(ped.model, vec4(coords.x, coords.y, coords.z, ped.heading), ped.animation)

    if Config.oxTarget then
        exports.ox_target:addLocalEntity(point.entity, {
            label = 'Wonderful resource'
        })
    end
end

---@param point CPoint
local function onExitShop(point)
    local entity = point.entity
    if not entity then return end

    if Config.oxTarget then
        exports.ox_target:removeLocalEntity(entity)
    end

    if DoesEntityExist(entity) then
        DeleteEntity(entity)
    end

    point.entity = nil
end

---@param point CPoint
local function nearbyShop(point)
    if point.marker then point.marker:draw() end

    if point.isClosest and point.currentDistance < Config.interactDistance then
        if not lib.isTextUIOpen() then
            lib.showTextUI(TEXTUI_TEXT)
        end
    else
        local isOpen, currentText = lib.isTextUIOpen()
        if isOpen and currentText == TEXTUI_TEXT then
            lib.hideTextUI()
        end
    end
end

for index, shop in pairs(lib.load('data.shops') --[[@as table<number, Shop>]]) do
    local blip = shop.blip
    if blip then
        Client.createBlip(blip.sprite, blip.color, shop.coords, shop.label, blip.scale, blip.short)
    end

    local ped, marker = shop.ped, shop.marker
    lib.points.new({
        shopId = index,
        coords = shop.coords,
        distance = ped and 60 or 25,
        marker = marker and lib.marker.new({
            coords = shop.coords,
            type = marker.type,
            width = marker.width,
            height = marker.height,
            color = marker.color,
            rotation = marker.rotation,
            direction = marker.direction
        }),
        ped = ped,
        onEnter = onEnterShop,
        onExit = onExitShop,
        nearby = Config.oxTarget and nil or nearbyShop
    })
end
