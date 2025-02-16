local utils = {}

-- Get the value of a mod startup setting (name will be automatically prefixed with mod name)
function utils.get_setting(name)
    return settings.startup["hide-military-tech-" .. name].value
end

-- Hide a technology (ignores names that don't exist and resolves upgradable technologies)
function utils.hide_technology(name)
    local technologies = data.raw["technology"]

    -- Handle upgradable technologies (e.g. "follower-robot-count-#" for "follower-robot-count-1", "...-2", etc.)
    if name:sub(-2) == "-#" then
        -- Convert string to a pattern to match "prefix-NUMBER": First, replace "-" with "%-" because "-" is a
        -- magic character in Lua patterns. Then, replace the "#" at the end with "%d+" which matches numbers.
        local pattern = name:gsub("%-", "%%-"):gsub("#$", "%%d+")

        -- Find and hide all matching technologies
        for tech_name, tech in pairs(technologies) do
            if tech_name:match(pattern) then
                tech.hidden = true
            end
        end
    elseif technologies[name] ~= nil then
        technologies[name].hidden = true
    end
end

-- Hide a prototype of a specific type and name (ignores prototypes that don't exist)
function utils.hide_prototype(type, name)
    -- Special handling for technologies
    if type == "technology" then
        utils.hide_technology(name)
        return
    end

    -- Handle any other type of prototype
    local prototype = data.raw[type][name]
    if prototype ~= nil then
        prototype.hidden = true
    end
end

-- Hide multiple prototypes grouped by type in a table, where the keys are prototype types and the values are arrays
-- of prototype names.
-- The types can be written with underscores, which will be replaced with dashes to allow for easier table definitions
-- (e.g. "ammo_category" is converted to "ammo-category").
-- For technologies, you can use the special syntax "example-#" to mean all technologies that start with "example-"
-- followed by a number.
function utils.hide_prototypes(prototype_groups)
    for type, names in pairs(prototype_groups) do
        -- Replace underscores with dashes to allow easier table definitions
        type = type:gsub("_", "-")

        for _, name in pairs(names) do
            utils.hide_prototype(type, name)
        end
    end
end

return utils
