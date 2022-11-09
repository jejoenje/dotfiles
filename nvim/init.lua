require("keybindings")
require("options")
require("plugins")
require("cmp_config")
require("lsp_config")
require("telescope")
require("comment")

-- Disable inline diagnostics:
--vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

--vim.api.nvim_command([[ 
--  autocmd BufEnter * call ncm2#enable_for_buffer()
--  set completeopt=noinsert,menuone,noselect
--]])

