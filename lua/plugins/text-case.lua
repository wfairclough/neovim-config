return {
	{
		"johmsalas/text-case.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("textcase").setup({})
			require("telescope").load_extension("textcase")
		end,
		keys = {
			"ga", -- Default invocation prefix
			{ "<leader>tc", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Text Case Floating Window" },
		},
	},
}
