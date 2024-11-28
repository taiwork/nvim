local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- swap file
opt.swapfile = false

-- opt.foldmethod = "indent"
-- vim.opt.foldlevel = 99
-- vim.opt.foldenable = true

vim.g.markdown_recommended_style = 0

-- https://github.com/nvim-treesitter/nvim-treesitter/issues/2825#issuecomment-1496747076
vim.g.indentLine_fileTypeExclude = { "json", "markdown" }
