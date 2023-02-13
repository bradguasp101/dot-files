return {
  cmd = {require('kobra.config.lang.lsp.data').path .. '/bin/docker-langserver', '--stdio'},
  root_dir = vim.loop.cwd,
}
