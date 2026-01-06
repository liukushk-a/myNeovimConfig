return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- what happens here is that diagnostics is connected to linters, where
				-- formatting is connected to formatters. So what you do is go into :Mason,
				-- the you install for instance for python black for linting and isort for
				-- formatting, then you close and reopen neovim and everything should be fine
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.diagnostics.mypy,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
