local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

wezterm.on('update-right-status', function(window, pane)
    window:set_right_status(window:active_workspace())
end)

-- mmタブでcmdを開く
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
        -- 課題用
        overrides.color_scheme = 'Default (dark) (terminal.sexy)'
        overrides.window_background_opacity = 1.0
        overrides.window_background_image_hsb = {
            brightness = 0.0
        }
    else
        overrides.color_scheme = nil
        overrides.window_background_opacity = 0.8
        overrides.window_background_image_hsb = {
            brightness = 1.0
        }
    end
    window:set_config_overrides(overrides)
end)

local config = {
    -- windowの枠を消す
    window_decorations = "RESIZE",

    -- <https://github.com/ryoppippi/dotfiles/blob/main/wezterm/tab_bar.lua>
    -- タブバーの非表示
    hide_tab_bar_if_only_one_tab = true,
    -- 新規タブの`+`を非表示
    show_new_tab_button_in_tab_bar = false,
    -- どちらがいいか悩む
    use_fancy_tab_bar = false,

    -- TODO change tab colorscheme
    colors = {
        tab_bar = {
            background = "#1b1f2f",
            inactive_tab_edge = "none",

            active_tab = {
                bg_color = "#444b71",
                fg_color = "#c6c8d1",
                intensity = "Normal",
                underline = "None",
                italic = false,
                strikethrough = false
            },

            inactive_tab = {
                bg_color = "#282d3e",
                fg_color = "#c6c8d1",
                intensity = "Normal",
                underline = "None",
                italic = false,
                strikethrough = false
            },

            inactive_tab_hover = {
                bg_color = "#1b1f2f",
                fg_color = "#c6c8d1",
                intensity = "Normal",
                underline = "None",
                italic = true,
                strikethrough = false
            },

            new_tab = {
                bg_color = "#1b1f2f",
                fg_color = "#c6c8d1",
                italic = false
            },

            new_tab_hover = {
                bg_color = "#444b71",
                fg_color = "#c6c8d1",
                italic = false
            }
        }
    },

    window_padding = {
        left = 1,
        right = 0,
        top = 0,
        bottom = 0
    },

    -- color_scheme = 'Nord (base16)',
    color_scheme = 'Catppuccin Mocha',

    -- <https://wezterm.org/config/appearance.html#window-background-image>
    -- window_background_image = 'Z:\\stock\\screen_shots\\GY.png',

    window_background_opacity = 0.70,

    -- 使うフォントを指定する
    font = wezterm.font 'Moralerspace Radon HWNF',

    -- weztermの起動時に呼び出すシェルを指定する
    default_prog = {'pwsh.exe'},

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
        key = 'T',
        mods = 'SHIFT|ALT',
        action = wezterm.action({
            EmitEvent = "toggle-colorscheme"
        })
    }, {
        key = 'h', -- Home
        mods = 'ALT',
        action = act.SwitchToWorkspace {
            name = 'default'
        }
    }, -- Create a new workspace with a random name and switch to it
    {
        key = 'n',
        mods = 'ALT',
        action = act.SwitchToWorkspace
    }, -- Show the launcher in fuzzy selection mode and have it list all workspaces
    -- and allow activating one.
    {
        key = '9',
        mods = 'ALT',
        action = act.ShowLauncherArgs {
            flags = 'FUZZY|WORKSPACES'
        }
    }, {
        key = ')',
        mods = 'ALT|SHIFT',
        action = wezterm.action.ShowTabNavigator
    }, {
      key = 'J',
      mods = 'ALT|SHIFT',
      action = act.SwitchWorkspaceRelative(1)
    }, {
      key = 'K',
      mods = 'ALT|SHIFT',
      action = act.SwitchWorkspaceRelative(-1)
    }},

    ssh_domains = {{
        -- This name identifies the domain
        name = 'my.server',
        -- The hostname or address to connect to. Will be used to match settings
        -- from your ssh config file
        remote_address = '192.168.1.1',
        -- The username to use on the remote host
        username = 'shun'
    }}
}

-- activate tab
-- wrong?
-- for i = 1, 9 do
--   table.insert(keys, {
--     key = tostring(i),
--     mods = "CTRL",
--     action = wezterm.action.ActivateTab(i - 1),
--   })
-- end

return config
