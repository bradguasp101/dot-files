local files = {}

-- will return the root of the git repository, otherwise just returns the directory
-- the current file is in
function files.getRoot()
  local exists = os.execute('git -C . rev-parse 2>/dev/null')
  if exists ~= 0 then
    return vim.fn.fnamemodify(vim.fn.expand('%:h'), ':~:.')
  end

  local handle = io.popen('git rev-parse --show-toplevel')
  if handle == nil then
    return vim.fn.fnamemodify(vim.fn.expand('%:h'), ':~:.')
  end

  local result = handle:read('*a')
  handle:close()

  return result
end

function files.getRelativeFile()
  return vim.fn.fnamemodify(vim.fn.expand('%:'), ':p:~:.')
end

return files
