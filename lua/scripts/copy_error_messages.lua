-- コマンドを定義
vim.api.nvim_create_user_command("CopyMessages", function()
	vim.cmd("redir @+")
	vim.cmd("messages")
	vim.cmd("redir END")
end, {})
