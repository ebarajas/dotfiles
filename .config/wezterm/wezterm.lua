local wezterm = require("wezterm")

local action = wezterm.action

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

wezterm.on("update-right-status", function(window, pane)
	local name = window:active_key_table()
	if name then
		name = "KEY TABLE: " .. name
	end
	window:set_right_status(name or "")
end)

config.font = wezterm.font_with_fallback({ "Berkeley Mono", "SF Mono" })

config.scrollback_lines = 1000000
config.enable_scroll_bar = true

config.color_scheme = "Firewatch"

-- Set CTRL+<SPACE> as leader
config.leader = { key = " ", mods = "CTRL" }

config.mouse_bindings = {
	-- Allow for CTRL+Click or CMD+Click on Links
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CMD",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

config.keys = {
	{
		key = "|",
		mods = "LEADER|SHIFT",
		action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "\\",
		mods = "LEADER",
		action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "x",
		mods = "LEADER",
		action = action.CloseCurrentPane({ confirm = false }),
	},
	-- vim bindings for moving pane directions
	{
		key = "h",
		mods = "LEADER",
		action = action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = action.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "CMD",
		action = action.Multiple({
			action.ClearScrollback("ScrollbackAndViewport"),
			action.SendKey({ key = "L", mods = "CTRL" }), -- Send Ctrl+L to ask the shell to redraw the prompt
		}),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = action.Multiple({
			action.ClearScrollback("ScrollbackAndViewport"),
			action.SendKey({ key = "L", mods = "CTRL" }),
		}),
	},
	{
		key = "r",
		mods = "LEADER",
		action = action.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
			timeout_milliseconds = 1000,
		}),
	},
	-- Support Shift+Enter in claude code
	{ key = "Enter", mods = "SHIFT", action = wezterm.action({ SendString = "\x1b\r" }) },
}

config.key_tables = {
	resize_pane = {
		{ key = "h", action = action.AdjustPaneSize({ "Left", 5 }) },
		{ key = "l", action = action.AdjustPaneSize({ "Right", 5 }) },
		{ key = "j", action = action.AdjustPaneSize({ "Up", 5 }) },
		{ key = "k", action = action.AdjustPaneSize({ "Down", 5 }) },
		{ key = "Escape", action = "PopKeyTable" },
	},
}

-- config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- table.insert(config.hyperlink_rules, {
-- regex = [[\b\S*\b\:\d+]]
-- format = "vscode://$0"
-- })

return config
