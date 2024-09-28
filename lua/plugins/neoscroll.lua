local setup, neoscroll = pcall(require, "neoscroll")
if not setup then
	return
end

neoscroll.setup({
	-- All these keys will be mapped to their corresponding default scrolling animation
	mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
	hide_cursor = true, -- Hide cursor while scrolling
	stop_eof = true, -- Stop at <EOF> when scrolling downwards
	respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
	cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
	easing_function = "quintic", -- Default easing function
	pre_hook = nil, -- Function to run before the scrolling animation starts
	post_hook = nil, -- Function to run after the scrolling animation ends
	performance_mode = false, -- Disable "Performance Mode" on all buffers.
})

-- キーマッピングのテーブルを作成
local mappings = {
	-- "sine"のイージング関数を使用
	["<C-u>"] = function()
		neoscroll.scroll(-vim.wo.scroll, true, 350, "sine")
	end,
	["<C-d>"] = function()
		neoscroll.scroll(vim.wo.scroll, true, 350, "sine")
	end,
	-- "circular"のイージング関数を使用
	["<C-b>"] = function()
		neoscroll.scroll(-vim.api.nvim_win_get_height(0), true, 500, "circular")
	end,
	["<C-f>"] = function()
		neoscroll.scroll(vim.api.nvim_win_get_height(0), true, 500, "circular")
	end,
	-- イージング関数を無効化
	["<C-y>"] = function()
		neoscroll.scroll(-0.10, false, 100)
	end,
	["<C-e>"] = function()
		neoscroll.scroll(0.10, false, 100)
	end,
	-- デフォルトのイージング関数を使用
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

-- マッピングを設定
local modes = { "n", "v", "x" }
for k, v in pairs(mappings) do
	vim.keymap.set(modes, k, v, { silent = true })
end
