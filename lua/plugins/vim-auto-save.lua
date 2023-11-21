vim.g.auto_save = 1
-- vim.cmd("autocmd BufRead,BufNewFile ~/.config/nvim/lua/plugins-setup.lua let b:auto_save = 0")
local groupName = "DisableAutosaveForOcto"
local groupID = vim.api.nvim_create_augroup(groupName, { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "octo",
	group = groupID,
	callback = function()
		vim.b.auto_save = 0
	end,
})
