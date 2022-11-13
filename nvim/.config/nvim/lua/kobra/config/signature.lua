local status_ok, signature = pcall(require, 'lsp_signature')
if not status_ok then
  return
end

signature.setup({
  bind = true,
  fix_pos = true,
  always_trigger = true,
  hint_enable = false,
})
