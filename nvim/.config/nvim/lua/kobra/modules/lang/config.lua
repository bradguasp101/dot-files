local config = {}

function config.regexplainer()
  require('regexplainer').setup({
    mode = 'narrative',
    auto = false,
    filetypes = {
      'html',
      'js',
      'cjs',
      'mjs',
      'ts',
      'jsx',
      'tsx',
      'cjsx',
      'mjsx',
      'go',
      'lua',
      'vim',
    },
    mappings = {
      toggle = '<Leader>gR',
    },
    narrative = {
      separator = '\n',
    },
  })
end

function config.neogen()
  require('neogen').setup({
    enabled = true,
  })
end

function config.refactor()
  local refactor = require('refactoring')
  refactor.setup({})

  _G.ts_refactors = function()
    local function _refactor(prompt_bufnr)
      local content = require('telescope.actions.state').get_selected_entry(prompt_bufnr)
      require('telescope.actions').close(prompt_bufnr)
      require('refactoring').refactor(content.value)
    end

    local opts = require('telescope.themes').get_cursor()
    require('telescope.pickers')
      .new(opts, {
        prompt_title = 'refactors',
        finder = require('telescope.finders').new_table({
          results = require('refactoring').get_refactors(),
        }),
        sorter = require('telescope.config').values.generic_sorter(opts),
        attach_mappings = function(_, map)
          map('i', '<CR>', _refactor)
          map('n', '<CR>', _refactor)
          return true
        end,
      })
      :find()
  end
end

function config.go()
  require('go').setup({
    fillstruct = 'gopls',
    lsp_codelens = false,
    dap_debug = true,
    goimport = 'gopls',
    dap_debug_vt = true,
    dap_debug_gui = true,
    test_runner = 'go',
    lsp_document_formatting = false,
    luasnip = true,
  })

  vim.cmd('augroup go')
  vim.cmd('autocmd!')
  vim.cmd('autocmd FileType go nmap <leader>gb  :GoBuild')

  --  Show by default 4 spaces for a tab
  vim.cmd('autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4')

  vim.cmd('autocmd FileType go nmap <leader>gt  GoTest')

  vim.cmd('autocmd FileType go nmap <Leader><Leader>l GoLint')
  vim.cmd('autocmd FileType go nmap <Leader>gc :lua require("go.comment").gen()')

  vim.cmd('au FileType go command! Gtn :TestNearest -v -tags=integration')
  vim.cmd('au FileType go command! Gts :TestSuite -v -tags=integration')
  vim.cmd('augroup END')
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
      disable_format_cap = { 'sqls', 'jsonls', 'sumeko_lua' },
      disply_diagnostic_qf = false,
      denols = { filetypes = {} },
      rename = {style ='floating'},
      tsserver = {
        filetypes = {
          'javascript',
          'javascriptreact',
          'javascript.jsx',
          'typescript',
          'typescriptreact',
          'typescript.tsx',
        },
      },
      flow = { autostart = false },
    },
  }

  vim.lsp.set_log_level('error')
  require('navigator').setup(nav_cfg)
  vim.keymap.set('n', '<Space>rn', '<cmd>lua require("navigator.rename").rename_preview()<CR>', {})
end

function config.lspsaga()
  require('lspsaga').init_lsp_saga({
    border_style = 'rounded',
    code_action_lightbulb = {
      enable = false,
    },
  })
end

function config.playground()
  require('nvim-treesitter.configs').setup({
    playground = {
      enable = true,
      disable = {},
      updatetime = 50,
      persist_queries = true,
    },
  })
end

function config.outline()
  require('symbols-outline').setup({})
end

function config.luadev()
  vim.cmd([[vmap <leader><leader>r <Plug>(Luadev-Run)]])
end

function config.dap() end

function config.dapui() end

function config.hlargs()
  require('hlargs').setup()
end

function config.neodev() end

function config.trouble()
  require('trouble').setup({})
end

function config.fidget()
  require('fidget').setup({
    sources = {
      ['null-ls'] = { ignore = true },
    },
  })
end

function config.ssr()
  require('ssr').setup({
    min_width = 50,
    min_height = 5,
    keymaps = {
      close = 'q',
      next_match = 'n',
      prev_match = 'N',
      replace_all = '<leader><cr>',
    },
  })
end

return config
