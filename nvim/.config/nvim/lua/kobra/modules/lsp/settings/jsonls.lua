return {
  cmd = {
    'node', require('kobra.config.lsp.data').path .. '/bin/vscode-json-language-server',
    '--stdio',
  },
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
      end
    },
  },
}
