# require "sidekiq/web"

Rails.application.routes.draw do
  # mount Sidekiq::Web => "/sidekiq"
  devise_for :users

  # Resources
  resources :labels, only: %i[index show]
  
  resources :issues do
    collection do
      put :toggle_status
    end
  end

  resources :projects

  # Main path
  root "issues#index"
end
