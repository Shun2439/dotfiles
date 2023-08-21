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

config.color_scheme = 'nord'

-- config.default_prog = {'C:\\Program Files\\PowerShell\\7\\pwsh.exe', '-l'}
-- config.default_prog = {'C:\\windows\\system32\\cmd.exe'}
config.default_prog = {'C:\\Program Files\\WindowsApps\\MicrosoftCorporationII.WindowsSubsystemForLinux_1.2.5.0_x64__8wekyb3d8bbwe\\wsl.exe'}

config.keys = {
    {
        key = '"',
        mods = 'CTRL|SHIFT|ALT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
}

return config
