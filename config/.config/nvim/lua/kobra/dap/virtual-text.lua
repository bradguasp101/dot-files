local status_ok, dap = pcall(require, 'nvim-dap-virtual-text')
if not status_ok then
  return
end

dap.setup()
