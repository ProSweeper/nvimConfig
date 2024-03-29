return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require "null-ls"

		null_ls.setup {
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.csharpier,
				null_ls.builtins.diagnostics.gitlint,
				null_ls.builtins.diagnostics.stylint,
				null_ls.builtins.diagnostics.semgrep,
				null_ls.builtins.completion.spell,
				null_ls.builtins.completion.tags,
				null_ls.builtins.code_actions.gitsigns,
				null_ls.builtins.code_actions.refactoring,
			},
		}
	end,
}
