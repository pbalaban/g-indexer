Rails.application.routes.draw do
  ## TODO: secure with devise or http auth
  mount Sidekiq::Web => '/sidekiq'

  resources :domains, only: [:index, :create, :destroy]
  resources :email_addresses, only: [:index, :create, :destroy]
  resources :backlinks, only: [:index, :create, :destroy]

  root 'backlinks#index'
end
