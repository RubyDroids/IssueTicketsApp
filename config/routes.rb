require "sidekiq/web"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  devise_for :users, controllers: { sessions: "accounts/sessions" }
  devise_for :admins, controllers: { sessions: "accounts/sessions" }

  resources :labels, only: %i[index show]
  resources :issues
  resources :projects

  # Defines the root path route ("/")
  root "pages#index"
end
