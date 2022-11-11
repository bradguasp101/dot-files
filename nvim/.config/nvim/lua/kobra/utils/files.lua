local export = {}

function export.getRoot()
  return vim.fn.fnamemodify(vim.fn.expand('%:h'), ':~:.')
end

function export.getRelativePath()
  return vim.fn.fnamemodify(vim.fn.expand('%:h'), ':p~:.')
end

function export.getRelativeFile()
  return vim.fn.fnamemodify(vim.fn.expand('%:'), ':p~:.')
end

function export.exists(name)
  local f = io.open(name, 'r')
  if f ~= nil then io.close(f) return true else return false end
end

return export
