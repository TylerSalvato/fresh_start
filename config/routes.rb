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

  resources :carts, only: [:show, :add_item]
  resources :items, only: [:create, :show, :index, :destroy]
end

