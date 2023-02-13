return {
  cmd = {
    'node', require('kobra.config.lang.lsp.data').path .. '/bin/vscode-html-language-server',
    '--stdio',
  },
}
