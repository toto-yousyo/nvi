return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "williamboman/mason.nvim",
    "jay-babu/mason-null-ls.nvim", -- これが後継プラグイン
  },
  config = function()
    local null_ls = require("null-ls")

    -- Mason と none-ls の統合
    require("mason-null-ls").setup({
      ensure_installed = {
        -- 必要なツールを指定
        "prettier",
        "eslint_d",
        "stylua",
        -- 他の必要なツール
      },
      automatic_installation = false,
    })

    null_ls.setup({
      sources = {
        -- 既存の sources 設定
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.stylua,
      },
    })
  end,
}
