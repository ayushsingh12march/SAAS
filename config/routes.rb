Rails.application.routes.draw do
  # todos#index refers to index method in todosController class

  # get "todos", to: "todos#index"
  # post "todos/create", to: "todos#create"
  # get "todos/:id", to: "todos#show"

  resources :todos
  resources :users
end
