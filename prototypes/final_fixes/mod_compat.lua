local utils = require("prototypes.utils")
local remove_vehicle_guns = utils.get_setting("remove-vehicle-guns")
local override_show_all = utils.get_setting("override-show-all")

-- Hide weapons/ammo added by mods
-- (This obviously only includes mods that have a non-military use, e.g. useful vehicles that have guns.)

-- AAI Vehicles: Ironclad
if mods["aai-vehicles-ironclad"] then
    -- Hide ammo prototypes
    if not override_show_all then
        utils.hide_prototypes({
            recipe = { "mortar-bomb", "mortar-cluster-bomb" },
            ammo = { "mortar-bomb", "mortar-cluster-bomb" },
            ammo_category = { "mortar-bomb" },
            technology_effect = {
                { "weapon-shooting-speed-#", "gun-speed", "mortar-bomb" },
            },
        })
    end

    -- Optionally remove guns from vehicle
    if remove_vehicle_guns ~= "no" then
        utils.remove_vehicle_guns("car", "ironclad", nil, true)
    end
end

-- AAI Vehicles: Warden
if mods["aai-vehicles-warden"] then
    -- Hide ammo prototypes
    if not override_show_all then
        utils.hide_prototypes({
            recipe = { "electroshock-pulse-ammo" },
            ammo = { "electroshock-pulse-ammo" },
            ammo_category = { "electro-bolter" },
            technology_effect = {
                { "laser-weapons-damage-#", "ammo-damage", "electro-bolter" },
                { "laser-shooting-speed-#", "gun-speed", "electro-bolter" },
            },
        })
    end

    -- Optionally remove guns from vehicle
    if remove_vehicle_guns ~= "no" then
        -- Don't remove turret sprite, the warden looks better with it
        utils.remove_vehicle_guns("car", "vehicle-warden", nil, false)
    end
end
