local utils = require("prototypes.utils")

-- Stop if military science pack should not be removed
if not utils.get_setting("remove-military-science-pack") then
    return
end

local technologies = data.raw.technology

-- Remove military science pack from all technologies
for _, tech in pairs(technologies) do
    -- Remove military science pack research ingrediennt
    if tech.unit ~= nil and tech.unit.ingredients ~= nil then
        for index, ingredient_table in pairs(tech.unit.ingredients) do
            if ingredient_table[1] == "military-science-pack" then
                table.remove(tech.unit.ingredients, index)
                break
            end
        end
    end

    -- Replace military science pack prerequisite with Military 2
    if tech.prerequisites ~= nil then
        utils.table_replace_value(tech.prerequisites, "military-science-pack", "military-2")
    end
end

-- Hide military science pack technology, item and recipe
utils.hide_prototypes({
    technology = { "military-science-pack" },
    recipe = { "military-science-pack" },
    item = { "military-science-pack" },
})
