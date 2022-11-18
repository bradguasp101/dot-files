local status_ok, symbols = pcall(require, 'symbols-outline')
if not status_ok then
  return
end

symbols.setup({
  -- show_numbers = true,
  show_relative_numbers = true,
})
