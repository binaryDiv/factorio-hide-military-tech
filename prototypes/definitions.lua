local definitions = {}

-- Land mine
definitions.land_mine = {
    technology = { "land-mine" },
    recipe = { "land-mine" },
    item = { "land-mine" },
    land_mine = { "land-mine" },
    ammo_category = { "landmine" },
}

-- Atomic bomb
definitions.atomic_bomb = {
    technology = { "atomic-bomb" },
    recipe = { "atomic-bomb" },
    ammo = { "atomic-bomb" },
}

-- Artillery
definitions.artillery = {
    technology = {
        "artillery",
        "artillery-shell-damage-#",
        "artillery-shell-range-#",
        "artillery-shell-speed-#",
    },
    recipe = {
        "artillery-wagon",
        "artillery-turret",
        "artillery-shell",
    },

    -- Items
    item = { "artillery-turret" },
    item_with_entity_data = { "artillery-wagon" },
    ammo = { "artillery-shell" },
    capsule = { "artillery-targeting-remote" },

    -- Entities
    artillery_turret = { "artillery-turret" },
    artillery_wagon = { "artillery-wagon" },

    -- Ammo category: Only used for artillery
    ammo_category = { "artillery-shell" },
}

-- Tesla weapons (turret and handheld gun)
-- NOTE: "electric-weapons-damage-#" is contained in combat_robots because it depends on the Destroyer technology.
definitions.tesla_weapons = {
    technology = { "tesla-weapons" },
    recipe = {
        "teslagun",
        "tesla-ammo",
        "tesla-turret",
    },

    -- Items
    item = { "tesla-turret" },
    gun = { "teslagun" },
    ammo = { "tesla-ammo" },

    -- Entities
    electric_turret = { "tesla-turret" },

    -- Ammo category: Only used for tesla weapons
    ammo_category = { "tesla" },
}

-- Combat robots: Defender, distractor, destroyer
definitions.combat_robots = {
    technology = {
        "defender",
        "distractor",
        "destroyer",
        "follower-robot-count-#",
        "electric-weapons-damage-#",
    },
    recipe = {
        "defender-capsule",
        "distractor-capsule",
        "destroyer-capsule",
    },

    -- Items
    capsule = {
        "defender-capsule",
        "distractor-capsule",
        "destroyer-capsule",
    },

    -- Entities
    combat_robot = {
        "defender",
        "distractor",
        "destroyer",
    },

    -- Ammo category: Only used by Destroyer
    ammo_category = { "beam" },
}

-- Laser-based armor equipment: Discharge defense
definitions.discharge_defense = {
    technology = { "discharge-defense-equipment" },
    recipe = { "discharge-defense-equipment" },

    -- Items
    item = { "discharge-defense-equipment" },
    capsule = { "discharge-defense-remote" },

    -- Ammo category: Only used by Discharge defense
    ammo_category = { "electric" },
}

-- Laser-based armor equipment: Personal laser defense
definitions.personal_laser_defense = {
    technology = { "personal-laser-defense-equipment" },
    recipe = { "personal-laser-defense-equipment" },
    item = { "personal-laser-defense-equipment" },
}

-- Poison/slowdown capsules
definitions.poison_capsule = {
    recipe = { "poison-capsule" },
    capsule = { "poison-capsule" },
}
definitions.slowdown_capsule = {
    recipe = { "slowdown-capsule" },
    capsule = { "slowdown-capsule" },
}

-- Flamethrower weapons (turret and handheld gun)
definitions.flamethrower = {
    technology = {
        "flamethrower",
        "refined-flammables-#",
    },
    recipe = {
        "flamethrower",
        "flamethrower-ammo",
        "flamethrower-turret",
    },

    -- Items
    item = { "flamethrower-turret" },
    gun = { "flamethrower" },
    ammo = { "flamethrower-ammo" },

    -- Entities
    fluid_turret = { "flamethrower-turret" },

    -- Ammo category: Only used by Flamethrower, Flamethrower turret and the tank's vehicle flamethrower
    ammo_category = { "flamethrower" },
}

-- Laser turrets
definitions.laser_turret = {
    technology = {
        -- The "laser" base technology doesn't have any use apart from laser turrets and defense equipment.
        "laser",
        "laser-turret",
        "laser-shooting-speed-#",
        "laser-weapons-damage-#",
    },
    recipe = { "laser-turret" },

    -- Items
    item = { "laser-turret" },

    -- Entities
    electric_turret = { "laser-turret" },

    -- Ammo category: Only used by Laser turret and Distractor (always hidden)
    ammo_category = { "laser" },
}

-- Tank (cannon shells are defined separately)
definitions.tank = {
    technology = { "tank" },
    recipe = { "tank" },

    -- Items
    item_with_entity_data = { "tank" },

    -- Entities
    car = { "tank" },
}

-- Cannon shells (ammo for tank cannon)
definitions.cannon_shells = {
    recipe = {
        "cannon-shell",
        "explosive-cannon-shell",
        "uranium-cannon-shell",
        "explosive-uranium-cannon-shell",
    },
    ammo = {
        "cannon-shell",
        "explosive-cannon-shell",
        "uranium-cannon-shell",
        "explosive-uranium-cannon-shell",
    },

    -- Ammo category: Only used for the ammo types defined above (which are only used by tanks)
    ammo_category = { "cannon-shell" },
}

-- Uranium ammo
definitions.uranium_ammo = {
    technology = { "uranium-ammo" },
    recipe = { "uranium-rounds-magazine" },
    ammo = { "uranium-rounds-magazine" },
}

-- Health upgrades (endless technology)
definitions.health = {
    technology = { "health" },
}

-- Light armor (first tier of armor, no equipment grid; unlocked from the start)
definitions.light_armor = {
    recipe = { "light-armor" },
    armor = { "light-armor" },
}

-- Heavy armor (second tier of armor, no equipment grid; unlocked by "Heavy armor" technology)
-- NOTE: Does not include the technology, since it's a requirement for the modular armor types.
definitions.heavy_armor = {
    recipe = { "heavy-armor" },
    armor = { "heavy-armor" },
}

-- Submachine gun (unlocked by Military 1)
definitions.submachine_gun = {
    recipe = { "submachine-gun" },
    gun = { "submachine-gun" },
}

-- Shotgun (unlocked by Military 1) and Combat shotgun (unlocked by Military 3)
definitions.shotguns = {
    recipe = {
        "shotgun",
        "combat-shotgun",
        "shotgun-shell",
        "piercing-shotgun-shell",
    },

    -- Items
    gun = {
        "shotgun",
        "combat-shotgun",
    },
    ammo = {
        "shotgun-shell",
        "piercing-shotgun-shell",
    },

    -- Ammo category: Only used by shotguns
    ammo_category = { "shotgun-shell" },
}

-- Cluster grenade (unlocked by Military 4)
definitions.cluster_grenade = {
    recipe = { "cluster-grenade" },
    capsule = { "cluster-grenade" },
}

-- Handheld railgun (unlocked by Railgun technology)
-- NOTE: Railgun *turrets* are essential for space travel, so they are never hidden.
definitions.handheld_railgun = {
    recipe = { "railgun" },
    gun = { "railgun" },
}

return definitions
