Rails.application.routes.draw do
  post "/login", to: "session#login"
  post "/signup", to: "session#signup"

  resources :todos
end
