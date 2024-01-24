# config/routes.rb

Rails.application.routes.draw do
  resources :items, only: [:index, :show, :create, :update, :destroy]
  resources :auctions, only: [:index, :show, :create, :update, :destroy]
  resources :carts, only: [:show] do
    post 'add_item/:item_id', to: 'carts#add_item', on: :member, as: :add_item
    member do
      get 'add_item/:item_id', to: 'carts#add_item', as: 'add_item'
    end
  end
end
