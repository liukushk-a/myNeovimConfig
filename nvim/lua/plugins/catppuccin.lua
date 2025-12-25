return{
	"catppuccin/nvim",
	name = "catpuccin",
	priority = 1000,
	lazy = false,
	config = function()
		-- setting catppuccin as default colorscheme
		require("catppuccin").setup()
		vim.cmd.colorscheme "catppuccin"
	end
}
