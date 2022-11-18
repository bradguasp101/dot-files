local lsp_handlers = {}

lsp_handlers.capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
lsp_handlers.capabilities.textDocument.completion.completionItem.snippetSupport = true

function lsp_handlers.on_attach(client, bufnr)
  local illuminate_ok, illuminate = pcall(require, 'illuminate')
  if illuminate_ok then
    illuminate.on_attach(client)
  end

  if client.name == 'sumneko_lua' then
    client.server_capabilities.documentFormattingProvider = false
  end

  if client.server_capabilities.documentFormattingProvider then
    vim.cmd('autocmd BufWritePost <buffer> lua vim.lsp.buf.format({ async = true })')
  end
end

return lsp_handlers
