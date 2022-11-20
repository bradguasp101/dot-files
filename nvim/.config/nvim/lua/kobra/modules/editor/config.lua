local config = {}

function config.autopairs()
  local has_autopairs, autopairs = pcall(require, 'nvim-autopairs')
  if not has_autopairs then
    local loader = require('packer').loader
    loader('nvim-autopairs')

    has_autopairs, autopairs = pcall(require, 'nvim-autopairs')
    if not has_autopairs then
      return
    end
  end

  local npairs = require('nvim-autopairs')
  local Rule = require('nvim-autopairs.rule')
  npairs.setup({
    disable_filetype = { 'TelescopePrompt', 'guihua', 'guihua_rust', 'clap_input' },
    autopairs = { enable = true },
    ignored_next_char = string.gsub([[ [%w%%%'%[%'%.] ]], '%s+', ''), -- '[%w%.+-'']',
    enable_check_bracket_line = false,
    html_break_line_filetype = { 'html', 'vue', 'typescriptreact', 'svelte', 'javascriptreact' },
    check_ts = true,
    ts_config = {
      lua = { 'string' }, -- it will not add pair on that treesitter node
      javascript = { 'template_string' },
      java = false, -- don't check treesitter on java
    },
    fast_wrap = {
      map = '<M-e>',
      chars = { '{', '[', '(', '"', '\'', '`' },
      pattern = string.gsub([[ [%'%'%`%+%)%>%]%)%}%,%s] ]], '%s+', ''),
      end_key = '$',
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      check_comma = true,
      highlight = 'Search',
    },
  })

  local ts_conds = require('nvim-autopairs.ts-conds')
  npairs.add_rules({
    Rule(' ', ' '):with_pair(function(opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
    Rule('(', ')'):with_pair(function(opts)
      return opts.prev_char:match('.%)') ~= nil
    end):use_key(')'),
    Rule('{', '}'):with_pair(function(opts)
      return opts.prev_char:match('.%}') ~= nil
    end):use_key('}'),
    Rule('[', ']'):with_pair(function(opts)
      return opts.prev_char:match('.%]') ~= nil
    end):use_key(']'),
    Rule('%', '%', 'lua') -- press % => %% is only inside comment or string
      :with_pair(ts_conds.is_ts_node({ 'string', 'comment' })),
    Rule('$', '$', 'lua'):with_pair(ts_conds.is_not_ts_node({ 'function' })),
  })

  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local cmp = require('cmp')
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
end

function config.hexokinase()
  vim.g.Hexokinase_optInPatterns = {
    'full_hex',
    'triple_hex',
    'rgb',
    'rgba',
    'hsl',
    'hsla',
    'colour_names',
  }
  vim.g.Hexokinase_highlighters = {
    'virtual',
    'sign_column',
    'backgroundfull',
  }
end

function config.comment()
  require('Comment').setup({
    extended = true,
    pre_hook = function(ctx)
      if
        vim.bo.filetype == 'typescriptreact'
        or vim.bo.filetype == 'typescript'
        or vim.bo.filetype == 'javascript'
        or vim.bo.filetype == 'css'
        or vim.bo.filetype == 'html'
        or vim.bo.filetype == 'scss'
        or vim.bo.filetype == 'svelte'
        or vim.bo.filetype == 'uve'
        or vim.bo.filetype == 'graphql'
      then
        local U = require('Comment.utils')
        -- Determine whether to use linewise or blockwise commentstring
        local type = ctx.ctype == U.ctype.linewise and '__default' or '__multiline'

        local location = nil
        if ctx.ctype == U.ctype.block then
          location = require('ts_context_commentstring.utils').get_cursor_location()
        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
          location = require('ts_context_commentstring.utils').get_visual_start_location()
        end

        return require('ts_context_commentstring.internal').calculate_commentstring({
          key = type,
          location = location,
        })
      end
    end,
    post_hook = function(ctx)
      if ctx.range.scol == -1 then
        -- do something with the current line
      else
        if ctx.range.ecol > 400 then
          ctx.range.ecol = 1
        end
        if ctx.cmotion > 1 then
          -- 322 324 0 2147483647
          vim.fn.setpos('\'<', { 0, ctx.range.srow, ctx.range.scol })
          vim.fn.setpos('\'>', { 0, ctx.range.erow, ctx.range.ecol })
          vim.cmd([[exe 'norm! gv']])
        end
      end
    end,
  })
end

function config.leap()
  require('leap').add_default_mappings()
end

return config
