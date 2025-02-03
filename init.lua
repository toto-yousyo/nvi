-- lazy.nvim boot strap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- local plugins
local plugins = {
    { import = "plugins" },
}
vim.cmd('language en_US.UTF-8')
-- local opts
local opts = {
    root = vim.fn.stdpath("data") .. "/lazy",
    lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
    concurrency = 10,
    checker = { enabled = true },
    log = { level = "info" },
}

vim.opt.modifiable = true

-- leader key
vim.g.mapleader = " "
vim.g.python3_host_prog = "/Library/Python/3.12/bin/python3"
-- require core/ and user/
require("core.options")
require("core.autocmds")

-- lazy setup
require("lazy").setup(plugins, opts)
require("core.keymaps")
require("user.ui")

--clear notification
vim.api.nvim_set_keymap(
  'n', 
    '<leader>n', 
  '<cmd>lua require("notify").dismiss()<CR>', 
  { noremap = true, silent = true }
)
--disable netrw
vim.api.nvim_set_var('loaded_netrw', 1)
vim.api.nvim_set_var('loaded_netrwPlugin', 1)

-- toggleterm plus lazygit
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>l", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
