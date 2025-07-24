return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup()
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new {
      cmd = 'lazygit',
      direction = 'float',
      hidden = true,
    }
    vim.keymap.set({ 'n', 't' }, '<leader>p', function()
      lazygit:toggle()
    end, { desc = 'Toggle Lazygit (float)' })
  end,
}
