return {
  {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufRead", "BufNewFile", "InsertEnter" },
  build = ":TSUpdate",
  config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
          ensure_installed = {
              "bash",
              "comment",
              "css",
              "csv",
              "diff",
              "html",
              "javascript",
              "typescript", 
              "tsx", 
              "json",
              "lua",
              "markdown",
              "python",
              "sql",
              "toml",
              "vim",
              "xml",
              "yaml",
              "regex",
          },
        contenxt_commentstring = {
          enabel = true, 
          enabel_autocmd = false, 
        }, 
        sync_install = false,
        auto_install = true,
--         highlight = { enable = true },
        indent = { enable = true },
      })
  end,
},
}
