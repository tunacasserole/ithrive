Rails.application.routes.draw do
  resources :quotes
  root to: 'visitors#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  resources :dashboard
  resources :policies
  resources :indications
  resources :agencies
end
