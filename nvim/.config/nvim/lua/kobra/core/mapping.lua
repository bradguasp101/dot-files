COLEMAK = true

local opts = {noremap = true, silent = true}
local term_opts = {silent = true}
local keymap = vim.api.nvim_set_keymap

local function qwerty()
  -- remap terminal mode to escape
  vim.cmd([[tnoremap jj <C-\><C-n>]])
  vim.cmd([[tnoremap <Esc> <C-\><C-n>]])

  -- navigate windows
  keymap('n', '<C-h>', '<C-w>h', opts)
  keymap('n', '<C-j>', '<C-w>j', opts)
  keymap('n', '<C-k>', '<C-w>k', opts)
  keymap('n', '<C-l>', '<C-w>l', opts)

  -- navigate buffers
  keymap('n', '<S-h>', ':bnext<cr>', opts)
  keymap('n', '<S-l>', ':bprevious<cr>', opts)

  -- Move text up and down
  keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
  keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

  -- Visual --
  -- Stay in indent mode
  keymap("v", "<", "<gv", opts)
  keymap("v", ">", ">gv", opts)

  -- Move text up and down
  keymap("v", "∆", ":m '>+1<CR>gv=gv", opts)
  keymap("v", "˚", ":m '<-2<CR>gv=gv", opts)
  keymap("v", "p", '"_dP', opts)

  -- Visual Block --
  -- Move text up and down
  keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
  keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
  keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
  keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

  -- Terminal --
  -- Better terminal navigation
  keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
  keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
  keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
  keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
end

local function colemak()
  -- remap all basic movements
  keymap('n', 'n', 'j', opts)
  keymap('o', 'n', 'j', opts)
  keymap('v', 'n', 'j', opts)
  keymap('x', 'n', 'j', opts)

  keymap('n', 'e', 'k', opts)
  keymap('o', 'e', 'k', opts)
  keymap('v', 'e', 'k', opts)
  keymap('x', 'e', 'k', opts)

  keymap('n', 'i', 'l', opts)
  keymap('o', 'i', 'l', opts)
  keymap('v', 'i', 'l', opts)
  keymap('x', 'i', 'l', opts)

  -- remap terminal mode to escape
  vim.cmd([[tnoremap nn <C-\><C-n>]])
  vim.cmd([[tnoremap <Esc> <C-\><C-n>]])

  -- navigate windows
  keymap('n', '<C-h>', '<C-w>h', opts)
  keymap('n', '<C-n>', '<C-w>j', opts)
  keymap('n', '<C-e>', '<C-w>k', opts)
  keymap('n', '<C-i>', '<C-w>l', opts)

  -- navigate buffers
  keymap('n', '<S-h>', ':bnext<cr>', opts)
  keymap('n', '<S-i>', ':bprevious<cr>', opts)

  -- Move text up and down
  keymap("n", "<A-n>", "<Esc>:m .+1<CR>==gi", opts)
  keymap("n", "<A-e>", "<Esc>:m .-2<CR>==gi", opts)

  -- Visual --
  -- Stay in indent mode
  keymap("v", "<", "<gv", opts)
  keymap("v", ">", ">gv", opts)

  -- Move text up and down
  keymap("v", "N", ":m '>+1<CR>gv=gv", opts)
  keymap("v", "E", ":m '<-2<CR>gv=gv", opts)
  keymap("v", "p", '"_dP', opts)

  -- Visual Block --
  -- Move text up and down
  keymap("x", "N", ":move '>+1<CR>gv-gv", opts)
  keymap("x", "E", ":move '<-2<CR>gv-gv", opts)
  keymap("x", "<A-n>", ":move '>+1<CR>gv-gv", opts)
  keymap("x", "<A-e>", ":move '<-2<CR>gv-gv", opts)

  -- Terminal --
  -- Better terminal navigation
  keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
  keymap("t", "<C-n>", "<C-\\><C-N><C-w>j", term_opts)
  keymap("t", "<C-e>", "<C-\\><C-N><C-w>k", term_opts)
  keymap("t", "<C-i>", "<C-\\><C-N><C-w>l", term_opts)
end

if COLEMAK then
  colemak()
else
  qwerty()
end

