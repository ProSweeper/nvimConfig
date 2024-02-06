return {
	-- -- Set lualine as statusline
	-- "nvim-lualine/lualine.nvim",
	-- -- See `:help lualine.txt`
	-- opts = {
	-- 	options = {
	-- 		icons_enabled = true,
	-- 		theme = "onedark",
	-- 		component_separators = "|",
	-- 		section_separators = "",
	-- 	},
	-- },
	"nvim-lualine/lualine.nvim",
	opts = function()
		return {
			options = {
				icons_enabled = true,
				theme = "onedark",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = {
					{
						"mode",
						icon = "",
						separator = { left = "", right = "" },
						color = {
							fg = "#1c1d21",
							bg = "#b4befe",
						},
					},
				},
				lualine_b = {
					{
						"branch",
						icon = "",
						separator = { left = "", right = "" },
						color = {
							fg = "#1c1d21",
							bg = "#7d83ac",
						},
					},
					{
						"diff",
						separator = { left = "", right = "" },
						color = {
							fg = "#1c1d21",
							bg = "#7d83ac",
						},
					},
				},
				lualine_c = {
					{
						"diagnostics",
						separator = { left = "", right = "" },
						color = {
							bg = "#45475a",
						},
					},
					{
						"filename",
					},
				},
				lualine_x = {
					{
						"copilot",
						-- Default values
						symbols = {
							status = {
								icons = {
									enabled = " ",
									sleep = " ", -- auto-trigger disabled
									disabled = " ",
									warning = " ",
									unknown = " ",
								},
								hl = {
									enabled = "#50FA7B",
									sleep = "#AEB7D0",
									disabled = "#6272A4",
									warning = "#FFB86C",
									unknown = "#FF5555",
								},
							},
							spinners = require("copilot-lualine.spinners").dots,
							spinner_color = "#6272A4",
						},
						show_colors = false,
						show_loading = true,
					},
					"encoding",
					"fileformat",
					"filetype",
				},
				lualine_y = {
					{
						"filetype",
						icons_enabled = true,
						color = {
							fg = "#1C1D21",
							bg = "#eba0ac",
						},
					},
				},
				lualine_z = {
					{
						"location",
						icon = "",
						color = {
							fg = "#1c1d21",
							bg = "#f2cdcd",
						},
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = { "neo-tree", "lazy" },
		}
	end,
}
