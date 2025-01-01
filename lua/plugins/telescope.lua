return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-telescope/telescope-frecency.nvim",
      "kkharji/sqlite.lua",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local lga_actions = require("telescope-live-grep-args.actions")

      -- Telescope設定
      telescope.setup({
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
          },
          mappings = {
            i = {
              -- ["<C-k>"] = actions.move_selection_previous,
              -- ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<C-]>"] = actions.cycle_history_next,
              ["<C-[>"] = actions.cycle_history_prev,
              ["<C-c>"] = actions.close,
              ["<C-v>"] = function()
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-r>+", true, true, true))
              end,
            },
          },
          file_ignore_patterns = { ".git/", "tags" },
        },
        extensions = {
          live_grep_args = {
            auto_quoting = true,
            mappings = {
              i = {
                ["<C-l>"] = lga_actions.quote_prompt(),
                ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob=**/app/**" }),
                ["<C-w>"] = lga_actions.quote_prompt({ postfix = " -w " }),
              },
            },
          },
          frecency = {
            workspaces = {
              -- backend
              ["rails_controller"] = "./app/controllers",
              ["rails_model"] = "./app/models",
              ["rails_service"] = "./app/services",
              ["rails_schema"] = "./db/schema",
              ["rails_view"] = "./app/views",
              ["rails_view_partials"] = "./app/views/api/partials",
              ["rails_spec"] = "./spec",
              -- frontend
              ["next_page"] = "./src/pages",
              ["next_container"] = "./src/containers",
              ["next_component"] = "./src/components",
              ["next_model"] = "./src/models",
              ["next_util"] = "./src/utils",
              ["next_api"] = "./src/utils/api",
            },
          },
        },
      })

      -- Telescope拡張機能を読み込み
      telescope.load_extension("fzf")
      telescope.load_extension("live_grep_args")
      telescope.load_extension("frecency")

      -- プロジェクトごとのキーマッピング設定関数
      local function setup_project_keymaps()
        local current_dir = vim.fn.getcwd()
        local keymap = vim.keymap
        local frecency_str = "<Cmd>lua require('telescope').extensions.frecency.frecency({ workspace = '%s' })<CR>"
        local frecency_opt = { noremap = true, silent = true }

        if string.find(current_dir, "frontend") then
          -- frontend用のマッピング
          keymap.set("n", "<leader>pa", string.format(frecency_str, "next_page"), frecency_opt)
          keymap.set("n", "<leader>cn", string.format(frecency_str, "next_container"), frecency_opt)
          keymap.set("n", "<leader>cm", string.format(frecency_str, "next_component"), frecency_opt)
          keymap.set("n", "<leader>mo", string.format(frecency_str, "next_model"), frecency_opt)
          keymap.set("n", "<leader>ut", string.format(frecency_str, "next_util"), frecency_opt)
          keymap.set("n", "<leader>ap", string.format(frecency_str, "next_api"), frecency_opt)
        else
          -- backend用のマッピング
          keymap.set("n", "<leader>co", string.format(frecency_str, "rails_controller"), frecency_opt)
          keymap.set("n", "<leader>mo", string.format(frecency_str, "rails_model"), frecency_opt)
          keymap.set("n", "<leader>se", string.format(frecency_str, "rails_service"), frecency_opt)
          keymap.set("n", "<leader>sc", string.format(frecency_str, "rails_schema"), frecency_opt)
          keymap.set("n", "<leader>vi", string.format(frecency_str, "rails_view"), frecency_opt)
          keymap.set("n", "<leader>vp", string.format(frecency_str, "rails_view_partials"), frecency_opt)
          keymap.set("n", "<leader>sp", string.format(frecency_str, "rails_spec"), frecency_opt)
        end
      end

      -- VimEnterイベントでプロジェクトごとのキーマッピングをセットアップ
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = setup_project_keymaps,
      })
    end,
  },
}
