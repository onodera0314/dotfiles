local wezterm = require 'wezterm';
local config = wezterm.config_builder()

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
    config.default_prog = {"wsl.exe", "~", "-d", "ubuntu"}
end

config.automatically_reload_config = true
config.use_ime = true
config.audible_bell = "Disabled"

config.font = wezterm.font("Cica")
config.font_size = 14
config.color_scheme = "Tokyo Night Moon"

config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
    {
        key = "h",
        mods = "LEADER",
        action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }
    },
    {
        key = "v",
        mods = "LEADER",
        action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }
    },
    {
        key = "LeftArrow",
        mods = "LEADER",
        action = wezterm.action.ActivatePaneDirection "Left"
    },
    {
        key = "RightArrow",
        mods = "LEADER",
        action = wezterm.action.ActivatePaneDirection "Right"
    },
    {
        key = "UpArrow",
        mods = "LEADER",
        action = wezterm.action.ActivatePaneDirection "Up"
    },
    {
        key = "DownArrow",
        mods = "LEADER",
        action = wezterm.action.ActivatePaneDirection "Down"
    },
    {
        key = "o",
        mods = "LEADER",
        action = wezterm.action.PaneSelect
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
