local export = {}

local null_ls = require('null-ls')
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

function export.setup()
  null_ls.setup({
    sources = {
      code_actions.refactoring,
      diagnostics.tsc,
      formatting.gofmt,
    },
  })
end

return export
