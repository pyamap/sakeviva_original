Rails.application.routes.draw do
  resources :images
  devise_for :users, path_names: { sign_in: "login", sign_out: "logout"}
  root to: 'static_pages#index'

  get "category_first" => "categories#category_first" #categoryの個別ページのルーティング
  get "category_second" => "categories#category_second" #categoryの個別ページのルーティング
  get "category_third" => "categories#category_third" #categoryの個別ページのルーティング
  get "category_fourth" => "categories#category_fourth" #categoryの個別ページのルーティング

  patch "decide_address" => "addresses#decide_address" #複数住所から１つを選んでアドレスを更新する場合。
  get "confirmation_address" => "addresses#confirmation_address" #上記Patchでは/decide_addressでリロードした後にRouting Errorになる為、GETでページ取得できるようにする。

  namespace :admin do
    root to: "products#index"
    resources :products do
      collection {get "search"}
    end
  end

  resource :user do
    resources :addresses
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
end

  post "purchase" => "api#purchase"
  get "purchased" => "api#purchased"

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
