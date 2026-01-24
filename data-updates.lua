local utils = require("prototypes.utils")

-- If "override-show-all" is enabled, this mod won't hide any prototypes.
if not utils.get_setting("override-show-all") then
    -- Hide technologies, items, recipes etc.
    require("prototypes.updates.hide_prototypes")
end

-- Remove guns from vehicles (optionally)
require("prototypes.updates.remove_vehicle_guns")
