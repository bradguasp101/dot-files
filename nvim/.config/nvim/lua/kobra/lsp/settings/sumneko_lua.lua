local root_path = DATA_PATH .. '/lsp_servers/sumneko_lua'
local binary = root_path .. '/extension/server/bin/lua-language-server'

return {
  cmd = {binary, '-E', root_path .. '/main.lua'},
  settings = {
    LUA = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';')
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
        maxPreload = 10000,
      },
    },
  },
}
