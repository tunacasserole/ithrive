Rails.application.routes.draw do
  devise_scope :user do
    root to: 'devise/sessions#new'
    post 'users/admin_create' => 'users#admin_create'
    # post 'users/admin_edit' => 'users#admin_edit'
  end
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  resources :profiles
  resources :dashboard
end
