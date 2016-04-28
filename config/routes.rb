Rails.application.routes.draw do
  resources :policies
  resources :indications
  resources :agencies
  resources :user_profiles
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
