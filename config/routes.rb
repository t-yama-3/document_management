Rails.application.routes.draw do
  devise_for :users
  root to: 'documents#index'
  namespace :documents do
    resources :searches, only: :index
  end
  
  resources :documents, except: [:index] do
    # collection do
    #   get 'new_with_section'
    # end
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
end
