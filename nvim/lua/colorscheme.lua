-- vim.cmd "colorscheme default"

<<<<<<< HEAD
local colorscheme = "default"
=======
local colorscheme = "nightfly"
>>>>>>> 5d1a6ea (Backup)

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme" .. colorscheme .. " not found!")
  return
end
