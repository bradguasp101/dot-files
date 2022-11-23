local config = {}

function config.fidget()
  require('fidget').setup({
    sources = {
      ['null-ls'] = { ignore = true },
    },
  })
end

function config.navigator()
  local single = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }
  local nav_cfg = {
    width = 0.7,
    lsp_installer = false,
    border = single,
    lsp_signature_help = true,
    combined_attach = 'their',
    lsp = {
      servers = { 'bufls' },
      flow = { autostart = false },
      gopls = {
        settings = {
          gopls = {
            directoryFilters = {
              '-**/plz-out',
              '-**/node_modules',
            },
          },
        },
      },
      bufls = {
        filetypes = {
          'proto',
        },
      },
    },
  }

  vim.lsp.set_log_level('error')
  require('navigator').setup(nav_cfg)
end

function config.symbols_outline()
  require('symbols-outline').setup({
    show_relative_numbers = true,
  })
end

function config.go()
  require('go').setup({
    fillstruct = 'gopls',
    lsp_codelens = false, -- use navigator
    dap_debug = true,
    goimport = 'gopls',
    dap_debug_vt = 'true',
    dap_debug_gui = true,
    test_runner = 'go',
    luasnip = true,
  })

  vim.cmd('augroup go')
  vim.cmd('autocmd!')
  vim.cmd('autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4')
  vim.cmd('augroup END')
end

function config.rest()
  require('nvim-rest').setup()
end

return config
