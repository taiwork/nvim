vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- use jj to exit insert mode
keymap.set("i", "jj", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>") -- open file explorer and highlight current file

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

----------------------
-- Original Keybinds
----------------------

-- terminal
keymap.set("t", "<ESC>", "<C-\\><C-n>") -- exit terminal mode with <ESC>
keymap.set("t", "jj", "<C-\\><C-n>") -- exit terminal mode with <ESC>
keymap.set("n", "<leader>wo", ":belowright 15sp term://zsh<CR>") -- open terminal window

-- cheat
keymap.set("n", "<leader>?", ":Cheat<CR>") -- open cheat sheet

-- vim-fugitive
keymap.set("n", "<leader>gd", ":Gdiff master<CR>") -- open git diff in split window
keymap.set("n", "<leader>gb", ":Git blame<CR>") -- open git blame in split window

-- diffview
keymap.set("n", "<leader>dc", ":DiffviewClose<CR>") -- close diffview
keymap.set("n", "<leader>dr", ":DiffviewRefresh<CR>") -- refresh diffview

-- git-switcher
keymap.set("n", "<leader>gl", ":GswLoad<CR>") -- load session in now session

----------------------
-- Script Keybinds
----------------------

-- copy relative file path
local copy_file_path = require("taiwork.scripts.copy_file_path")
vim.keymap.set("n", "<leader>cf", copy_file_path.copy_relative_file_path, { silent = true, noremap = true })
