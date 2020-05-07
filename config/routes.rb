Rails.application.routes.draw do
  devise_for :users
  root to: 'documents#index'
  namespace :documents do
    resources :searches, only: :index
  end
  resources :documents, except: [:index]
  resources :sections
  resources :users, only: [:index]
end
