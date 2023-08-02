vim.g.rails_projections = {
	["app/controllers/api/*.rb"] = {
		command = "controller",
		affinity = "controller",
		alternate = "spec/requests/api/{}_spec.rb",
	},
}
