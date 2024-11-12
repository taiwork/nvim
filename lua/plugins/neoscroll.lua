return {
  {
    "karb94/neoscroll.nvim",
    config = function()
      -- neoscrollのセットアップ
      require("neoscroll").setup({
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true,
        stop_eof = true,
        respect_scrolloff = false,
        cursor_scrolls_alone = true,
        easing_function = "quintic",
        pre_hook = nil,
        post_hook = nil,
        performance_mode = false,
      })

      -- カスタムキーマッピング
      local mappings = {
        ["<C-u>"] = function()
          require("neoscroll").scroll(-vim.wo.scroll, true, 350, "sine")
        end,
        ["<C-d>"] = function()
          require("neoscroll").scroll(vim.wo.scroll, true, 350, "sine")
        end,
        ["<C-b>"] = function()
          require("neoscroll").scroll(-vim.api.nvim_win_get_height(0), true, 500, "circular")
        end,
        ["<C-f>"] = function()
          require("neoscroll").scroll(vim.api.nvim_win_get_height(0), true, 500, "circular")
        end,
        ["<C-y>"] = function()
          require("neoscroll").scroll(-0.10, false, 100)
        end,
        ["<C-e>"] = function()
          require("neoscroll").scroll(0.10, false, 100)
        end,
        ["zt"] = function()
          require("neoscroll").zt(300)
        end,
        ["zz"] = function()
          require("neoscroll").zz(300)
        end,
        ["zb"] = function()
          require("neoscroll").zb(300)
        end,
      }

      -- モードとマッピングの設定
      local modes = { "n", "v", "x" }
      for k, v in pairs(mappings) do
        vim.keymap.set(modes, k, v, { silent = true })
      end
    end,
  },
}
