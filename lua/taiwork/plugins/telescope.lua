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
local lga_actions = require("telescope-live-grep-args.actions")

-- configure telescope
telescope.setup({
	-- configure custom mappings
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden", -- このオプションを追加
			"--glob=!**/.git/**", -- .git ディレクトリを除外
		},
		-- find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git" },
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
		file_ignore_patterns = {
			"node_modules",
			"vendor",
			"dist",
			"build",
			"public",
			"tmp",
			"log",
			"logs",
			"coverage",
			"node_modules",
			"vendor",
			"dist",
			"build",
			"public",
			"tmp",
			"log",
			"logs",
			"coverage",
			".git",
		},
	},
	extensions = {
		live_grep_args = {
			auto_quoting = true, -- enable/disable auto-quoting
			-- define mappings, e.g.
			mappings = { -- extend mappings
				i = {
					["<C-l>"] = lga_actions.quote_prompt(),
					["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob=**/" }),
					["<C-w>"] = lga_actions.quote_prompt({ postfix = " -w " }),
				},
			},
		},
		frecency = {
			workspaces = {
				-- backend
				["rails_controller"] = "./app/controllers",
				["rails_model"] = "./app/models",
				["rails_service"] = "./app/services",
				["rails_schema"] = "./db/schema",
				["rails_view"] = "./app/views",
				["rails_view_partials"] = "./app/views/api/partials",
				["rails_spec"] = "./spec",
				-- frontend
				["next_page"] = "./src/pages",
				["next_container"] = "./src/containers",
				["next_component"] = "./src/components",
				["next_model"] = "./src/models",
				["next_util"] = "./src/utils",
				["next_api"] = "./src/utils/api",
			},
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("live_grep_args")

_M = {}

function _M.setup_project_keymaps()
	local current_dir = vim.fn.getcwd()

	-- frecency mappings
	local keymap = vim.keymap -- for conciseness
	local frecency_str = "<Cmd>lua require('telescope').extensions.frecency.frecency({ workspace = '%s' })<CR>"
	local frecency_opt = { noremap = true, silent = true }

	if string.find(current_dir, "frontend") then
		-- frontend frecency mappings
		keymap.set("n", "<leader>pa", string.format(frecency_str, "next_page"), frecency_opt)
		keymap.set("n", "<leader>cn", string.format(frecency_str, "next_container"), frecency_opt)
		keymap.set("n", "<leader>cm", string.format(frecency_str, "next_component"), frecency_opt)
		keymap.set("n", "<leader>mo", string.format(frecency_str, "next_model"), frecency_opt)
		keymap.set("n", "<leader>ut", string.format(frecency_str, "next_util"), frecency_opt)
		keymap.set("n", "<leader>ap", string.format(frecency_str, "next_api"), frecency_opt)
	else
		-- backend frecency mappings
		keymap.set("n", "<leader>co", string.format(frecency_str, "rails_controller"), frecency_opt)
		keymap.set("n", "<leader>mo", string.format(frecency_str, "rails_model"), frecency_opt)
		keymap.set("n", "<leader>se", string.format(frecency_str, "rails_service"), frecency_opt)
		keymap.set("n", "<leader>sc", string.format(frecency_str, "rails_schema"), frecency_opt)
		keymap.set("n", "<leader>vi", string.format(frecency_str, "rails_view"), frecency_opt)
		keymap.set("n", "<leader>vp", string.format(frecency_str, "rails_view_partials"), frecency_opt)
		keymap.set("n", "<leader>sp", string.format(frecency_str, "rails_spec"), frecency_opt)
	end
end

vim.cmd([[autocmd VimEnter * lua _M.setup_project_keymaps()]])
