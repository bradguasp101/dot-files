local status_ok, lspkind = pcall(require, 'lspkind')
if not status_ok then
  return
end
lspkind.init()

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
    ['<Tab>'] = cmp.mapping.confirm({select = true}),
    ['<C-n>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
    ['<C-p>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
  },
  sources = {
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
