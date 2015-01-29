Rails.application.routes.draw do
  resources :domains, only: [:index, :create]

  root 'domains#index'
end
