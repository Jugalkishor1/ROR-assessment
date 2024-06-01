Rails.application.routes.draw do
  get 'news', to: 'news#index'
  
  resources :posts do
    resources :comments, only: [:new, :create]
  end

  put 'unlike_post', to: 'likes#unlike_post'
  
  patch 'unlike_post', to: 'likes#unlike_post'

  resources :likes, only: [:create]

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "posts#index"
end
