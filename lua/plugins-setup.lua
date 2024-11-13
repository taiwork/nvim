-- auto install lazy if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- add list of plugins to install
require("lazy").setup({
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use

  -- "bluz71/vim-nightfly-guicolors", -- preferred colorscheme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  "christoomey/vim-tmux-navigator", -- tmux & split window navigation

  "szw/vim-maximizer", -- maximizes and restores current window

  -- essential plugins
  "tpope/vim-surround", -- add, delete, change surroundings (it's awesome)
  "inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)

  -- commenting with gc
  { "numToStr/Comment.nvim", config = true },

  -- file explorer
  "nvim-tree/nvim-tree.lua",

  -- vs-code like icons
  "nvim-tree/nvim-web-devicons",

  -- statusline
  "nvim-lualine/lualine.nvim",

  -- fuzzy finding w/ telescope
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
  {
    "nvim-telescope/telescope-frecency.nvim",
    dependencies = { "kkharji/sqlite.lua" },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
  },

  -- autocompletion
  "hrsh7th/nvim-cmp", -- completion plugin
  "hrsh7th/cmp-buffer", -- source for text in buffer
  "hrsh7th/cmp-path", -- source for file system paths

  -- snippets
  -- "L3MON4D3/LuaSnip", -- snippet engine
  "saadparwaiz1/cmp_luasnip", -- for autocompletion
  "rafamadriz/friendly-snippets", -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  "williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
  "williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  "neovim/nvim-lspconfig", -- easily configure language servers
  "hrsh7th/cmp-nvim-lsp", -- for autocompletion
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  }, -- enhanced lsp uis
  -- "jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
  "onsails/lspkind.nvim", -- vs-code like icons for autocompletion

  -- formatting & linting
  "jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
  "jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls

  -- treesitter configuration
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  },

  -- auto closing
  "windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
  "windwp/nvim-ts-autotag", -- autoclose tags

  -- git integration
  { "lewis6991/gitsigns.nvim", config = true }, -- show line modifications on left hand side

  -- ## original

  -- autoSave
  {
    "907th/vim-auto-save",
    config = function()
      vim.g.auto_save = 1
      local groupName = "DisableAutosaveForOcto"
      local groupID = vim.api.nvim_create_augroup(groupName, { clear = true })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "octo",
        group = groupID,
        callback = function()
          vim.b.auto_save = 0
        end,
      })
    end,
  },

  -- session
  { "rmagatti/auto-session", opts = { silent_restore = false } },
  -- {
  --   "ToruIwashita/git-switcher.vim",
  --   config = function()
  --     vim.g.gsw_load_session_confirm = "yes"
  --   end,
  -- },

  -- copilot
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_filetypes = {
        markdown = true,
        gitcommit = true,
        yaml = true,
      }
    end,
  },

  -- cheatsheet
  {
    "reireias/vim-cheatsheet",
    config = function()
      vim.g["cheatsheet#cheat_file"] = "~/.config/nvim/cheatsheet.md"
    end,
  },
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },

  -- indent line
  {
    "Yggdroot/indentLine",
    opt = {
      debounce = 100,
      viewport_buffer = {
        min = 30,
      },
      scope = {
        show_start = false,
      },
    }
  },

  -- rainbow-csv
  {
    "cameron-wags/rainbow_csv.nvim",
    config = function()
      require("rainbow_csv").setup()
    end,
    -- optional lazy-loading below
    module = {
      "rainbow_csv",
      "rainbow_csv.fns",
    },
    ft = {
      "csv",
      "tsv",
      "csv_semicolon",
      "csv_whitespace",
      "csv_pipe",
      "rfc_csv",
      "rfc_semicolon",
    },
  },

  -- git diff
  -- "airblade/vim-gitgutter", -- conflict octo.nvim
  "tpope/vim-fugitive",

  -- ctags & rails
  "vim-ruby/vim-ruby",
  "tpope/vim-rails",
  "thoughtbot/vim-rspec",
  "AndrewRadev/rails_extra.vim",
  "tpope/vim-rbenv",
  "tpope/vim-bundler",

  -- diff view
  {
    "sindrets/diffview.nvim",
    opts = {
      default_args = {
        DiffviewOpen = { "--imply-local" },
      }
    }
  },

  -- smart subvert
  "tpope/vim-abolish",

  -- easy motion
  {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
      vim.keymap.set("", "f", require("hop").hint_char1, { remap = true })
      vim.keymap.set("", "r", require("hop").hint_lines_skip_whitespace, { remap = true })
    end,
  },

  -- tagbar
  {
    "preservim/tagbar",
    config = function()
      vim.g.tagbar_type_rspec = {
        ctagstype = "RSpec",
        kinds = {
          "d:describe",
          "c:context",
          "i:it",
        },
      }
    end,
  },

  -- multiple cursors
  "mg979/vim-visual-multi",

  -- smooth scroll
  "karb94/neoscroll.nvim",

  -- github review
  -- {
  --   "pwntester/octo.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   config = function()
  --     require("octo").setup()
  --   end,
  -- },

  -- translate
  "uga-rosa/translate.nvim",

  -- gitlinker (permlink)
  {
    "ruifm/gitlinker.nvim",
    config = true,
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- nest context preview
  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   opts = {
  --     enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  --     max_lines = 5, -- How many lines the window should span. Values <= 0 mean no limit.
  --     min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  --     line_numbers = true,
  --     multiline_threshold = 20, -- Maximum number of lines to show for a single context
  --     trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  --     mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
  --     -- Separator between context and content. Should be a single character string, like '-'.
  --     -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  --     separator = "-",
  --     zindex = 20, -- The Z-index of the context window
  --     on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
  --   }
  -- },

  -- quickfix
  "kevinhwang91/nvim-bqf",

  -- indent blankline
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

  -- csv data viewer
  {
    "vidocqh/data-viewer.nvim",
    opts = { maxLineEachTable = 1000 },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kkharji/sqlite.lua", -- Optional, sqlite support
    },
  },

  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip").config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
      })
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_lua").lazy_load({
        paths = "~/.config/nvim/lua/snippets",
      })
    end,
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "taiwork/asterisk-nojump.nvim",
  },

  -- github copilot chat
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   branch = "canary",
  --   dependencies = {
  --     { "zbirenbaum/copilot.vim" }, -- or github/copilot.vim
  --     { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
  --   },
  --   opts = {
  --     debug = false, -- Enable debugging
  --     -- See Configuration section for rest
  --   },
  --   -- See Commands section for default commands if you want to lazy load on them
  -- },

  { import = "plugins"}
})
