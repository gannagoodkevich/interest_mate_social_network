# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.

Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w(application.js)
Rails.application.config.assets.precompile += %w( friendship_requests.css )
Rails.application.config.assets.precompile += %w( users.css )
Rails.application.config.assets.precompile += %w( friendships.css )
Rails.application.config.assets.precompile += %w( posts.css )
Rails.application.config.assets.precompile += %w( photos.css )
Rails.application.config.assets.precompile += %w( comments.css )
Rails.application.config.assets.precompile += %w( devise/registrations.css )
Rails.application.config.assets.precompile += %w( devise/sessions.css )
Rails.application.config.assets.precompile += %w( tags.css )
Rails.application.config.assets.precompile += %w( interests.css )
Rails.application.config.assets.precompile += %w( users/omniauth_callbacks.css )
Rails.application.config.assets.precompile += %w( users/sessions.css )
Rails.application.config.assets.precompile += %w( users/registrations.css )

# Precompile additional assets.
# application.js, application.css.scss, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
