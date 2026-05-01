require("mini.pick").setup()
-- require("oil").setup()
require("plugins.dap")
require("plugins.treesitter")
require("nvim-autopairs").setup()
require("neogen").setup({ snippet_engine = "luasnip" })
require("nvim-ts-autotag").setup()
require("render-markdown").setup()
require("bufferline").setup()

require("neo-tree").setup({
  -- action = "focus",
  -- tab = {
  --   sync = {
  --     open = true
  --   }
  -- },
})
