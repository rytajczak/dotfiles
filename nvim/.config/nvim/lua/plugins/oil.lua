return {
  {
    'stevearc/oil.nvim',
    opts = {
      default_file_explorer = true,
      vim.keymap.set("n", "e", "<CMD>Oil --float<CR>", { desc = "Open parent directory" }),
      float = {
        -- Padding around the floating window
        padding = 2,
        max_width = 40,
        max_height = 20,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
        -- preview_split: Split direction: "auto", "left", "right", "above", "below".
        preview_split = "auto",
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        override = function(conf)
          return conf
        end,
      },
    },
    -- Optional dependencies
    dependencies = { "echasnovski/mini.icons" },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  }
}
