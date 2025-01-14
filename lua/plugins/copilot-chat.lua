return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      debug = true, -- Enable debugging
      show_help = "yes",
      -- See Configuration section for rest
    },
    config = function()
      local select = require("CopilotChat.select")

      -- バッファの内容全体を使って Copilot とチャットする関数
      function CopilotChatBuffer()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
          require("CopilotChat").ask(input, { selection = select.buffer })
        end
      end

      function CopilotChatAllFiles()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
          require("CopilotChat").ask(input, { context = "files:full", model = "o1-mini" })
        end
      end

      function CopilotChatVisual()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
          require("CopilotChat").ask(input, { selection = select.visual })
        end
      end

      -- CopilotChat のヘルプアクションをカスタムコマンドとして定義
      vim.api.nvim_create_user_command("CopilotChatHelp", function()
        local actions = require("CopilotChat.actions")
        require("CopilotChat.integrations.telescope").pick(actions.help_actions())
      end, {})

      -- CopilotChat のプロンプトアクションをカスタムコマンドとして定義
      -- vim.api.nvim_create_user_command("CopilotChatPrompt", function()
      --   local actions = require("CopilotChat.actions")
      --   require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
      -- end, {})

      vim.api.nvim_set_keymap("n", "<leader>ccq", "<cmd>lua CopilotChatBuffer()<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>cca", "<cmd>lua CopilotChatAllFiles()<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("v", "<leader>ccv", "<cmd>lua CopilotChatVisual()<cr>", { noremap = true, silent = true })
      -- vim.api.nvim_set_keymap("n", "<leader>cch", "<cmd>CopilotChatHelp<CR>", { noremap = true, silent = true, desc = "CopilotChat - Help actions" })
      vim.api.nvim_set_keymap("v", "<leader>ccp", "<cmd>CopilotChatPrompt<CR>", { noremap = true, silent = true, desc = "CopilotChat - Prompt actions" })
      vim.api.nvim_set_keymap("n", "<leader>cco", "<cmd>CopilotChatOpen<CR>", { noremap = true, silent = true, desc = "CopilotChat - Open" })

      require("CopilotChat").setup({
        prompts = {
          Explain = {
            prompt = "/COPILOT_EXPLAIN コードを日本語で説明してください",
            mapping = '<leader>ce',
            description = "コードの説明をお願いする",
          },
          Review = {
            prompt = '/COPILOT_REVIEW コードを日本語でレビューしてください。',
            mapping = '<leader>cr',
            description = "コードのレビューをお願いする",
          },
          Fix = {
            prompt = "/COPILOT_FIX このコードには問題があります。バグを修正したコードを表示してください。説明は日本語でお願いします。",
            mapping = '<leader>cf',
            description = "コードの修正をお願いする",
          },
          Optimize = {
            prompt = "/COPILOT_REFACTOR 選択したコードを最適化し、パフォーマンスと可読性を向上させてください。説明は日本語でお願いします。",
            mapping = '<leader>co',
            description = "コードの最適化をお願いする",
          },
          Docs = {
            prompt = "/COPILOT_GENERATE 選択したコードに関するドキュメントコメントを日本語で生成してください。",
            mapping = '<leader>cd',
            description = "コードのドキュメント作成をお願いする",
          },
          Masking = {
            prompt = "変数名や名詞などすべてをマスキングしてアウトプットして",
            mapping = '<leader>cm',
            description = "コードのマスキングをお願いする",
          },
          Tests = {
            prompt = "/COPILOT_TESTS 選択したコードの詳細なユニットテストを書いてください。説明は日本語でお願いします。",
            mapping = '<leader>ct',
            description = "テストコード作成をお願いする",
          },
          FixDiagnostic = {
            prompt = 'コードの診断結果に従って問題を修正してください。修正内容の説明は日本語でお願いします。',
            mapping = '<leader>cn',
            description = "コードの修正をお願いする",
            selection = select.diagnostics,
          },
          -- Commit = {
          --   prompt =
          --     '実装差分に対するコミットメッセージを英語で記述してください。',
          --   mapping = '<leader>cco',
          --   description = "コミットメッセージの作成をお願いする",
          --   selection = select.gitdiff,
          -- },
          CommitStaged = {
            prompt = '> #git:staged\n\nWrite commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.',
            mapping = '<leader>cs',
            description = "ステージ済みのコミットメッセージの作成をお願いする",
          },
        },
      })
    end,
    -- See Commands section for default commands if you want to lazy load on them
  },
}
