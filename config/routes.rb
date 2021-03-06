Rails.application.routes.draw do
  devise_for :users
  root to: 'documents#index'

  namespace :documents do
    resources :searches, only: :index
  end
  
  resources :documents, except: [:index] do
    collection do
      get 'owner'
      get 'participation'
      get 'public'
      get 'user_id'
    end
    member do
      get 'alt_edit'
      post 'alt_update'
      get 'alt_delete'
    end
    resources :comments, only: [:create]
    resources :markings, only: [:create, :destroy]
  end

  resources :sections do
    collection do
      get 'owner'
    end
    member do
      get 'new_document'
    end
  end
  resources :users, only: [:index] do
    collection do
      get 'send_mail'
      get 'received_mail'
    end
  end
  resources :profiles, only: [:new, :create, :edit, :update, :show]
  resources :friends, only: [:create, :update] do
    member do
      put 'refusal_update'
    end
    resources :messages, only: [:index, :new, :create, :edit, :update, :show]
  end
end
