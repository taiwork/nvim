return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      -- lualineとテーマの読み込み
      local lualine = require("lualine")
      local lualine_nightfly = require("lualine.themes.nightfly")

      -- テーマ用の新しい色
      local new_colors = {
        blue = "#65D1FF",
        green = "#3EFFDC",
        violet = "#FF61EF",
        yellow = "#FFDA7B",
        black = "#000000",
      }

      -- テーマの色を変更
      lualine_nightfly.normal.a.bg = new_colors.blue
      lualine_nightfly.insert.a.bg = new_colors.green
      lualine_nightfly.visual.a.bg = new_colors.violet
      lualine_nightfly.command = {
        a = {
          gui = "bold",
          bg = new_colors.yellow,
          fg = new_colors.black,
        },
      }

      -- カスタムテーマでlualineをセットアップ
      lualine.setup({
        options = {
          theme = lualine_nightfly,
        },
      })
    end,
  },
}
