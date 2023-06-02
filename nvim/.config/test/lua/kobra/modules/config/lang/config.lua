local config = {}

function config.mason()
  require('kobra.modules.config.lang.lsp')
end

function config.lsp_progress()
  require('lsp-progress').setup({
    spinner = { '⣷', '⣯', '⣟', '⡿', '⢿', '⣻', '⣽', '⣾' },
    series_format = function(title, _, percentage, _)
      local builder = {}
      if title and title ~= '' then
        table.insert(builder, title)
      end
      if percentage then
        table.insert(builder, string.format('(%.0f%%%%)', percentage))
      end
      return table.concat(builder, ' ')
    end,
    client_format = function(client_name, spinner, series_messages)
      return #series_messages > 0
          and client_name ~= 'null-ls'
          and ('[' .. client_name .. '] ' .. spinner .. ' ' .. table.concat(
            series_messages,
            ', '
          ))
        or nil
    end,
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
  vim.lsp.handlers['textDocument/codeAction'] = require('lsputil.codeAction').code_action_handler
  vim.lsp.handlers['textDocument/references'] = require('lsputil.locations').references_handler
  vim.lsp.handlers['textDocument/definition'] = require('lsputil.locations').definition_handler
  vim.lsp.handlers['textDocument/declaration'] = require('lsputil.locations').declaration_handler
  vim.lsp.handlers['textDocument/typeDefinition'] = require('lsputil.locations').typeDefinition_handler
  vim.lsp.handlers['textDocument/implementation'] = require('lsputil.locations').implementation_handler
  vim.lsp.handlers['textDocument/documentSymbol'] = require('lsputil.symbols').document_handler
  vim.lsp.handlers['workspace/symbol'] = require('lsputil.symbols').workspace_handler
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
