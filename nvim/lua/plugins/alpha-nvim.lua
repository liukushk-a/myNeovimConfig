return {
  "goolord/alpha-nvim",
  dependencies = {
    "echasnovski/mini.icons",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
	  [[ 																													    ]],
	  [[ 																													    ]],
	  [[| 							  ██╗  ██╗  █████╗  ██╗      ██╗   ██╗ ██╗██╗ ██╗ ███╗   ███╗ 							   |]],
	  [[| 							  ██║ ██╔╝ ██╔══██╗ ██║      ██║   ██║ ██║██║ ██║ ████╗ ████║ 							   |]],
	  [[| 							  █████╔╝  ███████║ ██║      ██║   ██║ ██║██║ ██║ ██╔████╔██║ 							   |]],
	  [[| 							  ██╔═██╗  ██╔══██║ ██║      ██║   ██║ ██ ██║ ██║ ██║╚██╔╝██║ 							   |]],
	  [[| 							  ██║  ██╗ ██║  ██║ ███████╗ ╚██████╔╝ ╚███╔╝ ██║ ██║ ╚═╝ ██║ 							   |]],
	  [[| 							  ╚═╝  ╚═╝ ╚═╝  ╚═╝ ╚══════╝  ╚═════╝   ╚══╝  ╚═╝ ╚═╝     ╚═╝ 							   |]],
    }

	-- The followinf configuration things were retireved from the LazyVim UI dashboard.nvim page, at this link https://www.lazyvim.org/plugins/ui and from a guy I found on GitHub, at this link https://github.com/goolord/alpha-nvim/discussions/16
	-- To search for the icons I used the Nerd Font cheat sheet, at this link https://www.nerdfonts.com/cheat-sheet
	
	-- I'm not too expert about this, but basically the dashboard.section.buttons.val is a table that contains the buttons that will be displayed on the dashboard, and each button is created using the dashboard.button function, which takes three arguments: the first one is the key that will be used to trigger the button, the second one is the label that will be displayed on the button, and the third one is the command that will be executed when the button is triggered. The<CR> at the end of the command is used to execute the command immediately after it is triggered. 

	-- Set menu
	dashboard.section.buttons.val = {
		dashboard.button( "n", "  	 New File" , ":ene <BAR> startinsert <CR>"),
		dashboard.button( "f", "  	 Find File", ":cd | Telescope find_files<CR>"),
		dashboard.button( "g", "  	 Live Grep", ":cd | Telescope live_grep<CR>"),
		dashboard.button( "r", "  	 Recent Files"   , ":Telescope oldfiles<CR>"),
		dashboard.button( "c", "  	 NVIM config" , ":cd | :cd .config/nvim<CR> | :Neotree filesystem reveal left<CR>"),
		dashboard.button( "l", "󰒲  	 Lazy", ":Lazy<CR>"),
		dashboard.button( "q", "󰩈  	 Quit NVIM", ":qa<CR>"),
	}

    -- send config to alpha
	alpha.setup(dashboard.opts)
  end,
}
