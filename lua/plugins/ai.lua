return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
		},
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
			{ "<S-C-u>", 		function() require("opencode").command("session.half.page.up") end,   desc = "Scroll OpenCode up",                 mode = "n" },
			{ "<S-C-d>", 		function() require("opencode").command("session.half.page.down") end, desc = "Scroll OpenCode down",               mode = "n" },
		},
	}
}
