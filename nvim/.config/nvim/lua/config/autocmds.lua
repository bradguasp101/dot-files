-- run wollemi when saving a go file
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = vim.api.nvim_create_augroup("wollemi_go", { clear = true }),
  pattern = { "*.go" },
  command = [[ silent exec '!wollemi --log fatal gofmt' shellescape(expand('%:h'), 1) ]],
})

-- run wollemi when saving a plz file
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = vim.api.nvim_create_augroup("wollemi_plz", { clear = true }),
  pattern = { "*.plz" },
  command = [[ silent exec '!wollemi --log fatal fmt' shellescape(expand('%:h'), 1) ]],
})
