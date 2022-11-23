local config = {}

function config.mason()
  require('kobra.modules.lang.lsp')
end

function config.fidget()
  require('fidget').setup({
    sources = {
      ['null-ls'] = { ignore = true },
    },
  })
end

function config.signature()
  require('lsp_signature').setup({
    bind = true,
    fix_pos = true,
    always_trigger = true,
    hint_enable = false,
  })
end

function config.symbols_outline()
  require('symbols-outline').setup({
    show_relative_numbers = true,
  })
end

function config.go()
  require('go').setup({
    fillstruct = 'gopls',
    dap_debug = true,
    goimport = 'gopls',
    dap_debug_vt = 'true',
    dap_debug_gui = true,
    test_runner = 'go',
    luasnip = true,
  })
end

function config.rest()
  require('nvim-rest').setup()
end

return config
