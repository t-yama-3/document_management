Rails.application.routes.draw do
  devise_for :users
  root to: 'documents#index'
  resources :documents, except: [:index]
  resources :sections
end
