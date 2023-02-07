_G = _G or {}
return {
  init = function()
    -- disable netrw since we're replacing with nvim tree
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end
}
