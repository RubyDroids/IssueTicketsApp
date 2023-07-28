require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users
  mount Sidekiq::Web => "/sidekiq"

  # Auth
  get  "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  get  "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  resources :sessions, only: [:index, :show, :destroy]
  resource  :password, only: [:edit, :update]
  namespace :identity do
    resource :email,              only: [:edit, :update]
    resource :email_verification, only: [:show, :create]
    resource :password_reset,     only: [:new, :edit, :create, :update]
  end

  # Resources
  resources :labels, only: %i[index show]
  resources :issues
  resources :projects

  # Main path
  root "pages#index"
end
