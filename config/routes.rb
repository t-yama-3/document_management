Rails.application.routes.draw do
  root to: 'documents#index'
  resource :documents, except: [:index]
end
