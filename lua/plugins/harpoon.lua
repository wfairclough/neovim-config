return {

  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("harpoon").setup({
      -- global_settings = {
      --   save_on_toggle = true,
      --   save_on_change = true,
      -- },
    })

    vim.keymap.set("n", "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", { desc = "Harpoon" })
    vim.keymap.set("n", "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<CR>", { desc = "Harpoon Mark" })

  end,

};
