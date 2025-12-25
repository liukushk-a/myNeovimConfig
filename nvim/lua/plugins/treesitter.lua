return{
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		-- treesitter config (see typecraft video, if confused). Since its way does not work, I'm
		-- following the way on the page of the plugin, so it actually works
		--config = function()
		--local config = require("nvim-treesitter.configs")
		--config.setup{
		--	ensure_installed = {"lua", "python", "foam"},
		--  	highlight = { enable = true },
		--  	indent = { enable = true },
			--}
		--end
		--
		--This down here is another way to do what typecraft used to do in his way... I think
		--that the upgrade from the master branch to the main branch may have changed some
		--things, so it is logical that something may be different
		require'nvim-treesitter'.setup {
		  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
		  install_dir = vim.fn.stdpath('data') .. '/site',
		}
		-- now the actual install of the languages (it does nothing if they are already installed)
		require'nvim-treesitter'.install { 'python', 'foam', 'bash', 'c', 'cpp', 'vim', 'lua', 'markdown', 'csv' }
		-- now, to enable the highlighting for a certain language you create the folder ftplugin inside .config/nvim
		-- and inside the folder, generate a .lua file named after the language you want highlighting for
		-- and inside each file, all you have to do is paste this line:
		-- vim.treesitter.start()
		-- same thing for indentation, in the same files, you paste this:
		-- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end
}
