-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  return
end

saga.setup({
  -- keybinds for navigation in lspsaga window
  scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
  -- use enter to open file with definition preview
  definition = {
    keys = {
      edit = "<CR>",
    },
  },
  finder = {
    max_height = 0.6,
    left_width = 0.5,
    right_width = 2,
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
