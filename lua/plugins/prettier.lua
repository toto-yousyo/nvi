return {
  {
    'MunifTanjim/prettier.nvim',
    config = function()
      local status, prettier = pcall(require, "prettier")
      if (not status) then return end

      prettier.setup {
        bin = 'prettierd',
        filetypes = {
          "css",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "json",
          "scss",
          "less",
          "python",
          "liquid",
        }
      }
    end,
  },
}
