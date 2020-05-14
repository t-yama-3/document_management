Rails.application.routes.draw do
  devise_for :users
  root to: 'documents#index'

  namespace :documents do
    resources :searches, only: :index
  end
  
  resources :documents, except: [:index] do
    member do
      get 'alt_edit'
      post 'alt_update'
      get 'alt_delete'
    end
    resources :comments, only: [:create]
  end

  resources :sections do
    collection do
      get 'owner'
    end
    member do
      get 'new_document'
    end
  end
  resources :users, only: [:index]
  resources :profiles, only: [:new, :create, :edit, :update, :show]
  resources :friends, only: [:create, :update] do
    member do
      put 'refusal_update'
    end
    resources :messages, only: [:new, :create, :edit, :update, :show]
  end
end
