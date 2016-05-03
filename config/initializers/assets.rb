Rails.application.config.assets.paths << Rails.root.join("app", "assets", "vendors")


Rails.application.config.assets.precompile += %w( application.css application.js)
