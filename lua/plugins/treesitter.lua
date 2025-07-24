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
          "json",
          "lua",
          "markdown",
          "python",
          "rust",
          "sql",
          "ssh_config",
          "toml",
          "vim",
          "xml",
          "yaml",
          "vimdoc",
        },
        ignore_install = {
          "org",
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
