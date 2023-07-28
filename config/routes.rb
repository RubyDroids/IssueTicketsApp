require "sidekiq/web"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"
  devise_for :users

  # Resources
  resources :labels, only: %i[index show]
  resources :issues
  resources :projects

  # Main path
  root "issues#index"
end
