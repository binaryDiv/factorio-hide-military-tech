local utils = require("prototypes.utils")
local definitions = require("prototypes.definitions")

-- Land mines: Useless without enemies
utils.hide_prototypes(definitions.land_mine)

-- Atomic bombs: Don't make sense against asteroids
utils.hide_prototypes(definitions.atomic_bomb)

-- Artillery: Can't be used against asteroids (and would be way too expensive for that)
utils.hide_prototypes(definitions.artillery)

-- Tesla weapons: Ineffective against asteroids
utils.hide_prototypes(definitions.tesla_weapons)

-- Combat robots: Useless without enemies
utils.hide_prototypes(definitions.combat_robots)

-- Laser-based armor equipment: Useless without enemies
utils.hide_prototypes(definitions.discharge_defense)
utils.hide_prototypes(definitions.personal_laser_defense)

-- Poison/slowdown capsules: Useless without enemies
utils.hide_prototypes(definitions.poison_capsule)
utils.hide_prototypes(definitions.slowdown_capsule)

-- Flamethrower turrets are ineffective against asteroids.
-- Optional, just in case that some players might want to use the handheld flamethrower against trees or something...
if utils.get_setting("hide-flamethrower") then
    utils.hide_prototypes(definitions.flamethrower)
end

-- Laser turrets are not very effective against larger asteroids, but can be used against small asteroids. They have
-- a quite high energy consumption though, so it only makes sense to use them with nuclear fissure/fusion power.
-- By default, laser turrets will be visible. But some players might want to disable them.
if utils.get_setting("hide-laser-turret") then
    utils.hide_prototypes(definitions.laser_turret)
end

-- Tanks can be a useful vehicle even without their weapons: They are remote-controllable (unlike cars), they can plow
-- through trees without taking damage, and they can rotate on the spot. (A modded weaponless tank would be cool too!)
-- Players who don't want to use the tank can disable it, but by default the technology is visible.
-- Cannon shells will always be hidden, though.
-- NOTE: Uranium ammo has tanks as a prerequisite, so enabling uranium ammo will automatically enable tanks.
if utils.get_setting("hide-tank") and utils.get_setting("hide-uranium-ammo") then
    utils.hide_prototypes(definitions.tank)
end

-- Always hide tank cannon shells
utils.hide_prototypes(definitions.cannon_shells)

-- Uranium ammo probably doesn't make a lot of sense on space platforms, given that you can't get uranium on platforms
-- without importing it from Nauvis, which sounds painful with a rocket capacity of 20. It's optional, though.
-- Uranium cannon shells will always be hidden (because normal cannon shells are hidden as well).
-- NOTE: Enabling uranium ammo will automatically enable tanks, because the technology depends on it.
if utils.get_setting("hide-uranium-ammo") then
    utils.hide_prototypes (definitions.uranium_ammo)
end

-- Health upgrades can help to reduce damage, e.g. by lightning on Fulgora or by mistargeted attacks against trees.
if utils.get_setting("hide-health-upgrades") then
    utils.hide_prototypes (definitions.health)
end

-- Optionally hide light and heavy armor. These don't have equipment grids, so they aren't really useful.
-- NOTE: The "Heavy armor" technology will still be visible, because it's a requirement for modular armor.
if utils.get_setting("hide-early-armor") then
    utils.hide_prototypes(definitions.light_armor)
    utils.hide_prototypes(definitions.heavy_armor)
end

-- Optionally hide advanced weapons. Hidden by default, but players might want to have them.
if utils.get_setting("hide-submachine-gun") then
    utils.hide_prototypes(definitions.submachine_gun)
end

if utils.get_setting("hide-shotguns") then
    utils.hide_prototypes(definitions.shotguns)
end

if utils.get_setting("hide-cluster-grenade") then
    utils.hide_prototypes(definitions.cluster_grenade)
end

if utils.get_setting("hide-handheld-railgun") then
    -- This only hides the handheld railgun.
    -- Railgun turrets are always visible, because they are essential for space travel beyond Aquilo.
    utils.hide_prototypes(definitions.handheld_railgun)
end
