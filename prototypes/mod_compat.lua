local utils = require("prototypes.utils")

-- Hide weapons/ammo added by mods
-- (This obviously only includes mods that have a non-military use, e.g. useful vehicles that have guns.)

-- AAI Vehicles: Ironclad
if mods["aai-vehicles-ironclad"] then
    utils.hide_prototypes({
        recipe = { "mortar-bomb", "mortar-cluster-bomb" },
        ammo = { "mortar-bomb", "mortar-cluster-bomb" },
        ammo_category = { "mortar-bomb" },
        technology_effect = {
            { "weapon-shooting-speed-#", "gun-speed", "mortar-bomb" },
        },
    })
end

-- AAI Vehicles: Warden
if mods["aai-vehicles-warden"] then
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
