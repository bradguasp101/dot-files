local config = require('kobra.config.lsp.config')
local handlers = require('kobra.config.lsp.handlers')
local lspconfig = require('lspconfig')

config.setup_mason()
config.setup_mason_lsp()
config.setup_mason_null()
config.setup_null()

local opts = {}

for _, server in pairs(config.servers) do
  opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
  }

  server = vim.split(server, '@')[1]

  local require_ok, conf_opts = pcall(require, 'kobra.config.lsp.settings.' .. server)
  if require_ok then
    opts = vim.tbl_deep_extend('force', conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end

-- change the border of the hover window
local border = {
  {'┏', 'FloatBorder'},
  {'━', 'FloatBorder'},
  {'┓', 'FloatBorder'},
  {'┃', 'FloatBorder'},
  {'┛', 'FloatBorder'},
  {'━', 'FloatBorder'},
  {'┗', 'FloatBorder'},
  {'┃', 'FloatBorder'},
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, options, ...)
  options = options or {}
  options.border = options.border or border
  return orig_util_open_floating_preview(contents, syntax, options, ...)
end
