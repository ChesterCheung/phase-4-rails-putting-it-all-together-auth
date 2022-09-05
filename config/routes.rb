Rails.application.routes.draw do
  #USERS
  post "/signup", to: "users#create"
  get "/me", to: "users#show"
  #SESSIONS
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  #RECIPES
  get "/recipes", to: "recipes#index"
  post "/recipes", to: "recipes#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
