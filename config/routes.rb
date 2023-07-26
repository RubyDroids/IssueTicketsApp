Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  resources :projects

  # Defines the root path route ("/")
  root "pages#index"
end
