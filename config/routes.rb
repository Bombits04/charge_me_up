Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  #search
  get "search", to: "search#search", as: "search"
  get "serach_details/:id", to: "search#search_details", as: "search_details"

  resources :chg_spots do
    resources :comments, only: [:create]
    member do
      post "upvote"
      post "downvote"
    end
  end
end
