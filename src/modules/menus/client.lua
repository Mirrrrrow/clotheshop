local menus = {}

---@param menu table
local function showMenu(menu)
    lib.registerMenu(menu, function(selected, scrollIndex, args)
        if menu.options[selected].onSelect then
            menu.options[selected].onSelect(selected, scrollIndex, args)
        end
    end)
    lib.showMenu(menu.id)
end

---@param shop Shop
menus.showClothingShop = function(shop)
    local main = {
        id = 'clothing_shop',
        title = locale('menus.shop.title', shop.label),
        position = 'top-left',
        options = {},
    }

    -- loop trough products, get their price and add them to the menu

    showMenu(main)
end

return menus
