local setup, copilot = pcall(require, "copilot")
if not setup then
  return
end

copilot.setup({
  filetypes = {
    yaml = false,
    markdown = true,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
})
