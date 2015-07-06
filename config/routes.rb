require 'resque/server'

Rails.application.routes.draw do

  devise_for :communities
  resources :communities

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
    :passwords     => "users/passwords",
    :omniauth_callbacks => "omniauth_callbacks"
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

  # For twitter omniauth
  #get '/auth/:provider/callback', :to => 'sessions#callback'
  #post '/auth/:provider/callback', :to => 'sessions#callback'
  #get '/logout' => 'sessions#destroy', :as => :logout
  # Because I becase crazy coding by my self. I'll leave these three here.
end
