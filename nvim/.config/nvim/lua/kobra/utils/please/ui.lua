local Popup = require('nui.popup')
local event = require("nui.utils.autocmd").event

local popup = Popup({
  position = '50%',
  enter = true,
  focusable = true,
  size = {
    width = "20%",
    height = 1,
  },
  border = {
    style = 'rounded',
  },
})

-- mount/open the component
popup:mount()

-- unmount component when cursor leaves buffer
popup:on(event.BufLeave, function()
  popup:unmount()
end)
