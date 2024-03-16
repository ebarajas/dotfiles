local wezterm = require 'wezterm'

local action = wezterm.action

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.scrollback_lines = 1000000
config.enable_scroll_bar = true

config.color_scheme = 'Firewatch'

-- Set CTRL+<SPACE> as leader
config.leader = { key = ' ', mods = 'CTRL' }

config.mouse_bindings = {
    -- Allow for CTRL+Click or CMD+Click on Links
    {
        event = { Up = {streak = 1, button = 'Left' } },
        mods = 'CTRL',
        action = wezterm.action.OpenLinkAtMouseCursor,
    },
    {
        event = { Up = {streak = 1, button = 'Left' } },
        mods = 'CMD',
        action = wezterm.action.OpenLinkAtMouseCursor,
    }
}

config.keys = {
    {
        key = '|',
        mods = 'LEADER|SHIFT',
        action = action.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
    {
        key = '\\',
        mods = 'LEADER',
        action = action.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    -- vim bindings for moving pane directions
    {
        key = 'h',
        mods = 'LEADER',
        action = action.ActivatePaneDirection 'Left'
    },
    {
        key = 'j',
        mods = 'LEADER',
        action = action.ActivatePaneDirection 'Down'
    },
    {
        key = 'k',
        mods = 'LEADER',
        action = action.ActivatePaneDirection 'Up'
    },
    {
        key = 'l',
        mods = 'LEADER',
        action = action.ActivatePaneDirection 'Right'
    },
}

return config
