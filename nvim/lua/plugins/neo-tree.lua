return{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
	config = function()
		-- setting keymaps for neo-tree (when you see <CR> is to instantly enter
		-- in the nvim command bar the comand you are writing)
		vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal left<CR>')
		vim.keymap.set('n', '<leader>r', ':Neotree close<CR>')
	end
}
