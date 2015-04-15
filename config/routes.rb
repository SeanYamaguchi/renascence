require 'resque/server'

Rails.application.routes.draw do

  resources :blogs

  namespace :users do
    namespace :user_profiles do
      resources :avatars
    end
  end

  resources :documents

  namespace :posts do
    resources :pictures
  end

  namespace :posts do
    resources :videos
  end

  namespace :posts do
    resources :documents
  end

  namespace :admin_users do
    resources :mailmagazines
  end

  devise_for :admin_users

  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords"
  }

  namespace :users do 
    get 'users/index'
    get 'users/:name', :to => 'users#show'
  end
  get 'static_pages/home'

  get 'static_pages/company'

  get 'static_pages/organization'

  get 'static_pages/contact'

  get 'static_pages/logo'

  get 'static_pages/job'

  get 'static_pages/sitemap'

  get 'static_pages/google-web-master' => 'static_pages#google2fce42d86d6074a7.html'

  root to: 'static_pages#company', :layout => "layouts/slide"
  
  get 'inquiry' => 'inquiry#index'              # 入力画面
  post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post 'inquiry/thanks' => 'inquiry#thanks'     # 送信完了画面

  resources :posts

  get 'google' => 'static_pages#google'

  mount Resque::Server.new, at: "/resque"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
