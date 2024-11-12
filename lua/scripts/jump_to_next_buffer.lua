local M = {}

-- 定義: 現在のバッファから次のバッファにジャンプする関数
function M.jump_to_next_buffer_in_jumplist(direction)
  -- ジャンプリストと現在のジャンプ位置を取得
  local jumplist_and_position = vim.fn.getjumplist()
  local jumplist = jumplist_and_position[1]
  local current_jump_position = jumplist_and_position[2]

  -- direction引数に基づいてジャンプリストの検索範囲を決定
  local search_range
  if direction > 0 then
    search_range = vim.fn.range(current_jump_position + 1, #jumplist)
  else
    search_range = vim.fn.range(current_jump_position - 1, 1, -1)
  end

  -- 検索範囲内でループを開始
  for _, index in ipairs(search_range) do
    -- ジャンプリストの各エントリが現在のバッファと異なるバッファを指しているかを確認
    if jumplist[index] and jumplist[index].bufnr ~= vim.fn.bufnr("%") then
      -- ジャンプ先のバッファ番号と位置を取得
      local jump_bufnr = jumplist[index].bufnr
      local jump_lnum = jumplist[index].lnum

      -- ジャンプするバッファと行に移動
      vim.api.nvim_set_current_buf(jump_bufnr)
      vim.api.nvim_win_set_cursor(0, {jump_lnum, 0})

      -- 異なるバッファが見つかったのでループを終了
      break
    end
  end
  return true
end

return M
