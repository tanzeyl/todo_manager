Rails.application.routes.draw do
  
  get "todos", to: "todos#index"
  get "todos/create", to: "todos#create"
  get "todos/:id", to: "todos#show"

end
