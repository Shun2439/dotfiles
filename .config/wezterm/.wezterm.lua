local wezterm = require 'wezterm'

-- 新規タブでcmdを開く
wezterm.on('SpawnNewTabOnCmd', function(window, pane)
    window:perform_action(wezterm.action {
        SpawnCommandInNewTab = {
            args = {"cmd.exe"} -- WSLのホームディレクトリを指定
        }
    }, pane)
end)

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

-- <https://github.com/wez/wezterm/issues/4429#issuecomment-1774827062>
wezterm.on('toggle-colorscheme', function(window, pane)
    local overrides = window:get_config_overrides() or {}
    if not overrides.color_scheme then
        overrides.color_scheme = 'Default (dark) (terminal.sexy)'
        overrides.window_background_opacity = 1.0
    else
        overrides.color_scheme = nil
        overrides.window_background_opacity = 0.8
    end
    window:set_config_overrides(overrides)
end)

local config = {
    -- windowの枠を消す
    window_decorations = "RESIZE",

    hide_tab_bar_if_only_one_tab = true,

    color_scheme = 'Nord (base16)',

    window_background_opacity = 0.5,

    -- 使うフォントを指定する
    font = wezterm.font 'Moralerspace Radon HWNF',

    -- weztermの起動時に呼び出すシェルを指定する
    default_prog = {'cmd.exe'},

    keys = {{
        key = '!',
        mods = 'CTRL|SHIFT',
        action = wezterm.action({
            EmitEvent = "SpawnNewTabOnCmd"
        })
    }, {
        key = '"',
        mods = 'CTRL|SHIFT',
        action = wezterm.action({
            EmitEvent = "SpawnNewTabOnPwsh"
        })
    }, {
        key = '#',
        mods = 'CTRL|SHIFT',
        action = wezterm.action({
            EmitEvent = "SpawnNewTabOnWsl"
        })
    }, {
        key = 't',
        mods = 'CTRL|ALT',
        action = wezterm.action({
            EmitEvent = "toggle-colorscheme"
        })
    }}
}

return config
