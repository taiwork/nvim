return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- インストール時に自動的にパーサーを更新
    dependencies = { "windwp/nvim-ts-autotag" }, -- autotagプラグインを追加
    config = function()
      require("nvim-treesitter.configs").setup({
        -- シンタックスハイライトを有効化
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        -- インデントを有効化
        indent = { enable = true },
        -- nvim-ts-autotagプラグインを使用した自動タグ付けを有効化
        autotag = { enable = true },
        -- 必要な言語のパーサーをインストール
        ensure_installed = {
          "json",
          "javascript",
          "typescript",
          "tsx",
          "yaml",
          "html",
          "css",
          "markdown",
          "markdown_inline",
          "svelte",
          "graphql",
          "bash",
          "lua",
          "vim",
          "dockerfile",
          "gitignore",
          "ruby",
          "sql",
          "vimdoc",
          "luadoc",
        },
        -- 指定した言語パーサーを自動インストール
        auto_install = true,
      })
    end,
  },
}
