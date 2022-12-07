local ts_ensure_installed = {
  'bash',
  'go',
  'css',
  'html',
  'javascript',
  'typescript',
  'jsdoc',
  'json',
  'c',
  'java',
  'toml',
  'tsx',
  'lua',
  'cpp',
  'python',
  'rust',
  'jsonc',
  'yaml',
  'sql',
  'vue',
  'vim',
  'fish',
  'markdown',
}

local treesitter = function()
  local has_ts = pcall(require, 'nvim-treesitter.configs')
  if not has_ts then
    vim.notify('ts not installed')
    return
  end

  require('nvim-treesitter.configs').setup({
    ensure_installed = ts_ensure_installed,
    sync_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
      custom_captures = { todo = 'Todo' },
    },
    indent = { enable = true, disable = { 'yaml' } },
  })
end

local playground = function()
  require('nvim-treesitter.configs').setup({
    playground = {
      enable = true,
      disable = {},
      updatetime = 50,
      persist_queries = true,
    },
  })
end

return {
  treesitter = treesitter,
  playground = playground,
}
