-- place this in one of your configuration file(s)
local hop = require("hop")

vim.keymap.set("", "f", function()
  hop.hint_char1()
end, { remap = true })
vim.keymap.set("", "r", function()
  hop.hint_lines_skip_whitespace()
end, { remap = true })
