local status, indent_blankline = pcall(require, "ibl")
if not status then
  return
end

indent_blankline.setup({
  debounce = 100,
  viewport_buffer = {
    min = 30,
  },
  scope = {
    show_start = false,
  },
})
