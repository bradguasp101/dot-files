local export = {}

function export.getRoot()
  local f = io.popen('git rev-parse --show-toplevel')
  if f == nil then
    return vim.fn.cwd()
  end

  local l = f:read("*a")
  f:close()
  return l
end

function export.getRelativePath()
  return vim.fn.fnamemodify(vim.fn.expand('%:h'), ':p:~:.')
end

function export.getRelativeFile()
  return vim.fn.fnamemodify(vim.fn.expand('%:'), ':p:~:.')
end

-- this is a little hacky... but works
function export.exists(name)
  local f = io.open(name, 'r')
  if f ~= nil then io.close(f) return true else return false end
end

return export
