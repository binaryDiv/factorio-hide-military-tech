# Factorio Mod: Hide Unused Military Technologies

Factorio mod that hides military technologies and items that aren't useful when playing without enemies. 

**Mod portal:** https://mods.factorio.com/mod/hide-military-tech

You can install the mod using the in-game mod manager, or by downloading it from the mod portal page linked above to your game's `mods` directory.


## Mod description

This is a simple mod that is intended to be used when playing Space Age without enemies.

It hides military technologies, recipes and items that don't serve any purpose outside of combat, like most guns, turrets that are ineffective against asteroids, or combat robots.

The mod is designed to be simple and non-invasive. You can add it to an existing save file and remove it again later without any consequences. It doesn't remove anything from the game, nor does it modify the technology tree or any recipe ingredients, it only sets the "hidden" flag in some prototypes.

Technologies that you have already researched will be hidden as well, but they will stay unlocked, so if you disable the mod, everything will be back to normal. Items and entities that you have already crafted or placed will still exist, but the recipes for them will be inaccessible and you can't find them in Factoriopedia.

In other words, the mod does not alter the gameplay in any way, it only removes "clutter" from the technology tree, crafting menu and Factoriopedia.

If you are looking for a more immersive experience, I highly recommend to check out [Pacifist](https://mods.factorio.com/mod/Pacifist) instead, which will remove enemies and combat technologies from the game completely, as well as altering the technology tree and recipes accordingly. (Currently, Space Age support in Pacifist is not implemented yet, but it's work in progress!)

## Usage

Simply install the mod. There are several technologies that will always be hidden, while some others can be optionally hidden or unhidden using the mod startup settings. Removing the mod will restore everything back to normal.

If you only want to disable the mod temporarily (for example because you want to craft a single land mine for some reason), there is a setting "Override: Show everything". Enabling this setting will effectively disable the effects of the mod without having to remove it completely.

## List of changes

The following technologies and recipes will *always* be hidden (unless "Override: Show everything" is enabled):

- Land mine
- Atomic bomb
- Artillery: Artillery turret and wagon
- Tesla weapons: Tesla turret and handheld tesla gun
- Combat robots: Defender, distractor, destroyer
    - This includes the "Follower robot count" and "Electric weapons damage" upgrades.
- Combat equipment: Discharge defense and personal laser defense
- Poison and slowdown capsules (recipes unlocked by Military 3)
- Tank cannon shells (tanks themselves are optional)

Additionally, there are settings for the following technologies, recipes and items:

- Flamethrower: Flamethrower turret, flamethrower gun and ammo (default: hidden)
- Laser turret (default: visible)
    - This includes the "Laser" base technology, since all other technologies depending on it are always hidden.
- Tank (default: visible)
    - Tank cannon shells are always hidden, though.
- Uranium ammo (default: hidden)
- Health upgrades (default: visible)
- Light and heavy armor (default: visible)
    - The "Heavy armor" technology is always visible, since the modular armor depends on it. Only the recipe is hidden.
- Submachine gun (default: visible)
- Shotgun, combat shotgun and shotgun ammo (default: hidden)
- Cluster grenade (default: hidden)
- Handheld railgun (default: hidden)
    - The railgun *turret* is always visible.

The following technologies and recipes are explicitly **never** hidden:

- Gun turret, firearm magazine, piercing rounds magazine
- Rocket turret, rocket, explosive rocket
- Railgun turret, railgun ammo
- Wall and gate
- Grenade (used for the military science pack)
- Energy shield and energy shield MK2
- Rocket launcher (needed to launch capture robots, and ingredient for other items)

## Mod compatibility

The mod uses hardcoded lists of prototype names, which means that it will **not** automatically hide any technology or item added by other mods. It will check for the existence of prototypes before accessing them, so there shouldn't be any crash if another mod removes something that would be hidden by this mod.

If you encounter any mod incompatibilities, or would like to have options to hide technologies or recipes added by a specific mod, feel free to reach out. However, I can't promise that I'll add support for every mod.

## Support

Feel free to report bugs and mod incompatibilities, or to request new features either on the [Discussion page](https://mods.factorio.com/mod/hide-military-tech/discussion) or in the [GitHub issues](https://github.com/binaryDiv/factorio-hide-military-tech).
