return {
  {
    "kevinhwang91/nvim-bqf",
    config = function()
      local fn = vim.fn

      -- クイックフィックスウィンドウのテキストフォーマッタ関数
      function _G.qftf(info)
        local items
        local ret = {}
        if info.quickfix == 1 then
          items = fn.getqflist({ id = info.id, items = 0 }).items
        else
          items = fn.getloclist(info.winid, { id = info.id, items = 0 }).items
        end
        local limit = 80
        local fnameFmt1, fnameFmt2 = "%-" .. limit .. "s", "…%." .. (limit - 1) .. "s"
        local validFmt = "%s │%5d:%-3d│%s %s"
        for i = info.start_idx, info.end_idx do
          local e = items[i]
          local fname = ""
          local str
          if e.valid == 1 then
            if e.bufnr > 0 then
              fname = fn.bufname(e.bufnr)
              if fname == "" then
                fname = "[No Name]"
              else
                fname = fname:gsub("^" .. vim.env.HOME, "~")
              end
              if #fname <= limit then
                fname = fnameFmt1:format(fname)
              else
                fname = fnameFmt2:format(fname:sub(1 - limit))
              end
            end
            local lnum = e.lnum > 99999 and -1 or e.lnum
            local col = e.col > 999 and -1 or e.col
            local qtype = e.type == "" and "" or " " .. e.type:sub(1, 1):upper()
            str = validFmt:format(fname, lnum, col, qtype, e.text)
          else
            str = e.text
          end
          table.insert(ret, str)
        end
        return ret
      end

      -- グローバルオプション設定
      vim.o.qftf = "{info -> v:lua._G.qftf(info)}"

      -- bqf設定
      require("bqf").setup({
        filter = {
          fzf = {
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--delimiter", "│" },
          },
        },
      })
    end,
  },
}
