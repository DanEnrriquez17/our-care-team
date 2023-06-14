Rails.application.routes.draw do
  resources :tasks_assigned_users
  devise_for :users
  root to: "pages#home"
  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :post_mentioned_users
  end
  resources :events
end
