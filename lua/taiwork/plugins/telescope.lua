-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

-- configure telescope
telescope.setup({
	-- configure custom mappings
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
				["<C-]"] = actions.cycle_history_next, -- cycle history next
				["<C-[>"] = actions.cycle_history_prev, -- cycle history prev
				["<C-c>"] = actions.close, -- close telescope
			},
		},
	},
	extensions = {
		frecency = {
			workspaces = {
				["rails_controller"] = "./app/controllers",
				["rails_model"] = "./app/models",
				["rails_service"] = "./app/services",
				["rails_spec"] = "./spec",
				["next_page"] = "./src/pages",
				["next_container"] = "./src/containers",
				["next_component"] = "./src/components",
				["next_util"] = "./src/utils",
			},
		},
	},
})

telescope.load_extension("fzf")

-- frecency mappings
local keymap = vim.keymap -- for conciseness
local frecency_str = "<Cmd>lua require('telescope').extensions.frecency.frecency({ workspace = '%s' })<CR>"
local frecency_opt = { noremap = true, silent = true }

-- backend frecency mappings
keymap.set("n", "<leader>co", string.format(frecency_str, "rails_controller"), frecency_opt)
keymap.set("n", "<leader>mo", string.format(frecency_str, "rails_model"), frecency_opt)
keymap.set("n", "<leader>se", string.format(frecency_str, "rails_service"), frecency_opt)
keymap.set("n", "<leader>sp", string.format(frecency_str, "rails_spec"), frecency_opt)

-- frontend frecency mappings
keymap.set("n", "<leader>pa", string.format(frecency_str, "next_page"), frecency_opt)
keymap.set("n", "<leader>cn", string.format(frecency_str, "next_container"), frecency_opt)
keymap.set("n", "<leader>cm", string.format(frecency_str, "next_component"), frecency_opt)
keymap.set("n", "<leader>ut", string.format(frecency_str, "next_util"), frecency_opt)
