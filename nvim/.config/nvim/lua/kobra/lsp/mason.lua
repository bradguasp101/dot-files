local export = {}

export.servers = {
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
}

function export.setup()
  require('mason').setup({
    ui = {
      icons = {
        package_installed = '✓',
        package_pending = '➜',
        package_uninstalled = '✗',
      },
    },
  })

	require('mason-lspconfig').setup({
		ensure_installed = export.servers,
		automatic_installation = true,
	})

	require('kobra.lsp.null-ls').setup()

  require('mason-null-ls').setup()
end

return export
