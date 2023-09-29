local wezterm = require 'wezterm'

local action = wezterm.action

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = 'Firewatch'

-- Set CTRL+<SPACE> as leader
config.leader = { key = ' ', mods = 'CTRL' }

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
