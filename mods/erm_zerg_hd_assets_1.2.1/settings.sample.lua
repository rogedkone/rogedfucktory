
    data:extend {
        {
            type = "bool-setting",
            name = "erm_zerg-team_color_enable",
            description = "erm_zerg-team_color_enable",
            setting_type = "startup",
            default_value = true,
            order = "erm_zerg-110",
        },
        {
            type = "color-setting",
            name = "erm_zerg-team_color",
            description = "erm_zerg-team_color",
            setting_type = "startup",
            default_value = { a=255,b=255,g=255,r=255 },
            order = "erm_zerg-111",
        },
        {
            type = "bool-setting",
            name = "erm_zerg-team_color_preserve_gloss",
            description = "erm_zerg-team_color_preserve_gloss",
            setting_type = "startup",
            default_value = false,
            order = "erm_zerg-113",
        },
    }