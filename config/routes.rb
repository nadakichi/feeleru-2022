Rails.application.routes.draw do
  devise_for :users
  root to: "businesses#index"
  
  resources :businesses
end
