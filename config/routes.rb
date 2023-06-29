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
  get '/patients/json', to: 'prescriptions#prescription_json'
  resources :events
  resources :doctors do
    resources :prescriptions, except: [:index, :new, :create, :edit, :update, :destroy]
  end
  resources :prescriptions, only: [:index, :new, :create, :edit, :update, :destroy]
  #CREATED BY ISAAC
    # Tasks routes/tasks_assigned_users nested routes
  resources :tasks, except: [:new] do
    member do
      patch :complete
    end
    resources :tasks_assigned_users, shallow: true
  end

  # Route to generate prescriptions csv download for client
  resources :prescriptions do
    collection { get :download }
  end
end
