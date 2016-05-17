Rails.application.config.assets.paths << Rails.root.join("app", "assets", "vendors")
# Adding Webfonts to the Asset Pipeline

Rails.application.config.assets.precompile += %w( application.css application.js jquery.js)
