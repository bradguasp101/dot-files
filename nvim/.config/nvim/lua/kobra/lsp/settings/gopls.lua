return {
  cmd = {DATA_PATH .. '/mason/bin/gopls'},
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
