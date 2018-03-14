Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # users
  resources :users, only: [:new, :show, :edit, :index, :destroy]
  post 'sub_user', to: 'users#create'
  patch 'user/:id/update', to: 'users#update', as: :user_update

  # files
  get 'user/:id/files/new', to: 'files#new', as: :user_new_file
  post 'user/:id/files', to: 'files#create', as: :user_files

  # root
  root to: 'users#index'
end
