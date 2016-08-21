# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w( static_pages.css ) #static_pageのscssをプリコンパイルする。
Rails.application.config.assets.precompile += %w( products.css )
Rails.application.config.assets.precompile += %w( categories.css )
Rails.application.config.assets.precompile += %w( addresses.css )
Rails.application.config.assets.precompile += %w( devise.css )
Rails.application.config.assets.precompile += %w( errors.css )
Rails.application.config.assets.precompile += %w( shared.css )
Rails.application.config.assets.precompile += %w( api.css )
Rails.application.config.assets.precompile += %w( orders.css )

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
