return {
	{
		"zbirenbaum/copilot.lua",
		requires = {
			"copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
		},
		cmd = "Copilot",
	},
	{
		"nickjvandyke/opencode.nvim",
		version = "*", -- Latest stable release
		config = function()
			---@type opencode.Opts
			vim.g.opencode_opts = {
				-- Your configuration, if any; goto definition on the type for details
			}
		end,
		keys = {
			{ "<leader>aa", function() require("opencode").ask("@this: ") end,                    desc = "Ask Opencode",                       mode = { "n", "x" } },
			{ "<leader>as", function() require("opencode").select() end,                          desc = "Select Opencode Action",             mode = { "n", "x" } },
			{ "go",      		function() return require("opencode").operator("@this ") end,         desc = "Append range to OpenCode",           mode = { "n", "x" }, expr = true },
			{ "goo",     		function() return require("opencode").operator("@this ") .. "_" end,  desc = "Append line to OpenCode",            mode = "n", expr = true },
			{ "<S-C-u>", 		function() require("opencode").command("session.half.page.up") end,   desc = "Scroll OpenCode up",                 mode = "n" },
			{ "<S-C-d>", 		function() require("opencode").command("session.half.page.down") end, desc = "Scroll OpenCode down",               mode = "n" },
		},
	}
}
