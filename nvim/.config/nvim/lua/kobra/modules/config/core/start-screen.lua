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
    'Projects',
    'p',
    '~/Projects/',
  },
  {
    'Dotfiles',
    'd',
    '~/dot-files/',
  },
}

local get_layout = function()
  return query.alpha_workspace_layout(workspaces, startify.button, {
    others_name = 'Other Sessions',
  })
end

function screen.config()
  startify.section.top_buttons.val = {
    startify.button("f", "New file", ":ene <BAR> startinsert <CR>"),
    startify.button("df", "Dot Files", ":cd ~/dot-files<cr><cmd>Telescope file_browser path=%:p:h hidden=true<cr>"),
  }

  startify.section.mru.val[2].val = 'Recent Files'

  -- disable MRU cwd
  startify.section.mru_cwd.val = {{ type = "padding", val = 0 }}

  startify.section.bottom_buttons.val = {
    startify.button("q", "Quit NVIM", ":qa<CR>"),
  }

  startify.section.footer = {
    { type = "text", val = "footer" },
  }

  local config = startify.config

  table.insert(config.layout, 5, {
    type = 'group',
    val = utils.throttle(get_layout, 5000),
  })

  alpha.setup(config)
end

return screen
