local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

nvimtree.setup({
	view = {
		width = 40,
	},
	-- change folder arrow icons
	renderer = {
		indent_width = 1,
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
			},
		},
	},
	-- disable window_picker for
	-- explorer to work well with
	-- window splits
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	git = {
		enable = false,
	},
})

-- for auto-session workarounds
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "NvimTree*",
	callback = function()
		local api = require("nvim-tree.api")
		local view = require("nvim-tree.view")

		if not view.is_visible() then
			api.tree.open()
		end
	end,
})
