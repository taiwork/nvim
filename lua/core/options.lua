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

-- opt.foldenable = true
-- opt.foldmethod = "indent"
-- opt.foldlevel = 99

vim.g.markdown_recommended_style = 0

-- https://github.com/nvim-treesitter/nvim-treesitter/issues/2825#issuecomment-1496747076
vim.g.indentLine_fileTypeExclude = { "json", "markdown" }
vim.g.indentLine_conceallevel = 0 -- prevent double quotes hide in json

vim.g.editorconfig = false

vim.g.markdown_folding = 1

local opt = vim.opt -- for conciseness

-- =============================================================================
-- 共通設定（行番号表示など）
-- =============================================================================
opt.number = true
opt.relativenumber = false

-- =============================================================================
-- Windows環境（ネイティブ）だけの個別設定
-- =============================================================================
-- vim.fn.has("win32") は Windows（32bit/64bit問わず）であれば 1 を返します
if vim.fn.has("win32") == 1 then
    -- ファイルを読み込む際の文字コード候補
    opt.fileencodings = "ucs-bom,utf-8,cp932,default,latin1"

    -- 自動コマンド（Autocmd）で .ps1 や .bat ファイル作成時にWindows向け設定を適用
    vim.api.nvim_create_augroup("WindowsScript", { clear = true })
    vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
        group = "WindowsScript",
        pattern = { "*.ps1", "*.bat" },
        callback = function()
            vim.opt_local.fileencoding = "utf-8"
            vim.opt_local.bomb = true
            vim.opt_local.fileformat = "dos"
        end,
    })
end
