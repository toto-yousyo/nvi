return {
  { "jose-elias-alvarez/null-ls.nvim", event = "BufReadPre" },
  { "jay-babu/mason-null-ls.nvim",  event = { "BufReadPre", "BufNewFile" }, 
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.stylua,
      },
      on_attach = function(client, bufnr)
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr, 
            callback = function()
            vim.lsp.buf.format({ bufnr = bufnr})
              end, 
            })
        end
      end,
    })
    require("mason-null-ls").setup({
      handlers = {},
    })
  end,
},
}
