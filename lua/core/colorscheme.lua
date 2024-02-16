local catppuccin_setup, catppuccin = pcall(require, "catppuccin")
if not catppuccin_setup then
	print("catppuccin not found!")
	return
end

local mocha = require("catppuccin.palettes").get_palette("mocha")
catppuccin.setup({
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = false,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
		octo = true,
		telescope = true,
	},
	transparent_background = true,
	custom_highlights = function(colors)
		return {
			Search = { bg = colors.overlay0, fg = colors.none },
		}
	end,
})
local status, _ = pcall(vim.cmd, "colorscheme catppuccin")
if not status then
	print("Colorscheme not found!")
	return
end

-- Diff view is missing syntax highlighting #105
-- https://github.com/ellisonleao/gruvbox.nvim/issues/105
--
-- function FixNightfly()
-- 	vim.api.nvim_set_hl(0, "DiffviewDiffAddAsDelete", { bg = "#1c1f24" })
-- 	vim.api.nvim_set_hl(0, "DiffDelete", { bg = "none", fg = "#81A1C1" })
-- 	vim.api.nvim_set_hl(0, "DiffviewDiffDelete", { bg = "none", fg = "#81A1C1" })
-- 	vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#1B4F21" })
-- 	vim.api.nvim_set_hl(0, "DiffChange", { bg = "#3B5C98" })
-- 	vim.api.nvim_set_hl(0, "DiffText", { bg = "#99783C" })
-- end
--
-- FixNightfly()
--
-- vim.api.nvim_create_autocmd("ColorScheme", { pattern = { "nightfly" }, callback = FixNightfly })
