local completion = {}

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt' then
    return false
  end

  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match('^%s*$') == nil
end

function completion.nvim_cmp()
  local lspkind = require('lspkind')
  lspkind.init({
    symbol_map = {
      Copilot = "",
    },
  })
  vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { fg = '#6CC644' })

  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local cmp = require('cmp')

  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

  cmp.setup {
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<Tab>'] = vim.schedule_wrap(function(fallback)
        if cmp.visible() and has_words_before() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        else
          fallback()
        end
      end),
      ['<C-n>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
      ['<C-p>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      }),
    },
    sources = {
      { name = 'copilot' },
      { name = "rg", keyword_length = 4 },
      { name = 'nvim_lua' },
      { name = 'nvim_lsp' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'calc' },
      { name = 'spell', keyword_length = 5 },
      { name = 'buffer', keyword_length = 5 },
      { name = 'path' },
    },
    buffer = {
      sources = {
        { name = 'vim-dadbod-completion' },
      },
    },
    formatting = {
      format = lspkind.cmp_format {
        with_text = true,
        menu = {
          rg = "[ripgrep]",
          nvim_lua = "[api]",
          nvim_lsp = "[LSP]",
          calc = "[calc]",
          spell = "[spell]",
          buffer = "[buf]",
          path = "[path]",
        },
        before = function (entry, vim_item)
          vim_item.menu = entry:get_completion_item().detail
          return vim_item
        end,
      },
    },
    sorting = {
      priority_weight = 2,
      comparators = {
        require('copilot_cmp.comparators').prioritize,
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.recently_used,
        cmp.config.compare.locality,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    },
    experimental = {
      ghost_text = false,
      native_menu = false,
    },
  }

  cmp.setup.cmdline({'/', '?'}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' },
    },
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' },
    }, {
      { name = 'cmdline' },
    }),
  })
end

return completion
