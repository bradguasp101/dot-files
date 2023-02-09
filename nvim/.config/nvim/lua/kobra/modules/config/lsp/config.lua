local M = {}

M.servers = {
  'bashls',
  'clangd',
  'cmake',
  'cssls',
  'dockerls',
	'gopls',
  'html',
	'jsonls',
  'kotlin_language_server',
  'pyright',
  'rust_analyzer',
  'solargraph',
	'sumneko_lua',
  'texlab',
  'tsserver',
  'vimls',
  'yamlls',
  'bufls',
}

M.sources = {
  'codespell',
  'misspell',
  'revive',
  'goimports',
  'shfmt',
}

M.setup_mason = function()
  require('mason').setup({
    install_root_dir = require('kobra.modules.config.lsp.data').path,
    ui = {
      icons = {
        package_installed = '✓',
        package_pending = '➜',
        package_uninstalled = '✗',
      },
    },
  })
end

M.setup_mason_lsp = function()
  require('mason-lspconfig').setup({
    ensure_installed = M.servers,
    automatic_installation = true,
  })
end

M.setup_mason_null = function()
  require('mason-null-ls').setup({
    ensure_installed = M.sources,
  })

  local handlers = {}
  for _, source in ipairs(M.sources) do
    local require_ok, handler = pcall(require, 'kobra.modules.config.lsp.null.' .. source)
    if require_ok then
      handlers[source] = handler
    end
  end

  require('mason-null-ls').setup_handlers(handlers)
end

M.setup_null = function()
  local null_ls = require('null-ls')
  local code_actions = null_ls.builtins.code_actions
  local diagnostics = null_ls.builtins.diagnostics
  local formatting = null_ls.builtins.formatting

  require('null-ls').setup({
    sources = {
      code_actions.refactoring,
      diagnostics.tsc,
      formatting.gofmt,
    }
  })
end

return M
