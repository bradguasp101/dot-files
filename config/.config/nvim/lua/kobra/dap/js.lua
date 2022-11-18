local status_ok, dap_js = pcall(require, 'dap-vscode-js')
if not status_ok then
  return
end

dap_js.setup()
