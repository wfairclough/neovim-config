return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- Better and faster searching in telescope
    },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
          fzf = {},
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

      require("telescope").load_extension("fzf")

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find Files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
      vim.keymap.set("n", "<leader>/", "<leader>fg", { desc="Live Grep", remap = true })
      vim.keymap.set("n", "<leader><space>", "<C-p>", { desc="Find Files", remap = true })
      vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent Files" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })

      -- Find configuration files
      vim.keymap.set("n", "<leader>fc", function()
        builtin.find_files({
          prompt_title = "Find Neovim Config Files",
          cwd = vim.fn.stdpath("config"),
        })
      end, { desc = "Find Neovim Config Files" })
      vim.keymap.set("n", "<leader>fp", function()
        builtin.find_files({
          prompt_title = "Find Packages",
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
        })
      end, { desc = "Find Packages" })

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
