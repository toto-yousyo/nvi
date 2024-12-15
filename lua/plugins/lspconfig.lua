return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- Ruff setup
      require('lspconfig').ruff.setup({
        on_attach = function(client, bufnr) 
          -- Format on save
          if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = true })
              end,
            })
          end
        end,
        init_options = {
          settings = {
            ruff = {
              enable = true,
              lint = {
                enable = true,
                onOpen = true,
                onSave = true,
                ignore = { "W291", "E501", "E402" },  --whitespace after comma and long line string
              },
              format = {
                enable = true,
                onOpen = true,
                onSave = true,
              },
            },
          },
        },
      })
      -- TypeScript Server Setup
      require('lspconfig').ts_ls.setup({
        on_attach = on_attach,
        filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
        cmd = { "typescript-language-server", "--stdio" },
      })
    end,
  },
}
