local input = {}

function input.exec(command)
  vim.ui.input({
    prompt = 'Enter filename: ',
  }, function(val)
    if not val then
      return
    end

    vim.api.nvim_command(command .. ' ' .. val)
  end)
end

return input
