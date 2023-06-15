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
  #CREATED BY ISAAC
  resources :tasks
  resources :tasks_assigned_users
end
