Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'api/sessions'
  }

  devise_scope :user do
    post 'auth/sign_in', to: 'sessions#create'
  end

  resources :items, only: [:index, :show, :create, :update, :destroy]
  resources :auctions, only: [:index, :show, :create, :update, :destroy]

  resources :carts, only: [:index, :show, :new, :create] do
    member do
      post 'add_item/:item_id', to: 'carts#add_item', as: 'add_item'
    end
  end

  root to: "home#index"

  authenticate :user do
    resources :carts, only: [:show, :add_item]
    resources :users, only: [:create]
  end
end
