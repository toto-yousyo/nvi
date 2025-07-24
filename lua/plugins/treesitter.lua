return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "BufNewFile", "InsertEnter" },
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = "all",
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
