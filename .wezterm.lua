local wezterm = require 'wezterm'

local config = {
	-- windowの枠を消す
	window_decorations = "RESIZE",

	window_background_opacity = 0.8,

	hide_tab_bar_if_only_one_tab = true,

	-- 使うフォントを指定する
	font = wezterm.font 'Moralerspace Radon HWNF',

	-- weztermの起動時に呼び出すシェルを指定する
	-- default_prog = {'C:\\Program Files\\WindowsApps\\MicrosoftCorporationII.WindowsSubsystemForLinux_3.0.9.0_x64__8wekyb3d8bbwe\\wsl.exe'},
	default_prog = {'C:\\soft\\PowerShell\\7\\pwsh.exe', '-l'}, 
	-- keys = {
	-- 	{
	-- 		key = '1',
	-- 		mods = 'CTRL|SHIFT',
	-- 		action = {'C:\\soft\\PowerShell\\7\\pwsh.exe', '-l'},
	-- 	},
	-- }
}

return config
