local wezterm = require 'wezterm'

local config = {
    --windowの枠を消す
    window_decorations = "RESIZE",

    -- 透過度
    window_background_opacity = 0.95,

    hide_tab_bar_if_only_one_tab = true,
}

-- 使うフォントを指定する
config.font = wezterm.font 'Hack'

config.color_scheme = 'nord'

-- weztermの起動時に呼び出すシェルを指定する
--wsl
config.default_prog = {'C:\\Program Files\\WindowsApps\\MicrosoftCorporationII.WindowsSubsystemForLinux_1.2.5.0_x64__8wekyb3d8bbwe\\wsl.exe'}
-- config.default_prog = {'C:\\Program Files\\PowerShell\\7\\pwsh.exe', '-l'} -- powershell

return config
