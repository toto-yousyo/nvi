local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

--local keymap = vim.keymap
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- New tab
keymap("n", "te", ":tabedit", opts)
keymap("n", "gn", ":tabnew<Return>", opts)
-- move tab
keymap("n", "gh", "gT", opts)
keymap("n", "gl", "gt", opts)

-- Split window
keymap("n", "ss", ":split<Return><C-w>w", opts)
keymap("n", "sv", ":vsplit<Return><C-w>w", opts)

keymap("n", "<ca>", "gg<S-v>G", opts)

keymap("n", "x", '"_x', opts)

keymap("n", "dw", 'vb"_d', opts)

keymap("n", "<Space>h", "^", opts)
keymap("n", "<Space>l", "$", opts)

keymap("n", ";", ":", opts)

keymap("n", "Y", "y$", opts)

keymap("n", "<Space>q", ":<C-u>q!<Return>", opts)

keymap("n", "<Esc><Esc>", ":<C-u>set nohlsearch<Return>", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)

keymap("i", ",", ",<Space>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("v", "v", "$h", opts)

keymap("v", "<C-p>", '"0p', opts)

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

vim.keymap.set("n", "<C-n>", ":bnext<Return>", opts)
vim.keymap.set("n", "<C-p>", ":bprevious<Return>", opts)
