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
keymap.set("n", "<leader>sq", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab
keymap.set("n", "<leader>to", ":tabonly<CR>") -- close all other tabs

-- move tab
keymap.set("n", "}", "gt") -- move to next tab
keymap.set("n", "{", "gT") -- move to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>") -- open file explorer and highlight current file

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>") -- find files within current working directory, respects .gitignore
-- keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fs", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

----------------------
-- Original Keybinds
----------------------

-- terminal
keymap.set("t", "<ESC>", "<C-\\><C-n>") -- exit terminal mode with <ESC>
keymap.set("t", "jj", "<C-\\><C-n>") -- exit terminal mode with <ESC>
-- keymap.set("n", "<leader>wo", ":belowright 15sp term://zsh<CR>") -- open terminal window
keymap.set("n", "<leader>wo", "<cmd>Lspsaga term_toggle<CR>") -- open terminal window

-- cheat
keymap.set("n", "<leader>?", ":Cheat<CR>") -- open cheat sheet

-- vim-fugitive
keymap.set("n", "<leader>gd", ":Gdiff master<CR>") -- open git diff in split window
keymap.set("n", "<leader>gb", ":Git blame<CR>") -- open git blame in split window

-- diffview
keymap.set("n", "<leader>dh", ":DiffviewOpen HEAD<CR>") -- open HEAD diffview
keymap.set("n", "<leader>dm", ":DiffviewOpen master<CR>") -- open master diffview
keymap.set("n", "<leader>do", ":DiffviewOpen ") -- open diffview
keymap.set("n", "<leader>dc", ":DiffviewClose<CR>") -- close diffview
keymap.set("n", "<leader>dr", ":DiffviewRefresh<CR>") -- refresh diffview

-- git-switcher
keymap.set("n", "<leader>gs", ":Gsw ") -- open git switcher
keymap.set("n", "<leader>gl", ":GswLoad<CR>") -- load session in now session
keymap.set("n", "<leader>gp", ":GswSave<CR>") -- save current session

-- vim-rails
keymap.set("n", "<leader>rr", ":R<CR>") -- open rails model, controller, view, etc.
keymap.set("n", "<leader>rv", ":RV<CR>") -- open rails model, controller, view, etc. in vertical split
keymap.set("n", "<leader>aa", ":A<CR>") -- open alternate file (model, controller, view, etc.)
keymap.set("n", "<leader>av", ":AV<CR>") -- open alternate file in vertical split

-- copilot
keymap.set("n", "<leader>cp", ":Copilot panel<CR>") -- open copilot panel

-- github permlink
keymap.set("n", "<leader>bp", ":GetCurrentBranchLink<CR>") -- open github permalink

-- copy current line
keymap.set("n", "<leader>y", "0wv$hy") -- copy current line

-- translate
keymap.set("v", "<leader>tre", ":Translate EN -output=replace<CR>") -- translate word
keymap.set("v", "<leader>trj", ":Translate JA -output=replace<CR>") -- translate word

-- Octo
keymap.set("n", "<leader>opl", ":Octo pr list<CR>") -- open pull request list
keymap.set("n", "<leader>opc", ":Octo pr create<CR>") -- open pull request create
keymap.set("n", "<leader>opm", ":Octo pr merge<CR>") -- open pull request merge
keymap.set("n", "<leader>opb", ":Octo pr browser<CR>") -- open pull request browser
keymap.set("n", "<leader>opu", ":Octo pr url<CR>") -- open pull request url
keymap.set("n", "<leader>ors", ":Octo review start<CR>") -- open pull request review start
keymap.set("n", "<leader>oru", ":Octo review submit<CR>") -- open pull request review submit
keymap.set("n", "<leader>orr", ":Octo review resume<CR>") -- open pull request review resume
keymap.set("n", "<leader>ord", ":Octo review discard<CR>") -- open pull request review discard

----------------------
-- Script Keybinds
----------------------

-- copy relative file path
local copy_file_path = require("scripts.copy_file_path")
vim.keymap.set("n", "<leader>cf", copy_file_path.copy_relative_file_path, { silent = true, noremap = true })

-- キーマッピング: <leader><C-O> で前のバッファにジャンプ
-- キーマッピング: <leader><C-I> で次のバッファにジャンプ
-- vim.keymap.set(
-- 	"n",
-- 	"<leader><C-o>",
-- 	"<cmd>lua require('scripts.jump_to_next_buffer').jump_to_next_buffer_in_jumplist(-1)<CR>",
-- 	{ silent = true, noremap = true }
-- )
-- vim.keymap.set(
-- 	"n",
-- 	"<leader><C-i>",
-- 	"<cmd>lua require('scripts.jump_to_next_buffer').jump_to_next_buffer_in_jumplist(1)<CR>",
-- 	{ silent = true, noremap = true }
-- )
