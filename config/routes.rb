Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "businesses#index"
  
  resources :businesses do
    resources :orders, only: [:index, :create]
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: :create
      collection do
        get 'search'
      end
  end
  resources :users, only: [:show]
end
