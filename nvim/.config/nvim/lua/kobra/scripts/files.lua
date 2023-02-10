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

  result = string.gsub(result, '^%s+', '')
  result = string.gsub(result, '%s+$', '')
  result = string.gsub(result, '[\n\r]+', ' ')
  return result
end

function files.getRelativeFile()
  return vim.fn.fnamemodify(vim.fn.expand('%:'), ':p:~:.')
end

local function reverse(tbl)
    for i = 1, math.floor(#tbl/2) do
        local j = #tbl - i + 1
        tbl[i], tbl[j] = tbl[j], tbl[i]
    end
end

function files.get_tail(filename)
    return vim.fn.fnamemodify(filename, ":t")
end

function files.split_filename(filename)
    local nodes = {}
    for parent in string.gmatch(filename, "[^/]+/") do
        table.insert(nodes, parent)
    end
    table.insert(nodes, files.get_tail(filename))
    return nodes
end

function files.reverse_filename(filename)
    local parents = files.split_filename(filename)
    reverse(parents)
    return parents
end

local function same_until(first, second)
    for i = 1, #first do
        if first[i] ~= second[i] then
            return i
        end
    end
    return 1
end

function files.get_unique_filename(filename, other_filenames)
    local rv = ''

    local others_reversed = vim.tbl_map(files.reverse_filename, other_filenames)
    local filename_reversed = files.reverse_filename(filename)
    local same_until_map = vim.tbl_map(function(second) return same_until(filename_reversed, second) end, others_reversed)

    local max = 0
    for _, v in ipairs(same_until_map) do
        if v > max then max = v end
    end
    for i = max, 1, -1 do
        rv = rv .. filename_reversed[i]
    end

    return rv
end

function files.get_current_ufn()
    local buffers = vim.fn.getbufinfo()
    local listed = vim.tbl_filter(function(buffer) return buffer.listed == 1 end, buffers)
    local names = vim.tbl_map(function(buffer) return buffer.name end, listed)
    local current_name = vim.fn.expand("%")
    return files.get_unique_filename(current_name, names)
end

return files
