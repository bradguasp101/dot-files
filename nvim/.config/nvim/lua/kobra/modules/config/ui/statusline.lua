local statusline = {}

local fmt = string.format
local utils = require('heirline.utils')
local conditions = require('heirline.conditions')

local hex = function(n)
  if n then
    return fmt('#%06x', n)
  end
end

local function parse_style(style)
  if not style or style == 'NONE' then
    return {}
  end

  local result = {}
  for token in string.gmatch(style, '([^,]+)') do
    result[token] = true
  end

  return result
end

local function get_highlight(name)
  local hl = vim.api.nvim_get_hl_by_name(name, true)
  if hl.link then
    return get_highlight(hl.link)
  end

  local result = parse_style(hl.style)
  result.fg = hl.foreground and hex(hl.foreground)
  result.bg = hl.background and hex(hl.background)
  result.sp = hl.special and hex(hl.special)

  return result
end

local function set_highlights(groups)
  for group, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

local function generate_pallet_from_colorscheme()
  local color_map = {
    black   = { index = 0, default = '#393b44' },
    red     = { index = 1, default = '#c94f6d' },
    green   = { index = 2, default = '#81b29a' },
    yellow  = { index = 3, default = '#dbc074' },
    blue    = { index = 4, default = '#719cd6' },
    magenta = { index = 5, default = '#9d79d6' },
    cyan    = { index = 6, default = '#63cdcf' },
    white   = { index = 7, default = '#dfdfe0' },
  }

  local diagnostic_map = {
    hint = { hl = 'DiagnosticHint', default = color_map.green.default },
    info = { hl = 'DiagnosticInfo', default = color_map.blue.default },
    warn = { hl = 'DiagnosticWarn', default = color_map.yellow.default },
    error = { hl = 'DiagnosticError', default = color_map.red.default },
  }

  local pallet = {}
  for name, value in pairs(color_map) do
    local global_name = 'terminal_color_' .. value.index
    pallet[name] = vim.g[global_name] and vim.g[global_name] or value.default
  end

  for name, value in pairs(diagnostic_map) do
    pallet[name] = get_highlight(value.hl).fg or value.default
  end

  pallet.sl = get_highlight('StatusLine')
  pallet.sel = get_highlight('TabLineSel')

  return pallet
end

local generate_user_statusline_highlights = function()
  local pal = generate_pallet_from_colorscheme()

  local sl_colors = {
    Black   = { fg = pal.black,   bg = pal.white },
    Red     = { fg = pal.red,     bg = pal.sl.bg },
    Green   = { fg = pal.green,   bg = pal.sl.bg },
    Yellow  = { fg = pal.yellow,  bg = pal.sl.bg },
    Blue    = { fg = pal.blue,    bg = pal.sl.bg },
    Magenta = { fg = pal.magenta, bg = pal.sl.bg },
    Cyan    = { fg = pal.cyan,    bg = pal.sl.bg },
    White   = { fg = pal.white,   bg = pal.black },
  }

  local colors = {}
  for name, value in pairs(sl_colors) do
    colors['User' .. name] = { fg = value.fg, bg = value.bg, bold = true }
    colors['UserRv' .. name] = { fg = value.bg, bg = value.fg, bold = true }
  end

  local status = vim.o.background == 'dark' and { fg = pal.black, bg = pal.white } or { fg = pal.white, bg = pal.black }

  local groups = {
    UserSLHint = { fg = pal.sl.bg, bg = pal.hint, bold = true },
    UserSLInfo = { fg = pal.sl.bg, bg = pal.info, bold = true },
    UserSLWarn = { fg = pal.sl.bg, bg = pal.warn, bold = true },
    UserSLError = { fg = pal.sl.bg, bg = pal.error, bold = true },
    UserSLStatus = { fg = status.fg, bg = status.bg, bold = true },

    UserSLFtHint = { fg = pal.sel.bg, bg = pal.hint },
    UserSLHintInfo = { fg = pal.hint, bg = pal.info },
    UserSLInfoWarn = { fg = pal.info, bg = pal.warn },
    UserSLWarnError = { fg = pal.warn, bg = pal.error },
    UserSLErrorStatus = { fg = pal.error, bg = status.bg },
    UserSLStatusBg = { fg = status.bg, bg = pal.sl.bg },

    UserSLAlt = pal.sel,
    UserSLAltSep = { fg = pal.sl.bg, bg = pal.sel.bg },
    UserSLGitBranch = { fg = pal.yellow, bg = pal.sl.bg },
  }

  set_highlights(vim.tbl_extend('force', colors, groups))
end

generate_user_statusline_highlights()

vim.api.nvim_create_augroup('Heirline', { clear = true })
vim.api.nvim_create_autocmd({ 'SessionLoadPost', 'ColorScheme' }, {
    callback = function()
        generate_user_statusline_highlights()
    end,
    group = 'Heirline',
})

local vi = {
  text = {
    n = 'NORMAL',
    no = 'NORMAL',
    i = 'INSERT',
    v = 'VISUAL',
    V = 'V-LINE',
    [''] = 'V-BLOCK',
    c = 'COMMAND',
    cv = 'COMMAND',
    ce = 'COMMAND',
    R = 'REPLACE',
    Rv = 'REPLACE',
    s = 'SELECT',
    S = 'SELECT',
    [''] = 'SELECT',
    t = 'TERMINAL',
  },

  colors = {
    n = 'UserRvCyan',
    no = 'UserRvCyan',
    i = 'UserSLStatus',
    v = 'UserRvMagenta',
    V = 'UserRvMagenta',
    [''] = 'UserRvMagenta',
    R = 'UserRvRed',
    Rv = 'UserRvRed',
    r = 'UserRvBlue',
    rm = 'UserRvBlue',
    s = 'UserRvMagenta',
    S = 'UserRvMagenta',
    [''] = 'FelnMagenta',
    c = 'UserRvYellow',
    ['!'] = 'UserRvBlue',
    t = 'UserRvBlue',
  },

  sep = {
    n = 'UserCyan',
    no = 'UserCyan',
    i = 'UserSLStatusBg',
    v = 'UserMagenta',
    V = 'UserMagenta',
    [''] = 'UserMagenta',
    R = 'UserRed',
    Rv = 'UserRed',
    r = 'UserBlue',
    rm = 'UserBlue',
    s = 'UserMagenta',
    S = 'UserMagenta',
    [''] = 'FelnMagenta',
    c = 'UserYellow',
    ['!'] = 'UserBlue',
    t = 'UserBlue',
  },
}

local icons = {
  locker = '', -- #f023
  page = '☰', -- 2630
  line_number = '', -- e0a1
  connected = '', -- f817
  dos = '', -- e70f
  unix = '', -- f17c
  mac = '', -- f179
  mathematical_L = '𝑳',
  vertical_bar = '┃',
  vertical_bar_thin = '│',
  left = '',
  right = '',
  block = '█',
  left_filled = '',
  right_filled = '',
  slant_left = '',
  slant_left_thin = '',
  slant_right = '',
  slant_right_thin = '',
  slant_left_2 = '',
  slant_left_2_thin = '',
  slant_right_2 = '',
  slant_right_2_thin = '',
  left_rounded = '',
  left_rounded_thin = '',
  right_rounded = '',
  right_rounded_thin = '',
  circle = '●',
  error = '',
  warn = '',
  info = '',
  hint = '',
}

local function vi_sep_hl()
  return vi.sep[vim.fn.mode()] or 'UserSLBlack'
end

local viMode = utils.surround(
  { '', '' },
  vi_sep_hl,
  {
    init = function(self)
      self.mode = vim.fn.mode(1)
    end,
    static = {
      mode_names = vi.text,
      mode_colors = vi.colors,
    },
    provider = function(self)
      return fmt(' %s ', self.mode_names[self.mode])
    end,
    hl = function(self)
      local mode = self.mode:sub(1, 1)
      return { fg = self.mode_colors[mode] or 'UserSLViBlack' }
    end,
    update = {
      'ModeChanged',
      pattern = '*:*',
      callback = vim.schedule_wrap(function()
        vim.cmd('redrawstatus')
      end),
    },
  }
)

local gitBranch = {
  condition = conditions.is_git_repo,
  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,
  hl = 'UserSLGitBranch',
  {   -- git branch name
    provider = function(self)
      return ' ' .. self.status_dict.head
    end,
    hl = { bold = true }
  },
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = '('
  },
  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and ('+' .. count)
    end,
    hl = { fg = 'git_add' },
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and ('-' .. count)
    end,
    hl = { fg = 'git_del' },
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and ('~' .. count)
    end,
    hl = { fg = 'git_change' },
  },
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = ')',
  },
}

local fileinfo = utils.surround(
  { ' ', ' ' },
  'UserSLAltSep',
  {
    provider = require('kobra.scripts.files').get_current_ufn,
    hl = 'UserSLAlt',
  }
)

function statusline.statusline()
  return {
    viMode,
    gitBranch,
    fileinfo,
  }
end

return statusline
