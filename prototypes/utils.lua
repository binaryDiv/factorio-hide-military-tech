local utils = {}

-- Get the value of a mod startup setting (name will be automatically prefixed with mod name)
function utils.get_setting(name)
    return settings.startup["hide-military-tech-" .. name].value
end

-- Return a list of all technology prototypes matching the given name. If the name ends with "-#", find all technologies
-- with "#" replaced by a number counting upwards (e.g. "weapon-shooting-speed-1", "-2", "-3", ...).
-- If its a regular technology name, return a list with only that technology, or an empty list if it doesn't exist.
function utils.resolve_technology_name(name)
    local technologies = data.raw["technology"]

    if name:sub(-2) == "-#" then
        local matches = {}
        local prefix = name:sub(1, -2)

        -- It's safe to assume that there won't be 100 levels of a technology
        for i = 1, 100 do
            local tech = technologies[prefix .. i]
            if tech ~= nil then
                table.insert(matches, tech)
            else
                break
            end
        end
        return matches
    elseif technologies[name] ~= nil then
        return { technologies[name] }
    else
        return {}
    end
end

-- Hide effect of a technology (e.g. weapon damage upgrades)
function utils.hide_technology_effect(tech_name, effect_type, effect_subject)
    -- Handle upgradable technologies (e.g. "weapon-shooting-speed-#", replacing "#" with 1, 2, ...)
    for _, tech in pairs(utils.resolve_technology_name(tech_name)) do
        for _, tech_effect in pairs(tech.effects or {}) do
            if tech_effect.type == effect_type and tech_effect.ammo_category == effect_subject then
                tech_effect.hidden = true
            end
        end
    end
end

-- Hide a prototype of a specific type and name (ignores prototypes that don't exist)
function utils.hide_prototype(type, name)
    -- Special handling for technologies
    if type == "technology" then
        -- Handle upgradable technologies (e.g. "weapon-shooting-speed-#", replacing "#" with 1, 2, ...)
        for _, tech in pairs(utils.resolve_technology_name(name)) do
            tech.hidden = true
        end
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
    for type, items in pairs(prototype_groups) do
        -- Special case: Hide technology effects, e.g. weapon damage upgrades
        if type == "technology_effect" then
            for _, item in pairs(items) do
                -- Items are tuples of technology name, effect type, effect name/subject (e.g. ammo category)
                utils.hide_technology_effect(item[1], item[2], item[3])
            end
        else
            -- Replace underscores with dashes to allow easier table definitions
            type = type:gsub("_", "-")

            for _, name in pairs(items) do
                utils.hide_prototype(type, name)
            end
        end
    end
end

-- Add a prerequisite to a technology
function utils.add_tech_prerequisite(tech_name, prerequisite)
    local tech = data.raw.technology[tech_name]

    if tech and data.raw.technology[prerequisite] then
        tech.prerequisites = tech.prerequisites or {}

        -- Check if prerequisite already exists
        for _, item in pairs(tech.prerequisites) do
            if item == prerequisite then
                return
            end
        end

        table.insert(tech.prerequisites, prerequisite)
    end
end

-- Remove a prerequisite from a technology if it exists
function utils.remove_tech_prerequisite(tech_name, prerequisite)
    local tech = data.raw.technology[tech_name]

    if tech and tech.prerequisites then
        for index, item in pairs(tech.prerequisites or {}) do
            if item == prerequisite then
                table.remove(tech.prerequisites, index)
                return
            end
        end
    end
end

return utils
