Rails.application.routes.draw do
  get "/" => 'home#index'
  resources :todos
  resources :users
  get "/signin" => "sessions#new", as: :new_session
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
