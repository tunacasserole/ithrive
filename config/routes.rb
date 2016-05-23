Rails.application.routes.draw do
  resources :email_messages
  devise_scope :user do
    root to: 'devise/sessions#new'
    post 'users/admin_create' => 'users#admin_create'
    # post 'users/admin_edit' => 'users#admin_edit'
  end
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  resources :health_attributes
  resources :user_health_attributes
  resources :profiles
  resources :notifications
  resources :dashboard
  resources :email_messages
  resources :email_templates
end
