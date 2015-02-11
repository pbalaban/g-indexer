Rails.application.routes.draw do
  ## TODO: secure with devise or http auth
  mount Sidekiq::Web => '/sidekiq'

  resources :domains, only: [:index, :create, :destroy]

  root 'domains#index'
end
