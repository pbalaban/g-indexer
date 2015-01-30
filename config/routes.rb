require 'resque/server'

Rails.application.routes.draw do
  mount Resque::Server.new, at: '/resque'

  resources :domains, only: [:index, :create]

  root 'domains#index'
end
