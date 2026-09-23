return {
  -- Hlavní Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim", "cpp", "c" }, -- přidej co potřebuješ
        highlight = { enable = true },
      })
    end,
  },

  -- Refactor plugin (teď s definovanou závislostí)
  {
    "nvim-treesitter/nvim-treesitter-refactor",
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- KLÍČOVÝ ŘÁDEK
  },
}
