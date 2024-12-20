return {
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
      require("oil").setup({
        default_file_explorer = true,
        keymaps = {
          ["<C-r>"] = "actions.refresh",
          ["<C-p>"] = { "actions.preview", opts = { vertical = true, split = "botright" } },
          ["<S-h>"] = { "actions.toggle_hidden", mode = "n" },
        },
        float = {
          padding = 6,
        }
      })


      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
      vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
    end
	},
}
