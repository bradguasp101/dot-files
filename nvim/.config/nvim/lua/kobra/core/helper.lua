local helper = {}

helper.init = function()
  vim.api.nvim_create_user_command('UpdateLazy', require('kobra.core.plugins').update_lazy, {})
end

return helper
