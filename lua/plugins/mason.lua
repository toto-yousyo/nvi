return {
    {
        'williamboman/mason.nvim',
        config = function()
        local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({

})
require('mason-lspconfig').setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = require('cmp_nvim_lsp').default
    }
  end,
}
lspconfig.setup {
  ensure_installed = {"tailwindcss" },
}
end,
},
}

