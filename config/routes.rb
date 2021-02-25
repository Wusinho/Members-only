Rails.application.routes.draw do
  resources :messages, only: [:new, :create, :index, :edit, :destroy]
  devise_for :users
  root 'messages#index'
  
end
