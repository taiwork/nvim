return {
  {
    "karb94/neoscroll.nvim",
    config = function()
      local setup, neoscroll = pcall(require, "neoscroll")
      if not setup then
        return
      end

      -- neoscrollの基本設定
      neoscroll.setup({
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

      -- カスタムキーマッピングの設定
      local mappings = {
        ["<C-u>"] = function()
          neoscroll.scroll(-vim.wo.scroll, true, 350, "sine")
        end,
        ["<C-d>"] = function()
          neoscroll.scroll(vim.wo.scroll, true, 350, "sine")
        end,
        ["<C-b>"] = function()
          neoscroll.scroll(-vim.api.nvim_win_get_height(0), true, 500, "circular")
        end,
        ["<C-f>"] = function()
          neoscroll.scroll(vim.api.nvim_win_get_height(0), true, 500, "circular")
        end,
        ["<C-y>"] = function()
          neoscroll.scroll(-0.10, false, 100)
        end,
        ["<C-e>"] = function()
          neoscroll.scroll(0.10, false, 100)
        end,
        ["zt"] = function()
          neoscroll.zt(300)
        end,
        ["zz"] = function()
          neoscroll.zz(300)
        end,
        ["zb"] = function()
          neoscroll.zb(300)
        end,
      }

      -- キーマッピングの設定
      local modes = { "n", "v", "x" }
      for k, v in pairs(mappings) do
        vim.keymap.set(modes, k, v, { silent = true })
      end
    end,
  },
}
