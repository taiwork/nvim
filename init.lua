vim.g.mapleader = " "
require("plugins-setup")

require("core.autocmds")
require("core.colorscheme")
require("core.commands")
require("core.keymaps")
require("core.options")

require("scripts.docker_rspec")
require("scripts.copy_error_messages")
require("scripts.windows_cr_replace")
