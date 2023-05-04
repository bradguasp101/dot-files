local events = {}

function events.setup()
  vim.cmd([[ autocmd BufEnter * silent! lcd %:p:h ]])
end

return events
