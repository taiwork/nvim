local setup, autosession = pcall(require, "auto-session")
if not setup then
  return
end

autosession.setup({
  silent_restore = false,
})
