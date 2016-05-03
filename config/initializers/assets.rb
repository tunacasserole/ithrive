Rails.application.config.assets.paths << Rails.root.join("app", "assets", "vendors")
# Adding Webfonts to the Asset Pipeline
config.assets.precompile << Proc.new { |path|
  if path =~ /\.(eot|svg|ttf|woff)\z/
    true
  end
}


Rails.application.config.assets.precompile += %w( application.css application.js)
