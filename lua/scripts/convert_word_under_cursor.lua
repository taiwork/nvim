---@brief UpperCamelCase を snake_case に変換する関数
---@param word string: 変換する文字列
---@return string: 変換後の文字列
local function to_snake(word)
  -- 先頭文字は小文字に、それ以降の大文字は "_" + 小文字に変換
  return word:sub(1,1):lower() .. word:sub(2):gsub("(%u)", function(c)
    return "_" .. c:lower()
  end)
end

---@brief カーソル下の単語を変換して置換する関数
local function convert_word_under_cursor()
  -- カーソル下の単語を取得
  local original = vim.fn.expand("<cword>")
  if original == "" then
    vim.notify("変換する単語が見つかりません", vim.log.levels.WARN)
    return
  end

  -- 末尾が "Controller" なら除去する
  local processed = original
  if processed:sub(-10) == "Controller" then
    processed = processed:sub(1, -11) -- "Controller" の部分を除く
  end

  -- 除去後の単語を snake_case に変換
  local snake = to_snake(processed)

  -- 現在行から、カーソル下の元の単語のみ1箇所を置換
  local line = vim.api.nvim_get_current_line()
  local new_line = line:gsub(original, snake, 1)
  vim.api.nvim_set_current_line(new_line)

  vim.notify(string.format("Converted '%s' to '%s'", original, snake))
end

-- キーマップの設定 (<leader>us を押すと実行)
vim.keymap.set("n", "<leader>us", convert_word_under_cursor, { noremap = true, silent = true })

-- Example:
-- カーソル下の "CustomersHogeController" に対し <leader>us を押すと、
-- "customers_hoge" に変換されます

