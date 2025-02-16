local utils = require("prototypes.utils")

-- Land mines: Useless without enemies
utils.hide_prototypes {
    technology = { "land-mine" },
    recipe = { "land-mine" },
    -- Items
    item = { "land-mine" },
    ammo_category = { "landmine" },
    -- Entities
    land_mine = { "land-mine" },
}

-- Atomic bombs: Don't make sense against asteroids
utils.hide_prototypes {
    technology = { "atomic-bomb" },
    recipe = { "atomic-bomb" },
    -- Items
    ammo = { "atomic-bomb" },
}

-- Artillery: Can't be used against asteroids (and would be way too expensive for that)
utils.hide_prototypes {
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
    ammo_category = { "artillery-shell" },
    capsule = { "artillery-targeting-remote" },
    -- Entities
    artillery_turret = { "artillery-turret" },
    artillery_wagon = { "artillery-wagon" },
}

-- Tesla weapons: Ineffective against asteroids
utils.hide_prototypes {
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
    ammo_category = { "tesla" },
    -- Entities
    electric_turret = { "tesla-turret" },
}

-- Combat robots: Useless without enemies
utils.hide_prototypes {
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
    ammo_category = { "beam" },
    -- Entities
    combat_robot = {
        "defender",
        "distractor",
        "destroyer",
    },
}

-- Laser-based armor equipment: Useless without enemies
utils.hide_prototypes {
    technology = {
        "discharge-defense-equipment",
        "personal-laser-defense-equipment",
    },
    recipe = {
        "discharge-defense-equipment",
        "personal-laser-defense-equipment",
    },
    item = {
        "discharge-defense-equipment",
        "personal-laser-defense-equipment",
    },
    capsule = { "discharge-defense-remote" },
    ammo_category = { "electric" },
}

-- Poison/slowdown capsules: Useless without enemies
utils.hide_prototypes {
    recipe = {
        "poison-capsule",
        "slowdown-capsule",
    },
    capsule = {
        "poison-capsule",
        "slowdown-capsule",
    },
}

-- Flamethrower turrets are ineffective against asteroids.
-- Optional, just in case that some players might want to use the handheld flamethrower against trees or something...
if utils.get_setting("hide-flamethrower") then
    utils.hide_prototypes {
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
        ammo_category = { "flamethrower" },
        -- Entities
        fluid_turret = { "flamethrower-turret" },
    }
end

-- Laser turrets are not very effective against larger asteroids, but can be used against small asteroids. They have
-- a quite high energy consumption though, so it only makes sense to use them with nuclear fissure/fusion power.
-- By default, laser turrets will be visible. But some players might want to disable them.
if utils.get_setting("hide-laser-turret") then
    utils.hide_prototypes {
        technology = {
            -- The base technology "laser" doesn't have any use apart from laser turrets and defense equipment
            "laser",
            "laser-turret",
            "laser-shooting-speed-#",
            "laser-weapons-damage-#",
        },
        recipe = { "laser-turret" },
        item = { "laser-turret" },
        electric_turret = { "laser-turret" },
        ammo_category = { "laser" },
    }
end

-- Tanks can be a useful vehicle even without their weapons: They are remote-controllable (unlike cars), they can plow
-- through trees without taking damage, and they can rotate on the spot. (A modded weaponless tank would be cool too!)
-- Players who don't want to use the tank can disable it, but by default the technology is visible.
-- Cannon shells will always be hidden, though.
-- NOTE: Uranium ammo has tanks as a prerequisite, so enabling uranium ammo will automatically enable tanks.
if utils.get_setting("hide-tank") and utils.get_setting("hide-uranium-ammo") then
    utils.hide_prototypes {
        technology = { "tank" },
        recipe = { "tank" },
        item_with_entity_data = { "tank" },
        car = { "tank" },
    }
end

-- Always hide tank cannon shells
utils.hide_prototypes {
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
    ammo_category = { "cannon-shell" },
}

-- Uranium ammo probably doesn't make a lot of sense on space platforms, given that you can't get uranium on platforms
-- without importing it from Nauvis, which sounds painful with a rocket capacity of 20. It's optional, though.
-- Uranium cannon shells will always be hidden (because normal cannon shells are hidden as well).
-- NOTE: Enabling uranium ammo will automatically enable tanks, because the technology depends on it.
if utils.get_setting("hide-uranium-ammo") then
    utils.hide_prototypes {
        technology = { "uranium-ammo" },
        recipe = { "uranium-rounds-magazine" },
        ammo = { "uranium-rounds-magazine" },
    }
end

-- Health upgrades can help to reduce damage, e.g. by lightning on Fulgora or by mistargeted attacks against trees.
if utils.get_setting("hide-health-upgrades") then
    utils.hide_prototypes {
        technology = { "health" },
    }
end

-- Optionally hide submachine gun. Visible by default, because it can be useful to destroy entities (trees, spawners).
if utils.get_setting("hide-submachine-gun") then
    utils.hide_prototypes {
        recipe = { "submachine-gun" },
        gun = { "submachine-gun" },
    }
end

-- Optionally hide light and heavy armor. These don't have equipment grids, so they aren't really useful.
-- NOTE: The "Heavy armor" technology will still be visible, because it's a requirement for modular armor.
if utils.get_setting("hide-early-armor") then
    utils.hide_prototypes {
        recipe = {
            "light-armor",
            "heavy-armor",
        },
        armor = {
            "light-armor",
            "heavy-armor",
        },
    }
end

-- Optionally hide advanced weapons. Hidden by default, but players might want to have them.
if utils.get_setting("hide-shotguns") then
    utils.hide_prototypes {
        recipe = {
            "shotgun",
            "combat-shotgun",
            "shotgun-shell",
            "piercing-shotgun-shell",
        },
        gun = {
            "shotgun",
            "combat-shotgun",
        },
        ammo = {
            "shotgun-shell",
            "piercing-shotgun-shell",
        },
        ammo_category = { "shotgun-shell" },
    }
end

if utils.get_setting("hide-cluster-grenade") then
    utils.hide_prototypes {
        recipe = { "cluster-grenade" },
        capsule = { "cluster-grenade" },
    }
end

if utils.get_setting("hide-handheld-railgun") then
    utils.hide_prototypes {
        recipe = { "railgun" },
        gun = { "railgun" },
    }
end
