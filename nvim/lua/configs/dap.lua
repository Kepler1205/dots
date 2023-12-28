-- neodev
require("neodev").setup({
	libaray = {plugins = { "nvim-dap-ui" }, types = true},
})

-- dap
local dap = require("dap")

dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/codelldb",
		args = {"--port","${port}"}
	}
}

dap.configurations.c = {
	{
		type = "codelldb",
		request = "launch",
		name = "Launch",
		program = function ()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false
	}
}

-- rust is using rust-tools, config is in langs.lua
dap.configurations.cpp = dap.configurations.c

-- nv-dap-ui
local dapui = require("dapui")
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
