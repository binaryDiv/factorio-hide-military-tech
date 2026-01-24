local utils = require("prototypes.utils")

-- Some fixes for technology prerequisites to make technologies available without requiring lots of unnecessary techs.

-- Tesla weapons: Fix prerequisites for electric weapons damage upgrades
if not utils.get_setting("hide-tesla-weapons") then
    -- "electric-weapons-damage-{1,2}" only affect combat robots/equipment and depend on the combat robot technologies,
    -- but levels 3+ increase tesla damage as well.
    utils.remove_tech_prerequisite("electric-weapons-damage-3", "electric-weapons-damage-2")

    -- The tech should already depend on the tesla-weapons technology, but let's be safe in case a mod changes that.
    utils.add_tech_prerequisite("electric-weapons-damage-3", "tesla-weapons")

    -- Set upgrade=false, otherwise the tech won't be visible with "override-show-all" unless level 1+2 is researched.
    if data.raw.technology["electric-weapons-damage-3"] then
        data.raw.technology["electric-weapons-damage-3"].upgrade = false
    end
end

-- Laser turrets: Fix prerequisites for shooting speed and weapons damage upgrades
if not utils.get_setting("hide-laser-turret") then
    -- "laser-shooting-speed-#" and "laser-weapons-damage-#" depend on the "Laser" base technology, but only make sense
    -- if the laser turret has been researched already.
    utils.add_tech_prerequisite("laser-shooting-speed-1", "laser-turret")
    utils.add_tech_prerequisite("laser-weapons-damage-1", "laser-turret")
end

-- Remove some unneeded prerequisites if the Military science pack has been removed
if utils.get_setting("remove-military-science-pack") then
    -- Portable fission reactor: Uses military science pack, but shouldn't really need military technologies
    utils.remove_tech_prerequisite("fission-reactor-equipment", "military-2")
end
