return {
  {
    -- vim-multi-cursor
    "mg979/vim-visual-multi",
    config = function()
      vim.g.VM_maps = {
        select_next = "<C-n>",
        select_prev = "<C-p>",
        add_cursor_on_click = false,
      }
    end,
  }
}
