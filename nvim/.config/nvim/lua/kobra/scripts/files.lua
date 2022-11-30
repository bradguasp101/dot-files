local files = {}

function files.getRoot()
  return vim.fn.fnamemodify(vim.fn.expand('%:h'), ':~:.')
end

function files.getRelativeFile()
  return vim.fn.fnamemodify(vim.fn.expand('%:'), ':p~:.')
end

function files.exists(name)
  local f = io.open(name, 'r')
  if f ~= nil then io.close(f) return true else return false end
end

return files
