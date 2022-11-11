local export = {}

export.servers = {
	"sumneko_lua",
	"jsonls",
	"gopls",
}

function export.setup()
	local mason_ok, mason = pcall(require, "mason")
	if not mason_ok then
		return
	end

	mason.setup({
		ui = {
			border = "none",
			icons = {
				package_installed = "✓",
			},
		},
		log_level = vim.log.levels.INFO,
		max_concurrent_installers = 4,
	})

	local mason_config_ok, mason_lsp_config = pcall(require, "mason-lspconfig")
	if not mason_config_ok then
		return
	end

	mason_lsp_config.setup({
		ensure_installed = export.servers,
		automatic_installation = true,
	})

	require("kobra.lsp.null-ls").setup()

	local mason_null_ok, mason_null = pcall(require, "mason-null-ls")
	if not mason_null_ok then
		return
	end

	mason_null.setup()
end

return export
