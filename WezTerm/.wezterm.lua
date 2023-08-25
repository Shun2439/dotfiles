-- 何かの宣言？
local wezterm = require "wezterm"

local config = {}

-- 使うフォントを指定する
-- config.font = wezterm.font 'Hack'

-- weztermの起動時に呼び出すシェルを指定する
-- config.default_prog = {'C:\\Program Files\\PowerShell\\7\\pwsh.exe', '-l'} -- powershell
config.default_prog = {'C:\\Program Files\\WindowsApps\\MicrosoftCorporationII.WindowsSubsystemForLinux_1.2.5.0_x64__8wekyb3d8bbwe\\wsl.exe'} --wsl

return config
