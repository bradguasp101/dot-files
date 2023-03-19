local screen = {}

local alpha_ok, alpha = pcall(require, 'alpha')
if not alpha_ok then
  return
end

local startify_ok, startify = pcall(require, 'alpha.themes.startify')
if not startify_ok then
  return
end

local utils_ok, utils = pcall(require, 'possession.utils')
if not utils_ok then
  return
end

local query_ok, query = pcall(require, 'possession.query')
if not query_ok then
  return
end

local workspaces = {
  {
    'Project Sessions',
    'p',
    '~/Projects/',
  },
  {
    'Dotfile Sessions',
    'd',
    '~/dot-files/',
  },
}

local header = {
  [[                                                                       ]],
	[[                                                                     ]],
	[[       ████ ██████           █████      ██                     ]],
	[[      ███████████             █████                             ]],
	[[      █████████ ███████████████████ ███   ███████████   ]],
	[[     █████████  ███    █████████████ █████ ██████████████   ]],
	[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
	[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
	[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
	[[                                                                       ]],
}

local kobra = {
  [[                                                                       ]],
  [[           ]],
	[[           ]],
	[[           ]],
	[[   ███   ]],
	[[  █████  ]],
	[[ ██ ██ ]],
	[[███ ███]],
	[[█████████]],
  [[                                                                       ]],
}

local function scandir(dir)
  local t = {}
  local i = 0
  for fn in vim.fs.dir(dir) do
    if fn == '.' or fn == '..' or fn == '.DS_Store' then goto continue end

    i = i + 1
    t[i] = dir .. fn

    ::continue::
  end

  return t
end

local get_projects = function()
  local files = scandir('~/Projects/')

  local buttons = {}
  for i, fn in ipairs(files) do
    local ico_txt
    local fb_hl = {}

    local ico, hl = startify.icon(fn)
    local hl_option_type = type(startify.nvim_web_devicons.highlight)

    if hl_option_type == 'boolean' then
      if hl and startify.nvim_web_devicons.highlight then
        table.insert(fb_hl, { hl, 0, #ico })
      end
    end

    if hl_option_type == 'string' then
      table.insert(fb_hl, { startify.nvim_web_devicons.highlight, 0, #ico })
    end

    ico_txt = ico .. ' '

    local short_fn = vim.fn.fnamemodify(fn, ':~')
    local cd_cmd = ' | cd %:p:h'
    local file_button_el = startify.button(tostring(i), ico_txt .. short_fn, '<cmd>e ' .. fn .. cd_cmd .. '<cr>')
    local fn_start = short_fn:match('.*[/\\]')
    if fn_start ~= nil then
      table.insert(fb_hl, { 'Comment', #ico_txt, #fn_start + #ico_txt })
    end

    file_button_el.opts.hl = fb_hl
    buttons[i] = file_button_el
  end

  return {
    type = 'group',
    val = buttons,
  }
end

local get_sessions = function()
  return query.alpha_workspace_layout(workspaces, startify.button, {
    others_name = 'Other Sessions',
  })
end

function screen.config()
  startify.section.header = {
    type = 'text',
    val = header,
    opts = {
      hl = 'Type',
      shrink_margin = false,
    }
  }

  startify.section.top_buttons.val = {
    startify.button('f', 'New file', ':ene <BAR> startinsert <CR>'),
    startify.button('df', 'Dot Files', ':cd ~/dot-files<cr><cmd>Telescope file_browser path=%:p:h hidden=true<cr>'),
  }

  startify.section.mru.val[2].val = 'Recent Files'

  -- disable MRU cwd
  startify.section.mru_cwd.val = {{ type = 'padding', val = 0 }}

  startify.section.bottom_buttons.val = {
    startify.button('q', 'Quit NVIM', ':qa<CR>'),
  }

  startify.section.footer = {
    { type = 'text', val = 'footer' },
  }

  local config = startify.config
  config.layout[2] = {
    type = 'text',
    val = header,
    opts = {
      hl = 'Type',
      shrink_margin = false,
    }
  }

  table.insert(config.layout, 5, {
    type = 'group',
    val = {
      { type = 'padding', val = 1 },
      { type = 'text', val = 'Projects', opts = { hl = 'SpecialComment' } },
      { type = 'padding', val = 1 },
      {
        type = 'group',
        val = function()
          return { get_projects() }
        end,
      },
    },
  })

  table.insert(config.layout, 6, {
    type = 'group',
    val = utils.throttle(get_sessions, 5000),
  })

  alpha.setup(config)
end

screen.fun = {
  scandir = scandir,
  get_projects = get_projects,
  get_sessions = get_sessions,
}

return screen
