local session = {}

function session.saveSession()
  vim.ui.input({
    prompt = 'Enter session name: ',
    default = 'custom',
  }, function(input)
    if not input then
      return
    end

    vim.api.nvim_command('SaveSession ' .. vim.fn.stdpath('data') .. '/sessions/' .. input)
  end)
end

return session
