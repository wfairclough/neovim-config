return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },

        pickers = {
          find_files = {
            hidden = true,
            git_ignore_files = false,
          },
          live_grep = {
            hidden = true,
          },
        }
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find Files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
      vim.keymap.set("n", "<leader>/", "<leader>fg", { desc="Live Grep", remap = true })
      vim.keymap.set("n", "<leader><space>", "<C-p>", { desc="Find Files", remap = true })
      vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent Files" })

      -- LSP Pickers
      vim.keymap.set("n", "<leader>ss", builtin.lsp_document_symbols, { desc = "Search Document symbols" })
      vim.keymap.set("n", "<leader>sS", builtin.lsp_workspace_symbols, { desc = "Search Workspace symbols" })
      vim.keymap.set("n", "<leader>sr", builtin.lsp_references, { desc = "Search References" })
      vim.keymap.set("n", "<leader>sd", builtin.lsp_definitions, { desc = "Search Definitions" })
      vim.keymap.set("n", "<leader>st", builtin.lsp_type_definitions, { desc = "Search Type Definitions" })
      vim.keymap.set("n", "<leader>si", builtin.lsp_implementations, { desc = "Search Implementations" })


      require("telescope").load_extension("ui-select")
    end,
  },
}
