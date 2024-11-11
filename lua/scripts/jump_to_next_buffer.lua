local M = {}

-- 定義: 現在のバッファから次のバッファにジャンプする関数
function M.jump_to_next_buffer_in_jumplist(direction)
  -- ジャンプリストと現在のジャンプ位置を取得
  local jumplist_and_position = vim.fn.getjumplist()
  local jumplist = jumplist_and_position[1]
  local current_jump_position = jumplist_and_position[2]

  -- direction引数に基づいてジャンプコマンドとその文字表現を決定
  local jump_command_string = direction > 0 and "<C-O>" or "<C-I>"
  local jump_command_character = direction > 0 and "^O" or "^I"

  -- direction引数に基づいてジャンプリストの検索範囲を決定
  local search_range = direction > 0 and vim.fn.range(current_jump_position + 1, #jumplist)
    or vim.fn.range(current_jump_position - 1, 0, -1)

  -- 検索範囲内でループを開始
  for _, index in ipairs(search_range) do
    -- ジャンプリストの各エントリが現在のバッファと異なるバッファを指しているかを確認
    if jumplist[index]["bufnr"] ~= vim.fn.bufnr("%") then
      -- ジャンプする距離（回数）を計算
      local jump_distance = (index - current_jump_position) * direction

      -- ジャンプコマンドとジャンプ回数を表示
      print("Executing " .. jump_command_string .. " " .. jump_distance .. " times.")

      -- 計算したジャンプ回数分、ジャンプコマンドを実行
      vim.api.nvim_command("silent normal! " .. jump_distance .. jump_command_character)

      -- 異なるバッファが見つかったのでループを終了
      break
    end
  end
  return true
end

return M
