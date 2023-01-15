Rails.application.routes.draw do
  resources :fantasies
  resource :users, only: [:create]
  post "/login", to: "users#login"
end
 