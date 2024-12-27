return {
  {
    "tpope/vim-rails",
    config = function()
      local directories = { "api_owner", "api", "api_admin", "web", "concerns" } -- ここに任意のディレクトリを追加

      -- プロジェクションを作成
      local projections = {}
      for _, dir in ipairs(directories) do
        projections[string.format("app/controllers/%s/*_controller.rb", dir)] = {
          command = "controller",
          affinity = "controller",
          alternate = string.format("spec/requests/%s/{}_spec.rb", dir),
        }
        projections[string.format("spec/requests/%s/*_spec.rb", dir)] = {
          command = "controller",
          affinity = "controller",
          alternate = string.format("app/controllers/%s/{}_controller.rb", dir),
        }
      end

      projections["app/models/*.rb"] = {
        command = "model",
        related = "spec/factories/{plural}.rb",
      }

      -- vim.g.rails_projections に設定
      vim.g.rails_projections = projections
    end,
  },
}
