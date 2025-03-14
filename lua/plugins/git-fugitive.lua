return {
  {
    "tpope/vim-fugitive",
    event = "BufWinEnter",
    config = function()
      vim.keymap.set('n', '<leader>gf', ':G<CR>')  -- Opens fugitive status window
    end,
  },
}
