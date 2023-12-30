-- See https://wiki.factorio.com/Tutorial:Mod_settings#Reading_settings

require("defines")

-- Just an example
 data:extend({
 	{
 			type = "double-setting",
 			name = "i-speak-for-the-trees-v2-max-evolution",
 			setting_type = "runtime-global",
			order = "a",
 			minimum_value = 0,
 			maximum_value = 1,
 			default_value = 0.9
 	},
	{
 			type = "double-setting",
 			name = "i-speak-for-the-trees-v2-biter-spawner-chance",
 			setting_type = "runtime-global",
			order = "ab",
 			minimum_value = 0,
 			maximum_value = 1,
 			default_value = 0.6
 	},
	--Apocalypse include mining
	{
 			type = "bool-setting",
 			name = "i-speak-for-the-trees-v2-apocalypse-include-mining",
 			setting_type = "runtime-global",
			order = "f",
 			default_value = false
 	},
	--tree chance
 	{
 			type = "double-setting",
 			name = "i-speak-for-the-trees-v2-tree-dies-spawn-chance",
 			setting_type = "runtime-global",
			order = "ba",
 			minimum_value = 0,
 			maximum_value = 100,
 			default_value = 10
 	},
	--tree number
	{
			type = "int-setting",
 			name = "i-speak-for-the-trees-v2-tree-dies-spawn-number",
 			setting_type = "runtime-global",
			order = "bb",
 			minimum_value = 1,
 			maximum_value = 1000,
 			default_value = 1
 	},
	--rock chance
	{
 			type = "double-setting",
 			name = "i-speak-for-the-trees-v2-rock-dies-spawn-chance",
 			setting_type = "runtime-global",
			order = "ca",
 			minimum_value = 0,
 			maximum_value = 100,
 			default_value = 20
 	}, 
	--rock number
	{
			type = "int-setting",
 			name = "i-speak-for-the-trees-v2-rock-dies-spawn-number",
 			setting_type = "runtime-global",
			order = "cb",
 			minimum_value = 1,
 			maximum_value = 1000,
 			default_value = 10
 	},
	--spawner chance
	{
 			type = "double-setting",
 			name = "i-speak-for-the-trees-v2-spawner-dies-spawn-chance",
 			setting_type = "runtime-global",
			order = "ea",
 			minimum_value = 0,
 			maximum_value = 100,
 			default_value = 30
 	}, 
	--spawner number
	{
			type = "int-setting",
 			name = "i-speak-for-the-trees-v2-spawner-dies-spawn-number",
 			setting_type = "runtime-global",
			order = "eb",
 			minimum_value = 1,
 			maximum_value = 1000,
 			default_value = 30
 	},	
	--apocalypse chance
	{
 			type = "double-setting",
 			name = "i-speak-for-the-trees-v2-apocalypse-dies-spawn-chance",
 			setting_type = "runtime-global",
			order = "fa",
 			minimum_value = 0,
 			maximum_value = 100,
 			default_value = 0
 	}, 
	--apocalypse number
	{
			type = "int-setting",
 			name = "i-speak-for-the-trees-v2-apocalypse-dies-spawn-number",
 			setting_type = "runtime-global",
			order = "fb",
 			minimum_value = 1,
 			maximum_value = 1000,
 			default_value = 10
 	}
 })
