local wezterm = require "wezterm"

local config = {}

front_end = "OpenGL"
-- config.window_background_image = 'C:/Users/shunt/Pictures/Saved Pictures/4k.jpg'
config.colors = {
    -- cursor_bg =  '#00F0F0',
    cursor_fg =  'black',
    -- cursor_border = '#52ad70',
}

config.font = wezterm.font 'Hack'

font_size = 10.0

config.color_scheme = 'Snazzy (Gogh)'

config.default_prog = {'C:\\Program Files\\PowerShell\\7\\pwsh.exe', '-l'}

config.keys = {
    {
        key = '"',
        mods = 'CTRL|SHIFT|ALT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
}

return config
