return {
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require("mini").setup()
    end,
  },

  {
    "echasnovski/mini.ai",
    dependencies = {
      "echasnovski/mini.nvim",
    },
    version = false,
    config = function()
      require("mini.ai").setup()
    end,
  },
  {
    "echasnovski/mini.surround",
    version = "*",
    config = function()
      require("mini.surround").setup()
    end,
  },
}
