local wezterm = require 'wezterm'

local config = {
	-- windowの枠を消す
	window_decorations = "RESIZE",

	window_background_opacity = 0.7,

	hide_tab_bar_if_only_one_tab = true,

  -- color_scheme = 'nord',

	-- 使うフォントを指定する
	font = wezterm.font 'Hack NF',

	-- weztermの起動時に呼び出すシェルを指定する
	default_prog = {'C:\\Program Files\\WindowsApps\\MicrosoftCorporationII.WindowsSubsystemForLinux_2.0.9.0_x64__8wekyb3d8bbwe\\wsl.exe'}, --wsl
	-- default_prog = {'C:\\Program Files\\PowerShell\\7\\pwsh.exe', '-l'}, --powershell
}

return config
