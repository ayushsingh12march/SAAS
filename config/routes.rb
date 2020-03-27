Rails.application.routes.draw do
  # todos#index refers to index method in todosController class
  get "todos", to: "todos#index"
  get "todos/:id", to: "todos#show"
end
