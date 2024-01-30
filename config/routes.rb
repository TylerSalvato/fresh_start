Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'api/sessions'
  }

  devise_scope :user do
    post 'auth/sign_in', to: 'api/sessions#create'
  end

  resources :items, only: [:index, :show, :create, :update, :destroy]
  resources :auctions, only: [:index, :show, :create, :update, :destroy]

  resources :carts, only: [:index, :show, :new, :create] do
    member do
      post 'add_item/:item_id', to: 'carts#add_item', as: 'add_item'
    end
  end

  root to: "home#index"
  get 'about', to: 'about#index'

  authenticate :user do
    resources :carts, only: [:show, :add_item]
    resources :users, only: [:create]
  end

  post '/login',    to: 'sessions#create'
  post '/logout',   to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  post '/admins', to: 'admins#create'

  resources :admins, only: [:create, :show, :index] do 
    resources :items, only: [:create, :show, :index, :destroy]
  end
end
