Rails.application.routes.draw do
  ## TODO: secure with devise or http auth
  mount Sidekiq::Web => '/sidekiq'

  resources :domains, only: [:index, :create, :destroy]
  resources :projects, only: [:index, :create, :edit, :update, :destroy]
  resources :backlinks, only: [:index, :create, :edit, :update, :destroy]

  root 'backlinks#index'
end
