local wk = require "which-key"
return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"marilari88/neotest-vitest",
	},
	config = function()
		require("neotest").setup {
			adapters = {
				require "neotest-vitest",
			},
		}
		vim.keymap.set("n", "<leader>nr", function()
			require("neotest").run.run()
		end)
		vim.keymap.set("n", "<leader>nR", function()
			require("neotest").run.run(vim.fn.expand "%")
		end)
		vim.keymap.set("n", "<leader>nq", function()
			require("neotest").run.stop()
		end)
		vim.keymap.set("n", "<leader>ns", function()
			require("neotest").summary.toggle()
		end)
		vim.keymap.set("n", "<leader>no", function()
			require("neotest").output.open { enter = true, last_run = true }
		end)
	end,
	wk.register {
		["<leader>n"] = {
			name = "+neotest",
			r = { "run nearest test" },
			R = { "run current file" },
			q = { "stop nearest test" },
			s = { "toggle summary" },
			o = { "show last test output" },
		},
	},
}
