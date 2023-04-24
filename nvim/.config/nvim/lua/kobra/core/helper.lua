local helper = {}

helper.init = function()
  vim.api.nvim_create_user_command('UpdateLazy', require('kobra.core.plugins').update_lazy, {})
  vim.api.nvim_create_user_command('CurrFile', require('kobra.scripts.files').copy_current_file_to_clipboard, {})
end

return helper
