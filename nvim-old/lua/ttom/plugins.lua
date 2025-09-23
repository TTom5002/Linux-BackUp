local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer, close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer =  pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
   display = {
     open_fn = function()
       return require("packer.util").float { border = "rounded" }
     end,
   },
 }

-- Installed plugins 
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by a lots of plugins

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- Buffer completions
  use "hrsh7th/cmp-path" -- Path completions
  use "hrsh7th/cmp-cmdline" -- Cmdline completions
  use "hrsh7th/cmp-nvim-lua" -- Nvim completions
  use "hrsh7th/cmp-nvim-lsp" -- Nvim completions
  use "saadparwaiz1/cmp_luasnip" -- Snippet completions

  -- highlight
  use "RRethy/vim-illuminate"
  
  -- snippets
  use "L3MON4D3/LuaSnip" -- Snippet engine
  use "rafamadriz/friendly-snippets" -- A bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- snippet engine
  use "williamboman/mason.nvim" 
  use "williamboman/mason-lspconfig.nvim"
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

end)
