# ERM Zerg HD
ERM Zerg HD graphic assets. 

#### PLEASE DO NOT COPY THESE ASSETS TO YOUR OWN MODS. Please use mod dependencies if you plan to use these assets. HD asset duplication is bad for game performance!  

##### Licenses
Lua code files are licensed under GNU LGPLv3

However, Starcraft graphic and sound assets are properties of Blizzard Entertainment Inc.  They are used for educational purposes. The original game is now free to play.

##### Credits
- Code by SHlNZ0U & heyqule
- Graphic extraction by SHlNZ0U


### How to use?
##### 1. Add erm_zerg_hd_assets as your mod dependency in info.json
```json
{
  "factorio_version": "1.1",
  "dependencies": [
    "erm_zerg_hd_assets >= 1.0.0"
  ]
}
```
##### 2. Using assets within your mod, Here is a list of possible animations [animation_api_calls.lua](https://github.com/heyqule/erm_zerg_hd_assets/blob/main/animation_api_calls.lua)
```lua
--- Include graphics in your mods file
local ZergAnimation = require('__erm_zerg_hd_assets__/animation_db')
```

##### 3. Assign entity animation that has multiple layers
```
--- Entity_Type, Name, Animation_Type, Unit_Scale(optional)
unit['animations'] = ZergAnimation.get_layer_animation('unit','zergling','run')
```

##### 4. Assign entity animation that has single layer
```
-- Single layer animation
projectile['animation'] = ZergAnimation.get_single_animation('projectiles','spore1','projectile')
```


##### 5. What if you want to change the properties of the animation?
```
local animation = ZergAnimation.get_single_animation('projectile','spore1')
animation['unit_scale'] = 5
projectile['animation'] = animation
```

##### 6. What if you want to change the properties of the multi layer animation? Run it through a loop :)
```
local animation = ZergAnimation.get_layer_animation('unit','zergling','run')
for index, _ in pairs(animation['layers']) do
    animation['layer'][index]['unit_scale'] = 5    
end
projectile['animation'] = animation
```

##### Include Sound, see the class for details
```
local ZergSound = require('__erm_zerg_hd_assets__/sound')
unit['dying_sound'] = ZergSound.enemy_death('zergling', 1.0)
```

##### What if you don't like my animation setup.
you can link the assets directly to your animation and then define your own parameters.
```
{
    filename = '__erm_zerg_hd_assets__/graphics/entity/units/broodling/broodling-attack.png'
}
```

##### Use the creep on other buildings
```
building['spawn_decoration'] = {
    {
        decorative = "creep-decal",
        spawn_min = 3,
        spawn_max = 5,
        spawn_min_radius = 2,
        spawn_max_radius = 7
    },
    {
        decorative = "creep-decal-transparent",
        spawn_min = 4,
        spawn_max = 20,
        spawn_min_radius = 2,
        spawn_max_radius = 14,
        radius_curve = 0.9
    }
}
```

##### Linking icons
```
{
    icon = "__erm_zerg_hd_assets__/graphics/entity/icons/units/zergling.png",
    icon_size = 64,
} 
```

##### Changing Animation Speed
```lua
local animations = ZergAnimation.get_layer_animation('unit','zergling','run')
for index, animation in pairs(animations['layers']) do
    -- 1 = 60fps, 0.5 = 30fps and etc
    -- Animation DB mostly use 0.5 and 0.2 animation speed.
    ZergAnimation.change_animation_speed(animation, 0.5)
end
unit['run_animation'] = animations
```

##### Updating team color (Please see https://github.com/heyqule/erm_zerg_hd for complete example.)
1. copy settings.sample.lua and update-teamcolour.sample.lua to your mod
2. add require('update-teamcolour') to the end of your data.lua
3. make neccessary changes for update-teamcolour code
4. Test and repeat #3 until you are happy with the results.
