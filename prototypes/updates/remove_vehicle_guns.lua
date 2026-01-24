local utils = require("prototypes.utils")
local setting_remove_vehicle_guns = utils.get_setting("remove-vehicle-guns")

-- Stop if no guns should be removed
if setting_remove_vehicle_guns == "no" then
    return
end

-- Tanks (unless hidden anyway)
if not utils.get_setting("hide-tank") then
    if setting_remove_vehicle_guns == "all" then
        utils.remove_vehicle_guns("car", "tank", nil, true)
    elseif utils.get_setting("hide-flamethrower") then
        utils.remove_vehicle_guns("car", "tank", { "tank-cannon", "tank-flamethrower" }, false)
    else
        utils.remove_vehicle_guns("car", "tank", { "tank-cannon" }, false)
    end
end

-- Spidertron: Rockets are usually available, so only remove rocket launcher guns if all guns should be removed
if setting_remove_vehicle_guns == "all" then
    utils.remove_vehicle_guns("spider-vehicle", "spidertron", nil, false)
end
