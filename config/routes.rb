Rails.application.routes.draw do
  post "/login", to: "sessions#login"
  post "/signup", to: "session#signup"

  resources :todos
end
