return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavor = "mocha",
    transparent_background = true,
    integrations = {
      cmp = true,
      treesitter = true,
      harpoon = true
    }
  },
  sitter = true,
  config = function(_, opts)
    require("catppuccin").setup(opts)
  end
}
