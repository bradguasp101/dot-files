-- local lspconfig = require('lspconfig')
-- local configs = require('lspconfig/configs')
-- local lsp = require('vim.lsp')

-- lsp not included in lspconfig

M = {}

M.setup = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  -- configs not included in lspconfig
end

return M
