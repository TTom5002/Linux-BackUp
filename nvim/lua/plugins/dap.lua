local dap = require("dap")
dap.adapters.lldb = {
  type = 'executable',
  command = '/home/tomast/.nix-profile/bin/lldb-dap',
  name = 'lldb',
  env = { LLDB_LAUNCH_IN_TTY = "YES" },
}

dap.configurations.cpp = {
  {
    name = "C++ program",
    type = "lldb",
    request = "launch",
    program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = vim.fn.getcwd(),
    stopOnEntry = false,
    args = function()
      local input = vim.fn.input('Program arguments: ')
      return vim.split(input, " ")
    end,
    runInTerminal = true,
  },
}

dap.configurations.c = dap.configurations.cpp

require "dapui".setup()

require("nvim-dap-virtual-text").setup({
  enabled = true,
  commented = true,
  only_first_definition = false,
  all_references = true,
})
