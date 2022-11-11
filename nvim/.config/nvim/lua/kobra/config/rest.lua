local status_ok, rest = pcall(require, "nvim-rest")
if not status_ok then
	return
end

rest.setup()
