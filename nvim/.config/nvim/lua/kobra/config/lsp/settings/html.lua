return {
  cmd = {
    'node', require('kobra.config.lsp.data').path .. '/bin/vscode-html-language-server',
    '--stdio',
  },
}
