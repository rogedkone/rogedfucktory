# Fork Notice #
This is a fork to theRustyKnife's [Crafting Combinator mod v0.16.3](https://mods.factorio.com/mod/crafting_combinator).

# What's New? #
- **New sticky behavior: Craft N times before switch** - Is your cc build plagued by the flip-flop behavior due to buffers and signal fluctuations? You can now force a machine to stay on a recipe for a certain amount of craft cycles before switching.
- **Input buffer size setting** - You can now control the amount of ingredients placed into the machine during recipe switch.
- **Blueprints and ghosts** now carry combinator settings.
- **Cloning** is now handled - You can now use cc/rc's on Space Exploration spaceships
- Bugfixes and optimization.

Refer to v0.1.4 changelog for details.

# Migration #
This fork is **not compatible** with the original mod. If you wish to migrate your current save (from original mod to this fork) you can do the following:
1. Follow the [remote-data migration procedures](https://github.com/loneguardian/crafting_combinator_xeraph_migration) using the [migration bridge mod](https://mods.factorio.com/mod/crafting_combinator_xeraph_migration). **OR**
2. Load this fork over your existing save. WARNING: All combinators will be migrated with default settings and data state.

Upon migrating to this fork, you will notice the removal of `crafting_combinator:settings-entity (programmable-speaker)` and its related objects, this is to be expected.

-------------

# Mod Description #
**A combinator that can set the recipe of an assembler (or other machine) based on signal inputs for any and all of your automation needs. There's also a combinator to get recipe ingredients.**

-------------

# How to #

## Crafting Combinator ##
1. Place it facing the machine you want it to work with
2. Configure it in the menu which you can open by clicking on the combinator
3. Connect it to your network
4. Add a chest behind the combinator for the overflow items
5. Build a [super awesome circuit](https://forums.factorio.com/viewtopic.php?f=193&t=42964) that can craft anything in one assembler :P

The recipes can be signaled in two ways:

1. The resulting item (or fluid) of the recipe, if its name matches the recipes' name
2. A virtual signal generated by this mod found under the 'Crafting combinator recipes' tab

The signal with highest count will be selected.

## Recipe Combinator ##
Send a recipe signal to the input side. Then depending on the configuration, the outputs will appear on the other end.
- Ingredient mode will output the ingredients of the recipe
- Product mode will output the products of the recipe
- Usage mode will output the signals for recipes that consume the given item
- Recipe mode will output the signals for recipes that produce the given item
- Machine mode will output the buildings in which the given item can be made

# Localisation #
Thanks to [Nexela](https://mods.factorio.com/mods/Nexela) it is no longer necessary to use the locale mod and everything should have proper locale.

# Credits #
**[LuziferSenpai](https://mods.factorio.com/mods/LuziferSenpai) for the original idea and some of the code.**  
[MPX](https://mods.factorio.com/mods/MPX) for the german locale and some of the code.  
[theRustyKnife](https://mods.factorio.com/mods/theRustyKnife) for up till v0.16.3 of the code.