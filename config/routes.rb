Rails.application.routes.draw do
  #CREATED BY DEVISE
  devise_for :users
  root to: "pages#home"
  #CREATED BY DAN
  resources :posts do
    resources :post_mentioned_users
  end
  resources :users
  #CREATED BY LOWELL
  resources :events
  resources :doctors do
    resources :prescriptions, except: [:index]
  end
  get "prescriptions", to: "prescriptions#index", as: "prescriptions"
  get "prescriptions/new", to: "prescriptions#new", as: "new_prescription"
  #CREATED BY ISAAC
  resources :tasks
  resources :tasks_assigned_users
end
