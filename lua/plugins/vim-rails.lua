return {
  {
    "tpope/vim-rails",
    config = function()
      vim.g.rails_projections = {
        ["app/controllers/api/*.rb"] = {
          command = "controller",
          affinity = "controller",
          alternate = "spec/requests/api/{}_spec.rb",
          test = "spec/requests/api/{}_spec.rb",
        },
        ["spec/requests/api/*_spec.rb"] = {
          command = "controller",
          affinity = "controller",
          alternate = "app/controllers/api/{}.rb",
        },
      }
    end,
  },
}
