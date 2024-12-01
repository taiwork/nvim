local saga = require("lspsaga")

saga.setup({
  scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
  definition = {
    keys = {
      edit = "<CR>",
    },
  },
  finder = {
    max_height = 0.8,
    min_width = 0.8,
    keys = { shuttle = { "<C-h>", "<C-l>" } },
  },
  ui = {
    colors = {
      normal_bg = "#022746",
    },
  },
  rename = {
    auto_save = true,
  },
})
