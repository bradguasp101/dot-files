local status_ok, abbrevman = pcall(require, 'abbrev-man')
if not status_ok then
  return
end

abbrevman.setup()
