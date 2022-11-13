local status_ok, dap_ruby = pcall(require, 'dap-ruby')
if not status_ok then
  return
end

dap_ruby.setup()
