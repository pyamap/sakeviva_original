Rails.application.routes.draw do
  resources :images
  devise_for :users, :controllers => {
    confirmations: 'users/confirmations',
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  #devise_for :users, path_names: { sign_in: "login", sign_out: "logout"},


  root to: 'static_pages#index'

  get "category_first" => "categories#category_first" #categoryの個別ページのルーティング
  get "category_second" => "categories#category_second" #categoryの個別ページのルーティング
  get "category_third" => "categories#category_third" #categoryの個別ページのルーティング
  get "category_fourth" => "categories#category_fourth" #categoryの個別ページのルーティング

  patch "decide_address" => "addresses#decide_address" #複数住所から１つを選んでアドレスを更新する場合。
  get "confirmation_address" => "addresses#confirmation_address"
   #上記Patchでは/decide_addressでリロードした後にRouting Errorになる為、GETでページ取得できるようにする。

  patch "reservation" => "reservations#new"

  # post "purchase" => "api#purchase"
  patch "new_order" => "payjp#new"
  post "pay" => "payjp#pay" #pay.jpルーティング
  get "thank_you" => "payjp#thank_you"
  patch "payment_confirmation" => "payjp#index" #デフォルト住所変更の際のルーティング
  get "payment_confirmation" => "payjp#index" #住所新規登録の際のルーティング
  post "add_to_cart" => "products#add_to_cart"
  post "decrement_from_cart" =>"products#decrement_from_cart"
  post "empty_cart" => "products#empty_cart"
  post "delete_from_cart" => "products#delete_from_cart"
  get "current_cart" => "products#current_cart"
  get "interview_tanaka_noodle" => "static_pages#interview_tanaka_noodle"
  get "interview_souen_rush" => "static_pages#interview_souen_rush"
  get "interview_chiyo_seaweed" => "static_pages#interview_chiyo_seaweed"
  get "about_us" => "static_pages#about_us"
  post "shipping_fee" => "shippings#shipping_fee" #送料を計算する

  #カテゴリーページのURL
  get "category_sake" => "categories#category_sake"
  get "category_grocery" => "categories#category_grocery"
  get "category_food" => "categories#category_food"
  get "category_craft" => "categories#category_craft"
  get "trade_law" => "terms#trade_law"
  get "privacy" => "terms#privacy"
  get "shipping_fee" => "terms#shipping_fee"
  get "terms_of_service" => "terms#terms_of_service"

  #お問い合わせフォーム
  get "inquiry" => "inquiries#index"
  post "inquiry/confirm" => "inquiries#confirm"
  post "inquiry/thanks" => "inquiries#thanks"
  get "users" => "users/registrations#create"



  #管理画面
  get "mypage" => "static_pages#mypage"
  get "mypage_order" => "static_pages#mypage_order"
  get "mypage_address" => "static_pages#mypage_address"

  namespace :admin do
    root to: "products#index"
    get "/manage-listing/:id/photos/" => "products#photos", as: "manage_listing_photos"
    post "/status_update" => "products#status_update"
    resources :orders
    resources :products do
      collection {get "search"}
    end
  end

  resource :user do
    resources :addresses
    resources :orders
  end

  resources :addresses do
  end

  resources :theme_tags do
      resource :thumbnail
  end

  resources :types do
      resource :thumbnail
  end

  resources :products, only: [:show] do
    member do
      get :option_value
    end
  end

  resources :prices, only: [:show] do
  end

  resources :reservations do
  end

  resources :photos, only: [:create, :destroy]



  #match '*path' => 'application#error404', via: :all #ルーティングで定義されていないURLが指定された場合のエラー表示。

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
