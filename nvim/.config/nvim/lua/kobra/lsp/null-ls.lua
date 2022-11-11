local export = {}

function export.setup()
	local null_ls_ok, null_ls = pcall(require, "null-ls")
	if not null_ls_ok then
		return
	end

	null_ls.setup({
		sources = {
      -- Code Actions
      null_ls.builtins.code_actions.shellcheck,

      -- Completions
			null_ls.builtins.completion.spell,

      -- Diagnostics
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.diagnostics.golangci_lint,
      null_ls.builtins.diagnostics.jsonlint,
      null_ls.builtins.diagnostics.misspell,
      null_ls.builtins.diagnostics.protoc_gen_lint,
      null_ls.builtins.diagnostics.protolint,
			null_ls.builtins.diagnostics.revive,

      -- Formatting
			null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.eslint_d,
      null_ls.builtins.formatting.fixjson,
      null_ls.builtins.formatting.gofmt,
      null_ls.builtins.formatting.goimports,
      null_ls.builtins.formatting.lua_format,
      null_ls.builtins.formatting.markdownlint,
      null_ls.builtins.formatting.markdown_toc,
      null_ls.builtins.formatting.pg_format,
      null_ls.builtins.formatting.protolint,
      null_ls.builtins.formatting.shfmt,
      null_ls.builtins.formatting.yamlfmt,
		},
	})
end

return export
