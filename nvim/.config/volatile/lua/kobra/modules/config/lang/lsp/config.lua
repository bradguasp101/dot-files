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
  'lua_ls',
  'texlab',
  'tsserver',
  'vimls',
  'yamlls',
  -- 'bufls',
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
    install_root_dir = require('kobra.modules.config.lang.lsp.data').path,
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
  local handlers = {}
  for _, source in ipairs(M.sources) do
    local require_ok, handler = pcall(require, 'kobra.modules.config.lang.lsp.null.' .. source)
    if require_ok then
      handlers[source] = handler
    end
  end

  require('mason-null-ls').setup({
    ensure_installed = M.sources,
    handlers = handlers,
  })
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

M.setup_navbuddy = function()
  local actions = require('nvim-navbuddy.actions')
  local config = {}

  if COLEMAK then
    config.use_default_mappings = false
    config.mappings = {
      ['<esc>'] = actions.close,
      q = actions.close,

      n = actions.next_sibling,
      e = actions.previous_sibling,
      h = actions.parent,
      i = actions.children,
      ['0'] = actions.root,

      v = actions.visual_name,
      V = actions.visual_scope,

      y = actions.yank_name,
      Y = actions.yank_scope,

      l = actions.insert_name,
      L = actions.insert_scope,

      a = actions.append_name,
      A = actions.append_scope,

      r = actions.rename,

      d = actions.delete,

      f = actions.fold_create,
      F = actions.fold_delete,

      c = actions.comment,

      ['<enter>'] = actions.select,
      o = actions.select,

      N = actions.move_down,
      E = actions.move_up,

      t = actions.telescope({
        layout_config = {
          height = 0.6,
          width = 0.6,
          prompt_position = 'top',
          preview_width = 0.5,
        },
        layout_strategy = 'horizontal',
      }),
    }
  end

  require('nvim-navbuddy').setup(config)
end

return M
