Rails.application.routes.draw do
  devise_for :users
  #get 'feeleru/index'
  root to: "feeleru#index"
end
