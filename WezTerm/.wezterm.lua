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

--config.window_background_image = 'C:\\Users\\shunt\\workdir\\config\\WezTerm\\I.png'

config.window_background_image_hsb = {
  -- Darken the background image by reducing it to 1/3rd
  brightness = 0.3,

  -- You can adjust the hue by scaling its value.
  -- a multiplier of 1.0 leaves the value unchanged.
  hue = 1.0,

  -- You can adjust the saturation also.
  saturation = 1.0,
}

-- weztermの起動時に呼び出すシェルを指定する
--wsl
config.default_prog = {'C:\\Program Files\\WindowsApps\\MicrosoftCorporationII.WindowsSubsystemForLinux_1.2.5.0_x64__8wekyb3d8bbwe\\wsl.exe'}

-- powershell
-- config.default_prog = {'C:\\Program Files\\PowerShell\\7\\pwsh.exe', '-l'} 

return config
