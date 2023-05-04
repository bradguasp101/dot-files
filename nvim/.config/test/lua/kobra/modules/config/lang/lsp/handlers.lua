local handlers = {}

local navic = require('nvim-navic')
local navbuddy = require('nvim-navbuddy')

handlers.capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
handlers.capabilities.textDocument.completion.completionItem.snippetSupport = true

function handlers.on_attach(client, bufnr)
  require('illuminate').on_attach(client)

  if client.name == 'lua_ls' then
    client.server_capabilities.documentFormattingProvider = false
  end

  if client.server_capabilities.documentFormattingProvider then
    vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = true })]])
  end

  if client.name ~= 'null-ls' and client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end

  navbuddy.attach(client, bufnr)
end

return handlers
