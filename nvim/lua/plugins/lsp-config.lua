return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		config = function()
			-- necessary for snippets
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "bashls", "copilot", "ruff" },
				vim.keymap.set("n", "K", vim.lsp.buf.hover, {}),
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, {}),
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {}),
				vim.keymap.set({ "n", "v" }, "<leader>gr", vim.lsp.buf.references, {}),
			})
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("pyright")
			vim.lsp.enable("bashls")
			vim.lsp.enable("copilot")
			vim.lsp.enable("ruff")

			-- for the part where typecraft uses the capabilities, the syntax he used is deprecated, so I changed it to this one that I hope is fine, but as usual, no guarantees whatsoever. As I was concerned, it does not work, so... whatever.
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})
			vim.lsp.config("pyright", {
				capabilities = capabilities,
			})
			vim.lsp.config("bashls", {
				capabilities = capabilities,
			})
			vim.lsp.config("copilot", {
				capabilities = capabilities,
			})
			vim.lsp.config("ruff", {
				capabilities = capabilities,
			})
		end,
	},
}

-- ciò che ho fatto io è stato fare ciò che aveva fatto typecraft, ma senza fare il return anche di nvim-lspconfig, perchè come c'è scritto sul github, quella sintassi è stata deprecata, perciò facendo delle prove sono arrivato a questa versione che funziona, però è da notare che non è come aveva mostrato lui, quindi è sempre tutto da prendere con le pinze.
