local hotkey = require "mjolnir.hotkey"

local grid = require "mjolnir.bg.grid"

-- Debug
-- package.path = '/Users/robenkleene/Development/Projects/Automation/window-manager-prototypes/mjolnir-edited/?.lua;'
-- local grid = require "bg.grid"


grid.GRIDWIDTH = 6
grid.GRIDHEIGHT = 3
grid.MARGINX = 0
grid.MARGINY = 0

mash = {"alt"}
-- hotkey.bind(mash, 'J', grid.pushwindow_down)
-- hotkey.bind(mash, 'K', grid.pushwindow_up)
-- hotkey.bind(mash, 'H', grid.pushwindow_left)
-- hotkey.bind(mash, 'L', grid.pushwindow_right)
hotkey.bind(mash, 'w', grid.pushwindow_nextscreen)

mash = {"ctrl", "alt"}
-- hotkey.bind(mash, 'k', grid.resizewindow_shorter)
-- hotkey.bind(mash, 'l', grid.resizewindow_wider)
-- hotkey.bind(mash, 'h', grid.resizewindow_thinner)
-- hotkey.bind(mash, 'j', grid.resizewindow_taller)

-- mash = {"shift", "alt"}
-- hotkey.bind(mash, 'l', grid.pushwindow_nextscreen)
-- hotkey.bind(mash, 'h', grid.pushwindow_prevscreen)

-- function grid.maximize_window()
--   local win = window.focusedwindow()
--   local f = {x = 0, y = 0, w = grid.GRIDWIDTH, h = grid.GRIDHEIGHT}
--   grid.set(win, f, win:screen())
-- end
