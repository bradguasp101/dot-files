local status_ok, notify = pcall(require, 'notify')
if not status_ok then
  return
end

notify.setup({
  render = 'minimal',
  stages = 'slide',
})

vim.notify = function(msg, ...)
  -- This error occurs when two clients with different offset encodings are attached to the same buffer. This is not
  -- yet supported, and so we're suppressing the issue until it is.
  if msg:match("warning:multiple different client offset_encodings") then
    return
  end

  notify(msg, ...)
end
