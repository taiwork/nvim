return {
  -- Mason for managing LSP servers, linters, and formatters
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "cssls",
          "tailwindcss",
          "emmet_ls",
          "lua_ls",
          "solargraph",
        },
        automatic_installation = true,
      })
    end,
  },

  -- LSP configurations
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "glepnir/lspsaga.nvim",
      "onsails/lspkind.nvim",
    },
    config = function()
      require('plugins.lsp.lspconfig')  -- 外部ファイルに設定を分ける
    end,
  },

  -- Autocompletion plugins
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-vsnip",
      "onsails/lspkind.nvim",
    },
    config = function()
      require('plugins.lsp.cmp')  -- 外部ファイルに設定を分ける
    end,
  },

  -- Lspsaga for enhanced UI
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require('plugins.lsp.lspsaga')  -- 外部ファイルに設定を分ける
    end,
  },

  -- Lspkind for icons in autocompletion
  {
    "onsails/lspkind.nvim",
    config = function()
      require('plugins.lsp.lspkind')  -- 外部ファイルに設定を分ける
    end,
  },

  -- Null-ls for linting and formatting
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require('plugins.lsp.null-ls')  -- 外部ファイルに設定を分ける
    end,
  },
}
