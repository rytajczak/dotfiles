return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    open_mapping = [[<C-t>]],
    shell = "fish",
    direction = "float"
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)
  end
}
