local M = {}

---@class BibleVerseUiConfig
---@field insert_input NuiInputOptions
---@field query_input NuiInputOptions
---@field popup NuiPopupOptions

---@type BibleVerseUiConfig
M.defaults = {
	-- insert_input: configuration for input component for prompting input for 'insert' behaviour
	-- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/input
	insert_input = {
		enter = true,
		focusable = true,
		relative = "cursor",
		border = {
			style = "rounded",
			padding = { 0, 1 },
			text = {
				top = "Insert verse:",
				top_align = "left",
			},
		},
		win_options = {
			winhighlight = "FloatBorder:FloatBorder",
		},
		size = {
			-- max_width: maximum width of the insert component, in number of cells
			max_width = 50, -- custom attribute
			height = 1,
		},
		position = {
			row = 1,
			col = 0,
		},
		zindex = 20, -- Must be > popup.zindex
	},

	-- query_input: configuration for input component for prompting input for 'query' behaviour
	-- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/input
	query_input = {
		enter = true,
		focusable = true,
		relative = "editor",
		border = {
			style = "rounded",
			padding = { 0, 1 },
			text = {
				top = "Bible Verse",
				top_align = "center",
			},
		},
		size = {
			max_width = 50,
			height = 1,
		},
		position = "50%",
		zindex = 20, -- Must be > popup.zindex
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
		},
	},

	-- popup: configuration for popup component, extending from Nui configuration.
	-- see: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup
	popup = {
		enter = true,
		focusable = true,
		relative = "editor",
		border = {
			style = "rounded",
			padding = { 1, 1 },
			text = {
				top = "Bible Verse",
				top_align = "center",
			},
		},
		size = {
			-- width_percentage: % of current width used for the popup, in float.
			-- max_width_percentage: maximum % of current width used for the popup, in float.
			-- max_height_percentage: maximum % of current height used for the popup, in float.
			width_percentage = 0.5, -- custom attribute
			max_width_percentage = 0.8, -- custom attribute
			max_height_percentage = 0.7, -- custom attribute
		},
		position = "50%",
		zindex = 10,
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
		},
		buf_options = {
			modifiable = false,
			readonly = true,
		},
	},
}

return M
