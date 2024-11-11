-- ユーザーコマンドを作成
vim.api.nvim_create_user_command("RemoveCR", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local found = false

  for _, line in ipairs(lines) do
    if line:match("\r") then
      found = true
      break
    end
  end

  if found then
    vim.cmd(":%s/\r//g")
  end
end, {})
