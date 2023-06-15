Rails.application.routes.draw do
  #CREATED BY DEVISE
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
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
    # Tasks routes/tasks_assigned_users nested routes
  resources :tasks do
    member do
      patch :complete
    end
    resources :tasks_assigned_users, shallow: true
  end

end
