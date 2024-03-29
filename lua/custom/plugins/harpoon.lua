return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require "harpoon"
		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():append()
		end)
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		for i = 1, 9 do
			vim.keymap.set("n", string.format("<space>%s", i), function()
				harpoon:list():select(i)
			end)
		end

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-S-P>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<C-S-N>", function()
			harpoon:list():next()
		end)

		harpoon:extend {
			UI_CREATE = function(cx)
				vim.keymap.set("n", "<C-v>", function()
					harpoon.ui:select_menu_item { vsplit = true }
				end, { buffer = cx.bufnr })

				vim.keymap.set("n", "<C-x>", function()
					harpoon.ui:select_menu_item { split = true }
				end, { buffer = cx.bufnr })

				vim.keymap.set("n", "<C-t>", function()
					harpoon.ui:select_menu_item { tabedit = true }
				end, { buffer = cx.bufnr })
			end,
		}
	end,
}
