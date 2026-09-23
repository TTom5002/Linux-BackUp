local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Nastavení pluginů
require("lazy").setup({
  -- UI & Barvy
  { "echasnovski/mini.pick" },
  { "stevearc/oil.nvim", config = true },
  { "shaunsingh/nord.nvim" },
  { "bluz71/vim-nightfly-colors", name = "nightfly" },
  { "nvim-neo-tree/neo-tree.nvim", dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" } },
  { "akinsho/bufferline.nvim", config = true },

  -- LSP & Autocompletion
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp", dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
  }},

  -- Treesitter (náhrada za .withAllGrammars)
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  -- { "nvim-treesitter/nvim-treesitter-refactor" },
  { "windwp/nvim-ts-autotag", config = true },

  -- Debugging (DAP)
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
  { "theHamsta/nvim-dap-virtual-text", config = true },
  -- Pozn: nvim-dap-lldb je specifický, často se řeší přes nvim-dap přímo nebo mason.nvim

  -- Utility
  { "ap/vim-css-color" },
  { "mattn/emmet-vim" },
  { "windwp/nvim-autopairs", config = true },
  { "danymat/neogen", config = true },
  -- { "iamcco/markdown-preview.nvim", build = "cd app && npm install" },
  { "MeanderingProgrammer/render-markdown.nvim", config = true },

  {
    "DAmesberger/sc-im.nvim",
  }
})
