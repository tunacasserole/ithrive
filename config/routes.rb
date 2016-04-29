Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :policies
  resources :indications
  resources :agencies
end
