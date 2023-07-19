local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
	print("Colorscheme not found!")
	return
end

-- Diff view is missing syntax highlighting #105
-- https://github.com/ellisonleao/gruvbox.nvim/issues/105
--
function FixNightfly()
	vim.api.nvim_set_hl(0, "DiffviewDiffAddAsDelete", { bg = "#1c1f24" })
	vim.api.nvim_set_hl(0, "DiffDelete", { bg = "none", fg = "#81A1C1" })
	vim.api.nvim_set_hl(0, "DiffviewDiffDelete", { bg = "none", fg = "#81A1C1" })
	vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#1B4F21" })
	vim.api.nvim_set_hl(0, "DiffChange", { bg = "#3B5C98" })
	vim.api.nvim_set_hl(0, "DiffText", { bg = "#99783C" })
end

FixNightfly()

vim.api.nvim_create_autocmd("ColorScheme", { pattern = { "nightfly" }, callback = FixNightfly })
