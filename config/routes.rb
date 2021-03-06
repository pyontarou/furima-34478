Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    collection do
      get 'search'
    end
    resources :messages, only: [:create]
    resources :orders, only: [:index, :create]
    resources :likes, only: [:create, :destroy]
  end
end