# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.

Rails.application.config.assets.version = '1.0'

#static_pageのscssをプリコンパイルする。
Rails.application.config.assets.precompile += %w( desktop/web/static_pages.css )
Rails.application.config.assets.precompile += %w( desktop/web/products.css )
Rails.application.config.assets.precompile += %w( desktop/web/categories.css )
Rails.application.config.assets.precompile += %w( desktop/web/addresses.css )
Rails.application.config.assets.precompile += %w( desktop/web/devise.css )
Rails.application.config.assets.precompile += %w( desktop/web/errors.css )
Rails.application.config.assets.precompile += %w( desktop/web/shared.css )
Rails.application.config.assets.precompile += %w( desktop/web/api.css )
Rails.application.config.assets.precompile += %w( desktop/web/orders.css )
Rails.application.config.assets.precompile += %w( desktop/admin/orders.css )
Rails.application.config.assets.precompile += %w( desktop/web/terms.css )
Rails.application.config.assets.precompile += %w( desktop/web/inquiry.css )
Rails.application.config.assets.precompile += %w( toastr.css )
Rails.application.config.assets.precompile += %w( desktop/web/reviews.css )
Rails.application.config.assets.precompile += %w( slicknav.css )
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( toastr.js )
Rails.application.config.assets.precompile += %w( slicknav.js )
