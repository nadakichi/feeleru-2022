Rails.application.routes.draw do
  devise_for :users
  root to: "feeleru#index"
end
