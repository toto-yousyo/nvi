return {
  'JoosepAlviste/nvim-ts-context-commentstring',
  lazy = true,
  event = "InsertEnter",
  config = function ()
    vim.g.skip_ts_context_commentstring_module = true
    require("ts_context_commentstring").setup {
      enable_autocmd = false,
    }
  end
}
