-- TODO: Localization

-- Define boolean settings and their default values.
-- Names will be automatically prefixed with the mod name.
local bool_settings = {
    -- Overrides all other settings, i.e. nothing will be hidden. Useful to temporarily disable the mod and research a
    -- hidden technology, without having to uninstall the mod.
    ["override-show-all"] = false,

    -- Technologies (and everything unlocked by them)
    ["hide-flamethrower"] = true,
    ["hide-laser-turret"] = false,
    ["hide-tank"] = false,
    ["hide-uranium-ammo"] = true,
    ["hide-health-upgrades"] = false,

    -- Recipes and items (that are part of necessary technologies)
    ["hide-early-armor"] = false,
    ["hide-submachine-gun"] = false,
    ["hide-shotguns"] = true,
    ["hide-cluster-grenade"] = true,
    ["hide-handheld-railgun"] = true,
}

-- Generate startup settings
for name, default in pairs(bool_settings) do
    data:extend({
        {
            type = "bool-setting",
            name = "hide-military-tech-" .. name,
            setting_type = "startup",
            default_value = default,
        }
    })
end
