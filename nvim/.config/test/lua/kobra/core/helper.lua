local helper = {}

local setup_wollemi = function()
  vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    pattern = { '*.go' },
    command = [[silent exec '!wollemi --log fatal gofmt' shellescape(expand('%:h'), 1)]],
  })
  vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    pattern = { '*.plz' },
    command = [[silent exec '!wollemi --log fatal fmt' shellescape(expand('%:h'), 1)]],
  })
end

helper.init = function()
  vim.api.nvim_create_user_command('UpdateLazy', require('kobra.core.plugins').update_lazy, {})
  vim.api.nvim_create_user_command('CurrFile', require('kobra.scripts.files').copy_current_file_to_clipboard, {})

  setup_wollemi()
end

return helper
