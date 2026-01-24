local utils = require("prototypes.utils")

-- If "override-show-all" is enabled, this mod won't modify any prototypes.
if utils.get_setting("override-show-all") then
    return
end

-- Remove military science pack (optional)
require("prototypes.final_fixes.remove_military_science")

-- Fix technology prerequisites
require("prototypes.final_fixes.fix_technologies")

-- Mod compatibility changes
require("prototypes.final_fixes.mod_compat")
