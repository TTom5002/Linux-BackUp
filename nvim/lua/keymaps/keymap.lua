local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--  normal_mode = "n"
--  insert_mode = "i"
--  visual_mode = "v"
--  visual_block_mode = "x"
--  term_mode = "t"
--  command_mode = "c"

-- Normal --

-- Better mapping for actions 
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)

-- Explore 
local ok, _ = pcall(require, "neo-tree")
if ok then
  keymap("n", "<leader>e", ":Neotree toggle<CR>", opts) -- Neotree plugin
else
  keymap("n", "<leader>e", ":Ex 30<CR>", opts) -- Original nvim
end

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- LSP
keymap("n", "<leader>lf", ":lua vim.lsp.buf.format()<CR>", opts)
-- vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

-- Mini.pick
keymap("n", "<leader>f", ":Pick files<CR>", opts)
keymap("n", "<leader>h", ":Pick help<CR>", opts)

-- Bufferline
keymap("n", "cx", ':bd<CR>', { desc = "Closes current tab" }) -- Closes current tab

-- Insert --
-- Press XX fast to exit
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Yanking and pasting over another word, keeps yanked word in buffer
keymap("v", "p", '"_dP', opts)
