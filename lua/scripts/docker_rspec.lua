vim.api.nvim_create_user_command("DockerRspec", function()
	-- 現在のファイルの絶対パスを取得
	local absolute_file_path = vim.fn.expand("%:p")
	-- Gitリポジトリのルートパスを取得（例えば `git rev-parse --show-toplevel` を使う）
	local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
	-- 絶対パスからGitリポジトリのルートまでのパスを除外して相対パスを生成
	local relative_file_path = string.sub(absolute_file_path, string.len(git_root) + 2)

	-- Dockerコマンドを構築
	local docker_command = "docker-compose run --rm tk-lcl bundle exec rspec " .. relative_file_path
	-- LSPSagaのターミナルトグル機能を使ってコマンドを実行
	vim.cmd("Lspsaga term_toggle")
	vim.api.nvim_input(docker_command .. "<CR>")
end, {})
