Rails.application.routes.draw do
  devise_for :users
  resources :items, only: [:index, :show, :create, :update, :destroy]
  resources :auctions, only: [:index, :show, :create, :update, :destroy]
  
  resources :carts, only: [:index, :show, :new, :create] do
    member do
      post 'add_item/:item_id', to: 'carts#add_item', as: 'add_item'

      root to: "home#index"

      authenticate :user do
        resources :carts, only: [:show, :add_item]
      end
      

    end
  end
end
