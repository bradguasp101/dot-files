return {
  cmd = {require('kobra.modules.config.lang.lsp.data').path .. '/bin/solargraph', '--stdio'},
  handlers = {
    ['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = {spacing = 0, prefix = ''},
      signs = true,
      underline = true,
      update_in_insert = true,
    }),
  },
  filetypes = {'rb', 'erb', 'rakefile'},
}
