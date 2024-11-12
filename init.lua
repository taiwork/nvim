require("plugins-setup")

require("core.autocmds")
require("core.colorscheme")
require("core.commands")
require("core.keymaps")
require("core.options")

require("scripts.docker_rspec")
require("scripts.copy_error_messages")
require("scripts.windows_cr_replace")

require("plugins.nvim-tree")
require("plugins.lualine")
require("plugins.telescope")
require("plugins.nvim-cmp")
require("plugins.lsp.mason")
require("plugins.lsp.lspsaga")
require("plugins.lsp.lspconfig")
require("plugins.lsp.null-ls")
require("plugins.autopairs")
require("plugins.treesitter")
require("plugins.neoscroll")
require("plugins.vim-rails")
require("plugins.nvim-bqf")
