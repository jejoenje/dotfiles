-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['sumneko_lua'].setup {
  capabilities = capabilities
}
require('lspconfig')['r_language_server'].setup{}

-- LSP config
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}
  server:setup(opts)
end)
