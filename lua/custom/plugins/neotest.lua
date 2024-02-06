-- local wk = require "which-key"
return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"marilari88/neotest-vitest",
	},
	opts = {
		-- Can be a list of adapters like what neotest expects,
		-- or a list of adapter names,
		-- or a table of adapter names, mapped to adapter configs.
		-- The adapter will then be automatically loaded with the config.
		-- adapters = {
		-- 	require "neotest-vitest",
		-- 	require("neotest-playwright").adapter {
		-- 		options = {
		-- 			persist_project_selection = true,
		-- 			enable_dynamic_test_discovery = true,
		-- 		},
		-- 	},
		-- },
		-- Example for loading neotest-go with a custom config
		-- adapters = {
		--   ["neotest-go"] = {
		--     args = { "-tags=integration" },
		--   },
		-- },
		status = { virtual_text = true },
		output = { open_on_run = true },
		quickfix = {
			open = function()
				require("trouble").open { mode = "quickfix", focus = false }
			end,
		},
	},

	config = function(_, opts)
		local neotest_ns = vim.api.nvim_create_namespace "neotest"
		vim.diagnostic.config({
			virtual_text = {
				format = function(diagnostic)
					-- Replace newline and tab characters with space for more compact diagnostics
					local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
					return message
				end,
			},
		}, neotest_ns)

		opts.consumers = opts.consumers or {}
		-- Refresh and auto close trouble after running tests
		---@type neotest.Consumer
		opts.consumers.trouble = function(client)
			client.listeners.results = function(adapter_id, results, partial)
				if partial then
					return
				end
				local tree = assert(client:get_position(nil, { adapter = adapter_id }))

				local failed = 0
				for pos_id, result in pairs(results) do
					if result.status == "failed" and tree:get_key(pos_id) then
						failed = failed + 1
					end
				end
				vim.schedule(function()
					local trouble = require "trouble"
					if trouble.is_open() then
						trouble.refresh()
						if failed == 0 then
							trouble.close()
						end
					end
				end)
				return {}
			end
		end

		-- if opts.adapters then
		-- 	local adapters = {}
		-- 	for name, config in pairs(opts.adapters or {}) do
		-- 		if type(name) == "number" then
		-- 			if type(config) == "string" then
		-- 				config = require(config)
		-- 			end
		-- 			adapters[#adapters + 1] = config
		-- 		elseif config ~= false then
		-- 			local adapter = require(name)
		-- 			if type(config) == "table" and not vim.tbl_isempty(config) then
		-- 				local meta = getmetatable(adapter)
		-- 				if adapter.setup then
		-- 					adapter.setup(config)
		-- 				elseif meta and meta.__call then
		-- 					adapter(config)
		-- 				else
		-- 					error("Adapter " .. name .. " does not support setup")
		-- 				end
		-- 			end
		-- 			adapters[#adapters + 1] = adapter
		-- 		end
		-- 	end
		-- 	opts.adapters = adapters
		-- end
		opts.adapters = {
			require "neotest-vitest",
		}

		require("neotest").setup(opts)
	end,
	-- stylua: ignore
	keys = {
		{ "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end,                      desc = "Run File" },
		{ "<leader>tT", function() require("neotest").run.run(vim.loop.cwd()) end,                          desc = "Run All Test Files" },
		{ "<leader>tr", function() require("neotest").run.run() end,                                        desc = "Run Nearest" },
		{ "<leader>tl", function() require("neotest").run.run_last() end,                                   desc = "Run Last" },
		{ "<leader>ts", function() require("neotest").summary.toggle() end,                                 desc = "Toggle Summary" },
		{ "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
		{ "<leader>tO", function() require("neotest").output_panel.toggle() end,                            desc = "Toggle Output Panel" },
		{ "<leader>tS", function() require("neotest").run.stop() end,                                       desc = "Stop" },
	},
}
-- require("neotest").setup {
-- 	adapters = {
-- 		require "neotest-vitest",
-- 	},
-- 	{
-- 		enabled = true,
-- 	},
-- 	consumers = {},
-- 	default_strategy = "integrated",
-- 	diagnostic = {
-- 		enabled = true,
-- 		severity = 1,
-- 	},
-- 	discovery = {
-- 		concurrent = 0,
-- 		enabled = true,
-- 	},
-- 	floating = {
-- 		border = "rounded",
-- 		max_height = 0.6,
-- 		max_width = 0.6,
-- 		options = {},
-- 	},
-- 	highlights = {
-- 		adapter_name = "NeotestAdapterName",
-- 		border = "NeotestBorder",
-- 		dir = "NeotestDir",
-- 		expand_marker = "NeotestExpandMarker",
-- 		failed = "NeotestFailed",
-- 		file = "NeotestFile",
-- 		focused = "NeotestFocused",
-- 		indent = "NeotestIndent",
-- 		marked = "NeotestMarked",
-- 		namespace = "NeotestNamespace",
-- 		passed = "NeotestPassed",
-- 		running = "NeotestRunning",
-- 		select_win = "NeotestWinSelect",
-- 		skipped = "NeotestSkipped",
-- 		target = "NeotestTarget",
-- 		test = "NeotestTest",
-- 		unknown = "NeotestUnknown",
-- 		watching = "NeotestWatching",
-- 	},
-- 	icons = {
-- 		child_indent = "│",
-- 		child_prefix = "├",
-- 		collapsed = "─",
-- 		expanded = "╮",
-- 		failed = "",
-- 		final_child_indent = " ",
-- 		final_child_prefix = "╰",
-- 		non_collapsible = "─",
-- 		passed = "",
-- 		running = "",
-- 		running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
-- 		skipped = "",
-- 		unknown = "",
-- 		watching = "",
-- 	},
-- 	jump = {
-- 		enabled = true,
-- 	},
-- 	log_level = 3,
-- 	output = {
-- 		enabled = true,
-- 		open_on_run = "short",
-- 	},
-- 	output_panel = {
-- 		enabled = true,
-- 		open = "botright split | resize 15",
-- 	},
-- 	projects = {},
-- 	quickfix = {
-- 		enabled = true,
-- 		open = false,
-- 	},
-- 	run = {
-- 		enabled = true,
-- 	},
-- 	running = {
-- 		concurrent = true,
-- 	},
-- 	state = {
-- 		enabled = true,
-- 	},
-- 	status = {
-- 		enabled = true,
-- 		signs = true,
-- 		virtual_text = false,
-- 	},
-- 	strategies = {
-- 		integrated = {
-- 			height = 40,
-- 			width = 120,
-- 		},
-- 	},
-- 	summary = {
-- 		animated = true,
-- 		enabled = true,
-- 		expand_errors = true,
-- 		follow = true,
-- 		mappings = {
-- 			attach = "a",
-- 			clear_marked = "M",
-- 			clear_target = "T",
-- 			debug = "d",
-- 			debug_marked = "D",
-- 			expand = { "<CR>", "<2-LeftMouse>" },
-- 			expand_all = "e",
-- 			jumpto = "i",
-- 			mark = "m",
-- 			next_failed = "J",
-- 			output = "o",
-- 			prev_failed = "K",
-- 			run = "r",
-- 			run_marked = "R",
-- 			short = "O",
-- 			stop = "u",
-- 			target = "t",
-- 			watch = "w",
-- 		},
-- 		open = "botright vsplit | vertical resize 50",
-- 	},
-- }
-- vim.keymap.set("n", "<leader>nr", function()
-- 	require("neotest").run.run()
-- end)
-- vim.keymap.set("n", "<leader>nR", function()
-- 	require("neotest").run.run(vim.fn.expand "%")
-- end)
-- vim.keymap.set("n", "<leader>nq", function()
-- 	require("neotest").run.stop()
-- end)
-- vim.keymap.set("n", "<leader>ns", function()
-- 	require("neotest").summary.toggle()
-- end)
-- vim.keymap.set("n", "<leader>no", function()
-- 	require("neotest").output.open { enter = true, last_run = true }
-- end)
-- end,
-- wk.register {
-- 	["<leader>n"] = {
-- 		name = "+neotest",
-- 		r = { "run nearest test" },
-- 		R = { "run current file" },
-- 		q = { "stop nearest test" },
-- 		s = { "toggle summary" },
-- 		o = { "show last test output" },
-- 	},
-- },
-- }
