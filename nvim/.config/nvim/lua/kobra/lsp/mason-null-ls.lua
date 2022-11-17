local export = {}

local sources = {
  'codespell',
  'misspell',
  'protolint',
  'revive',
  'goimports',
  'shfmt',
}

function export.setup()
  local mason_null_ls = require('mason-null-ls')

  mason_null_ls.setup({
    ensure_installed = sources,
  })

  local handlers = {}
  for _, source in ipairs(sources) do
    local require_ok, handler = pcall(require, 'kobra.lsp.settings.' .. source .. '-null-ls')
    if require_ok then
      handlers[source] = handler
    end
  end

  mason_null_ls.setup_handlers(handlers)
end


return export
