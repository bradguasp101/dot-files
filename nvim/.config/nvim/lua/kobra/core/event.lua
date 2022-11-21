local vim = vim
local api = vim.api

local autocmd = {}

function autocmd.nvim_create_augroups(definitions)
  for group_name, defs in pairs(definitions) do
    local gn = api.nvim_create_augroup("LocalAuGroup" .. group_name, {})
    for _, def in ipairs(defs) do
      api.nvim_create_autocmd(vim.split(def[1], ","), {
        group = gn,
        pattern = def[2],
        command = def[3],
      })
    end
  end
end

function autocmd.load_autocmds()
  local definitions = {
    packer = {
      { 'BufWritePost', '*.lua', 'lua require("kobra.core.pack").auto_compile()' },
    },
    bufs = {
      { "BufWritePost", "plugins.lua", "PackerCompile" },
      -- { "BufReadPre", "*", ":silent! :lua require('kobra.modules.lang.config').nvim_treesitter()" },
    },
  }

  autocmd.nvim_create_augroups(definitions)
end

autocmd.load_autocmds()
return autocmd
