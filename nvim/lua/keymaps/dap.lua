local status_ok, dap = pcall(require, "dap")
if not status_ok then
  vim.notify("Dap not loaded")
  return
end

local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

keymap('n', '<F5>', function() dap.continue() end, opts)
keymap('n', '<F10>', function() dap.step_over() end, opts)
keymap('n', '<F11>', function() dap.step_into() end, opts)
keymap('n', '<F12>', function() dap.step_out() end, opts)
keymap('n', '<Leader>b', function() dap.toggle_breakpoint() end, opts)
keymap('n', '<Leader>B', function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end, opts)

local status_ui, dapui = pcall(require, "dapui")
if status_ui then
  keymap('n', '<Leader>du', function() dapui.toggle() end, opts)
end
