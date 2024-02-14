return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      -- lspconfig.tsserver.setup({
      --   capabilities = capabilities
      -- })
      lspconfig.angularls.setup({
        capabilities = capabilities
      })
      lspconfig.bashls.setup({
        capabilities = capabilities
      })
      lspconfig.cssls.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.jsonls.setup({
        capabilities = capabilities
      })
      lspconfig.emmet_ls.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
      vim.keymap.set("n", "gd", function ()
        vim.lsp.buf.definition()
        vim.cmd("norm! zz")
      end, { desc = "Go to definition" })
      vim.keymap.set("n", "<leader>gd", "gd", { desc = "Go to definition", remap = true })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to references" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
      vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
      vim.keymap.set("n", "<leader>ct", vim.lsp.buf.type_definition, { desc = "Type definition" })
      -- Search
      vim.keymap.set("n", "<leader>ss", vim.lsp.buf.document_symbol, { desc = "Document symbols" })
      vim.keymap.set("n", "<leader>sS", vim.lsp.buf.workspace_symbol, { desc = "Workspace symbols" })

      -- LSP CMD Shortcuts
      vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = "Restart LSP" })
      vim.keymap.set("n", "<leader>lR", "<cmd>LspStop<CR>", { desc = "Stop LSP" })
      vim.keymap.set("n", "<leader>la", "<cmd>LspStart<CR>", { desc = "Start LSP" })
      vim.keymap.set("n", "<leader>lI", "<cmd>LspInfo<CR>", { desc = "LSP Info" })
      vim.keymap.set("n", "<leader>lo", "<cmd>LspLog<CR>", { desc = "LSP Log" })
    end,
  },
  
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  }

}

