<<<<<<< HEAD
vim.opt.backup = false 	          -- creates a backup file
=======
vim.opt.backup = false            -- creates a backup file
>>>>>>> 5d1a6ea (Backup)
vim.opt.clipboard = "unnamedplus" -- allows neovim to acces the system clipboard
vim.opt.fileencoding = "utf-8"    -- the encdoing written to a file
vim.opt.mouse = "a"               -- allow the mouse to be used in neovim
vim.opt.showtabline = 2           -- always show tab
vim.opt.splitbelow = true         -- force all horizontal splits to go bellow current window
vim.opt.splitright = true         -- force all vertical splits to go right of current window
vim.opt.swapfile = false          -- creates a swapfile
<<<<<<< HEAD
vim.opt.undofile = true           -- enable persistent undo 
=======
vim.opt.undofile = true           -- enable persistent undo
>>>>>>> 5d1a6ea (Backup)
vim.opt.writebackup = false       -- if a file is being edited by another program, it creates a backup file
vim.opt.expandtab = true          -- converts to spaces
vim.opt.shiftwidth = 2            -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2               -- insert 2 spaces for a tab
<<<<<<< HEAD
vim.opt.cursorline = true         -- highlight the current line 
=======
vim.opt.cursorline = true         -- highlight the current line
>>>>>>> 5d1a6ea (Backup)
vim.opt.number = true             -- set numbered lines
vim.opt.relativenumber = true     -- set relative numbered line
vim.opt.wrap = false              -- break a text if it is out of window
vim.opt.ruler = false             -- show current line number at bottom right of the screen
<<<<<<< HEAD
vim.opt.termguicolors = true      -- set term gui colors 
vim.opt.virtualedit = all         -- move up and down in the same column 
-- vim.opt.formatoptions:remove { "c", "r", "o" }       -- influence how Vim formats text - DOESNT WORK
vim.api.nvim_create_autocmd('BufWinEnter', {
    command = 'set formatoptions-=cro',
})                                -- do not create automatically comments
vim.opt.winborder = "rounded"     -- makes floating windows round
vim.opt.signcolumn = "yes"        -- adds extra column for signs

vim.cmd [[set iskeyword+=-]]      -- join words seperated by '-' into one word
=======
vim.opt.termguicolors = true      -- set term gui colors
vim.opt.virtualedit = all         -- move up and down in the same column
-- vim.opt.formatoptions:remove { "c", "r", "o" }       -- influence how Vim formats text - DOESNT WORK
vim.api.nvim_create_autocmd('BufWinEnter', {
  command = 'set formatoptions-=cro',
})                                           -- do not create automatically comments
vim.opt.winborder = "rounded"                -- makes floating windows round
vim.opt.signcolumn = "yes"                   -- adds extra column for signs

vim.cmd [[set iskeyword+=-]]                 -- join words seperated by '-' into one word

vim.api.nvim_create_autocmd("BufReadPost", { -- remember cursor position
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
>>>>>>> 5d1a6ea (Backup)
