return {
	"mfussenegger/nvim-dap",
	dependencies = {
		-- nvim-dap-ui è per avere la finestrella grafica carina e nvim-nio è una sua dipendenza
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		-- devo anche installare il nvim-dap-python, il cui setup verrà poi chiamato in seguito,
		-- per "collegarlo" a quello di nvim-dap. Se hai dubbi sulla procedura da seguire, puoi
		-- vedere questo link: https://github.com/mfussenegger/nvim-dap-python. Io non ho compilato
		-- il parser ma ho usato treesitter, in particolare se vai dentro il plugin di treesitter,
		-- vedrai che c'è un require tree-sitter install con anche python
		"mfussenegger/nvim-dap-python",
	},

	-- to understand the keybindings, you should go check the github page of nvim-dap
	-- and in particulare inside doc/dap.txt
	config = function()
		local dap = require("dap")
		dap.adapters.python = function(cb, config)
			if config.request == "attach" then
				---@diagnostic disable-next-line: undefined-field
				local port = (config.connect or config).port
				---@diagnostic disable-next-line: undefined-field
				local host = (config.connect or config).host or "127.0.0.1"
				cb({
					type = "server",
					port = assert(port, "`connect.port` is required for a python `attach` configuration"),
					host = host,
					options = {
						source_filetype = "python",
					},
				})
			else
				cb({
					type = "executable",
					-- scrivo il percorso del python3 installato a livello di sistema, non una
					-- virtualenv come aveva fatto typecraft, perchè io ho deciso di installarlo
					-- a livello globale, perciò con sudo apt install python3-debugpy, cambia il
					-- comando che dice a che python devo puntare: non ad una venv, ma al python
					-- di sistema. Se preferisci usare una venv, dovrai cambiare questa riga
					-- con quella che ti lascio commentata sotto
					--command = "/home/liukushka/.virtualenvs/debugpy/bin/python3",
					command = "/usr/bin/python3",
					-- rispetto a ciò che avevo visto sulla pagina github di nvim-dap, quando ho
					-- installato il debugpy, se runno sul terminale: python3 -m debugpy --version,
					-- mi dice, testuali parole, di passare -Xfrozen_modules=off e così ho fatto
					args = { "-Xfrozen_modules=off", "-m", "debugpy.adapter" },
					options = {
						source_filetype = "python3",
					},
				})
			end
		end
		dap.configurations.python = {
			{
				-- The first three options are required by nvim-dap
				type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
				request = "launch",
				name = "Launch file",

				-- Options below are for debugpy, see
				-- https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

				program = "${file}", -- This configuration will launch the current file if used.
				pythonPath = function()
					-- debugpy supports launching an application with a different interpreter
					-- then the one used to launch debugpy itself.
					-- The code below looks for a `venv` or `.venv` folder in the current directly
					-- and uses the python within.
					-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
					local cwd = vim.fn.getcwd()
					if vim.fn.executable(cwd .. '/venv/bin/python3') == 1 then
						return cwd .. '/venv/bin/python3'
					elseif vim.fn.executable(cwd .. "/.venv/bin/python3") == 1 then
						return cwd .. "/.venv/bin/python3"
					else
						return "/usr/bin/python3"
					end
				end,
			},
		}

		local dapui = require("dapui")

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<leader>dbp", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
	end,
}
