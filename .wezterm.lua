local wezterm = require 'wezterm'

-- 新規タブでPowerShell 7を開く
wezterm.on('SpawnNewTabOnPwsh', function(window, pane)
    window:perform_action(wezterm.action {
        SpawnCommandInNewTab = {
            args = {"pwsh.exe"}
        }
    }, pane)
end)

-- 新規タブでWslを開く
wezterm.on('SpawnNewTabOnWsl', function(window, pane)
    window:perform_action(wezterm.action {
        SpawnCommandInNewTab = {
            args = {"wsl.exe"} -- WSLのホームディレクトリを指定
        }
    }, pane)
end)

local config = {
    -- windowの枠を消す
    window_decorations = "RESIZE",

    window_background_opacity = 0.8,

    hide_tab_bar_if_only_one_tab = true,

    -- 使うフォントを指定する
    font = wezterm.font 'Moralerspace Radon HWNF',

    -- weztermの起動時に呼び出すシェルを指定する
    default_prog = {'pwsh.exe'},

    keys = {{
        key = '!',
        mods = 'CTRL|SHIFT',
        action = wezterm.action({
            EmitEvent = "SpawnNewTabOnPwsh"
        })
    }, {
        key = '"',
        mods = 'CTRL|SHIFT',
        action = wezterm.action({
            EmitEvent = "SpawnNewTabOnWsl"
        })
    }}
}

return config
