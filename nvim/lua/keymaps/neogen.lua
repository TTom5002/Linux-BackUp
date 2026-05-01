vim.keymap.set("n", "<leader>dc", function()
  require("neogen").generate()
end, { desc = "Generate documentation" })
