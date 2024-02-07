Rails.application.routes.draw do

  devise_scope :user do
    post '/auth', to: 'users/sessions#create'
  end

  devise_for :users, path: 'auth', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :items, only: [:index, :show, :create, :update, :destroy]
  resources :auctions, only: [:index, :show, :create, :update, :destroy]

  # resources :carts, only: [:index, :show, :new, :create] do
  #   member do
  #     post 'add_item/:item_id', to: 'carts#add_item', as: 'add_item'
  #   end
  # end

  root to: "home#index"
  get 'about', to: 'about#index'

  namespace :admin do
    # Your admin routes go here
    get 'dashboard', to: 'dashboard#index'
    # Add more routes as needed

    # If you want a specific URL prefix for your admin section, you can use `scope`
    scope '/admin' do
      # More admin routes...
    end
  end

  # Other routes...
end

  resources :carts, only: [:show, :add_item]
  resources :items, only: [:create, :show, :index, :destroy]
end

