return {
  {
    "akinsho/bufferline.nvim", 
    config = function()
    require("bufferline").setup({
       options = {
         mode = "tabs", 
         separator_style = 'slant', 
         always_show_bufferline = true, 
         color_icons = true
       }, 
    })

    vim.keymap.set('n', '<C-t>', '<Cmd>BufferLineCycleNext<CR>', {})
  end 
  } 
}
