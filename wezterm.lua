local wezterm = require 'wezterm';
local config = wezterm.config_builder()

config.default_prog = {"wsl.exe", "~", "-d", "ubuntu"}
config.font = wezterm.font("Cica")
config.font_size = 14
config.color_scheme = "Blazer"
config.use_ime = true

config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
    {
        key = "v",
        mods = "LEADER",
        action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }
    },
    {
        key = "h",
        mods = "LEADER",
        action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }
    },
    {
        key = "s",
        mods = "LEADER",
        action = wezterm.action.ShowLauncherArgs { flags = "WORKSPACES", title = "Select workspace" }
    },
    {
        key = "c",
        mods = "LEADER",
        action = wezterm.action.PromptInputLine {
            description = "Create new workspace:",
            action = wezterm.action_callback(function(window, pane, line)
                if line then
                    window:perform_action(
                        wezterm.action.SwitchToWorkspace { name = line },
                        pane
                    )
                end
            end),
        }
    },
    {
        key = "n",
        mods = "LEADER",
        action = wezterm.action.SwitchWorkspaceRelative(1)
    },
    {
        key = "p",
        mods = "LEADER",
        action = wezterm.action.SwitchWorkspaceRelative(-1)
    },
}

return config