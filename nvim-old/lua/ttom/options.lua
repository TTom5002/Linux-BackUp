vim.opt.backup = false 	          -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to acces the system clipboard
vim.opt.fileencoding = "utf-8"    -- the encdoing written to a file
vim.opt.mouse = "a"               -- allow the mouse to be used in neovim
vim.opt.showtabline = 2           -- always show tab
vim.opt.splitbelow = true         -- force all horizontal splits to go bellow current window
vim.opt.splitright = true         -- force all vertical splits to go right of current window
vim.opt.swapfile = false          -- creates a swapfile
vim.opt.undofile = true           -- enable persistent undo 
vim.opt.writebackup = false       -- if a file is being edited by another program, it creates a backup file
vim.opt.expandtab = true          -- converts to spaces
vim.opt.shiftwidth = 2            -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2               -- insert 2 spaces for a tab
vim.opt.cursorline = true         -- highlight the current line 
vim.opt.number = true             -- set numbered lines
vim.opt.relativenumber = true     -- set relative numbered line
vim.opt.wrap = true               -- break a text if it is out of window
vim.opt.ruler = false             -- show current line number at bottom right of the screen
vim.opt.termguicolors = true      -- set term gui colors 
vim.opt.virtualedit = all         -- move up and down in the same column 
-- vim.opt.formatoptions:remove { "c", "r", "o" }       -- influence how Vim formats text - DOESNT WORK
vim.api.nvim_create_autocmd('BufWinEnter', {
    command = 'set formatoptions-=cro',
})                                -- do not create automatically comments
vim.opt.winborder = "rounded"     -- makes floating windows round
vim.opt.signcolumn = "yes"        -- adds extra column for signs

vim.cmd [[set iskeyword+=-]]      -- join words seperated by '-' into one word
