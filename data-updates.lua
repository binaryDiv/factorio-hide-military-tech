local utils = require("prototypes.utils")

-- If "override-show-all" is enabled, this mod won't modify any prototypes.
if utils.get_setting("override-show-all") then
    return
end

-- Hide technologies, items, recipes etc.
require("prototypes.updates.hide_prototypes")

-- Remove guns from vehicles (optionally)
require("prototypes.updates.remove_vehicle_guns")
