return {
  cmd = {
    'node', require('kobra.modules.config.lsp.data').path .. '/bin/vscode-html-language-server',
    '--stdio',
  },
}
