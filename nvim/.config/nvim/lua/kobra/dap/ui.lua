local status_ok, ui = pcall(require, 'dapui')
if not status_ok then
  return
end

ui.setup()
