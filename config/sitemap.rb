# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://shop.jo-jima.com"

SitemapGenerator::Sitemap.create do

  add root_path

  add category_first_path
  add category_second_path
  add category_third_path
  add category_fourth_path

  add thank_you_path #thank_you
  add payment_confirmation_path #index_path #住所新規登録の際のルーティング
  add current_cart_path #current_cart
  add interview_tanaka_noodle_path #interview_tanaka_noodle
  add interview_souen_rush_path #interview_souen_rush
  add interview_chiyo_seaweed_path #interview_chiyo_seaweed
  add about_us_path #about_us

  #カテゴリーページのURL
  add category_sake_path #category_sake
  add category_grocery_path #category_grocery
  add category_food_path #category_food
  add category_craft_path #category_craft
  add trade_law_path #trade_law
  add privacy_path #privacy
  add shipping_fee_path #shipping_fee

  #お問い合わせフォーム
  add inquiry_path #index

  Product.all.each do |product|
    add product_path(product), changefreq: 'monthly'
  end

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
