Rails.application.routes.draw do
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  resources :quotes
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  resources :dashboard
  resources :policies
  resources :indications
  resources :agencies
end
