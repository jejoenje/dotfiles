require("keybindings")
require("options")
require("plugins")

-- LSP config
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}
  server:setup(opts)
end)
-- Disable inline diagnostics:
--vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

--vim.api.nvim_command([[ 
--  autocmd BufEnter * call ncm2#enable_for_buffer()
--  set completeopt=noinsert,menuone,noselect
--]])

