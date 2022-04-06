Rails.application.routes.draw do
  devise_for :users
  root to: "businesses#index"
  
  resources :businesses do
    resources :orders, only: [:index, :create]
    resources :comments, only: :create
  end
end
