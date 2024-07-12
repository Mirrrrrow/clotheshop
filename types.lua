---@alias PedAnimation { name: string }|{ dict: string, name: string, flag: number? }

---@alias Blip { sprite: number, color: number, scale: number, short: boolean }

---@alias Marker { type: string|number, width: number, height: number, color: { r: number, g: number, b: number, a: number }, rotation: vector3, direction: vector3 }

---@class Shop
---@field label string
---@field coords vector3
---@field blip Blip?
---@field ped { heading: number, model: string, animation: PedAnimation? }?
---@field marker Marker?
---@field products table<string, string[]>
