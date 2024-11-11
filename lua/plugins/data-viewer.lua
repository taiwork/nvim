local data_viewer_setup, data_viewer = pcall(require, "data-viewer")
if not data_viewer_setup then
  print("data-viewer not found!")
  return
end

data_viewer.setup({
  maxLineEachTable = 1000,
})
