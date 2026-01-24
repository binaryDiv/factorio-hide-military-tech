local utils = require("prototypes.utils")

if not utils.get_setting("override-show-all") then
    -- Mod compatibility changes
    require("prototypes.mod_compat")
end
