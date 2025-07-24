return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      local status, nvim_lsp = pcall(require, "lspconfig")
      if not status then
        vim.notify("Failed to load lspconfig", vim.log.levels.ERROR)
        return
      end

      local protocol = require('vim.lsp.protocol')

      local on_attach = function(client, bufnr)
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
      end

      -- TypeScript Server Setup
      nvim_lsp.ts_ls.setup({
        on_attach = on_attach,
        filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
        cmd = { "ts_ls", "--stdio" },
      })
    end,
  },
}
