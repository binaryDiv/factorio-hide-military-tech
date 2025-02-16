local utils = require("prototypes.utils")

-- If "override-show-all" is enabled, this mod won't modify any prototypes.
if not utils.get_setting("override-show-all") then
    require("prototypes/hide_prototypes.lua")
end
