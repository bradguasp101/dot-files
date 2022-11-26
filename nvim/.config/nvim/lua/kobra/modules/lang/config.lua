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

function config.lsputils()
  vim.lsp.handlers['textDocument/codeAction'] = require('sputil.codeAction').code_action_handler
  vim.lsp.handlers['textDocument/references'] = require('sputil.locations').references_handler
  vim.lsp.handlers['textDocument/definition'] = require('sputil.locations').definition_handler
  vim.lsp.handlers['textDocument/declaration'] = require('sputil.locations').declaration_handler
  vim.lsp.handlers['textDocument/typeDefinition'] = require('sputil.locations').typeDefinition_handler
  vim.lsp.handlers['textDocument/implementation'] = require('sputil.locations').implementation_handler
  vim.lsp.handlers['textDocument/documentSymbol'] = require('sputil.symbols').document_handler
  vim.lsp.handlers['workspace/symbol'] = require('sputil.symbols').workspace_handler
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
