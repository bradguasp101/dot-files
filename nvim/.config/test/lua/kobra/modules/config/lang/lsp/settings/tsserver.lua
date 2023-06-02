return {
  cmd = {require('kobra.modules.config.lang.lsp.data').path .. '/bin/typescript-language-server', '--stdio'},
  filetypes = {'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx'},
  root_dir = require('lspconfig/util').root_pattern('package.json', 'tsconfig.json', 'jsconfig.json', '.git'),
  settings = {
    documentFormatting = true,
    maxTsServerMemory = 4096,
    preferences = {
      quotePreference = 'single',
    },
  },
  handlers = {
    ['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = {spacing = 0, prefix = ""},
      signs = true,
      underline = true,
      update_in_insert = true,
    }),
  },
}
