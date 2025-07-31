return {
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          separator_style = { " | ", " | " },
          diagnostics = "nvim_lsp",
          always_show_bufferline = true,
          color_icons = true,
          show_tab_indicators = true,
          show_close_icon = false,
        },
      })
      vim.keymap.set("n", "<C-t>", "<Cmd>BufferLineCycleNext<CR>", {})
    end,
  },
}
