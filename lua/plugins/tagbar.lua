-- tagbar
-- local tagbar_setup, tagbar = pcall(require, "tagbar")
-- if not tagbar_setup then
--   return
-- end

vim.g.tagbar_type_rspec = {
  ctagstype = "RSpec",
  kinds = {
    "d:describe",
    "c:context",
    "i:it",
  },
}
