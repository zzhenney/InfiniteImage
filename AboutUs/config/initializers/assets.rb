# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

#Precompiles round-about.css. Date written 6/18/18
Rails.application.config.assets.precompile += %w( round-about.css )
#Precompiles bootstrap files as well as custom additions found in overrrides.css
Rails.application.config.assets.precompile += %w( bootstrap.css )
Rails.application.config.assets.precompile += %w( overrides.css )
Rails.application.config.assets.precompile += %w( bootstrap.js )
Rails.application.config.assets.precompile += %w( jquery.js )
Rails.application.config.assets.precompile += %w( resume.css )
Rails.application.config.assets.precompile += %w( pages.css )
Rails.application.config.assets.precompile += %w( font-awesome.css )
Rails.application.config.assets.precompile += %w( _bootstrap-overrides.css )
Rails.application.config.assets.precompile += %w( _nav.css )

# Precompile additional assets.
# application.js, application.css.scss, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

# Precompile JS
Rails.application.config.assets.precompile += %w( resume.js )
Rails.application.config.assets.precompile += %w( cable.js )