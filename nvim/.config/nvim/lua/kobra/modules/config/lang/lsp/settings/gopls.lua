return {
  cmd = {require('kobra.config.lang.lsp.data').path .. '/bin/gopls'},
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
