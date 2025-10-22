MiniDeps.add({ source = "nmac427/guess-indent.nvim" })
MiniDeps.add({ source = "windwp/nvim-autopairs" })
MiniDeps.add({ source = "chrisgrieser/nvim-origami" })

require("guess-indent").setup()
-- require("nvim-autopairs").setup()
require("origami").setup()
