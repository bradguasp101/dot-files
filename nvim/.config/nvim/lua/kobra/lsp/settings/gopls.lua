return {
  cmd = {DATA_PATH .. '/lsp_servers/go/gopls'},
  settings = {
    gopls = {
      analyses = {unusedparams = true},
      staticcheck = true,
    },
  },
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
  },
}
