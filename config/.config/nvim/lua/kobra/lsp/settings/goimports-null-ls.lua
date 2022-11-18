return function(source_name, methods)
  local null_ls = require('null-ls')
  null_ls.register(null_ls.builtins.formatting.goimports)
end
