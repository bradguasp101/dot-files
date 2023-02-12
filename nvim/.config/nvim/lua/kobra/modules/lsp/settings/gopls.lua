return {
  cmd = {require('kobra.config.lsp.data').path .. '/bin/gopls'},
  settings = {
    gopls = {
      directoryFilters = {
        '-**/plz-out',
        '-**/node_modules',
      },
    },
  },
  init_options = {
    completeUnimported = true,
  },
}
