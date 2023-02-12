return {
  cmd = {require('kobra.config.lsp.data').path .. '/bin/docker-langserver', '--stdio'},
  root_dir = vim.loop.cwd,
}
