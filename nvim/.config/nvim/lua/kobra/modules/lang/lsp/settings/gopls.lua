return {
  cmd = {require('kobra.modules.lang.lsp.data').path .. '/bin/gopls'},
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
