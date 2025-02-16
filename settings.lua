-- Helper function to easily generate startup settings
local function generate_startup_bool_setting(name_suffix, order, default)
    return {
        setting_type = "startup",
        type = "bool-setting",
        name = "hide-military-tech-" .. name_suffix,
        order = order,
        default_value = default,
    }
end

-- Define startup settings
data:extend({
    -- Overrides all other settings, i.e. nothing will be hidden. Useful to temporarily disable the mod and research a
    -- hidden technology, without having to uninstall the mod.
    generate_startup_bool_setting("override-show-all", "a[general]-a[override-show-all]", false),

    -- Technologies (and everything unlocked by them)
    generate_startup_bool_setting("hide-flamethrower", "b[hide-techs]-a[flamethrower]", true),
    generate_startup_bool_setting("hide-laser-turret", "b[hide-techs]-b[laser-turret]", false),
    generate_startup_bool_setting("hide-tank", "b[hide-techs]-c[tank]", false),
    generate_startup_bool_setting("hide-uranium-ammo", "b[hide-techs]-d[uranium-ammo]", true),
    generate_startup_bool_setting("hide-health-upgrades", "b[hide-techs]-e[health-upgrades]", false),

    -- Recipes and items (that are part of necessary technologies)
    generate_startup_bool_setting("hide-early-armor", "c[hide-items]-a[early-armor]", false),
    generate_startup_bool_setting("hide-submachine-gun", "c[hide-items]-b[submachine-gun]", false),
    generate_startup_bool_setting("hide-shotguns", "c[hide-items]-c[shotguns]", true),
    generate_startup_bool_setting("hide-cluster-grenade", "c[hide-items]-d[cluster-grenade]", true),
    generate_startup_bool_setting("hide-handheld-railgun", "c[hide-items]-e[handheld-railgun]", true),
})
