class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: Todo.order(:due_date).map { |todo| todo.pleasant_string }.join("\n")
  end

  def show
    todo = Todo.find(params[:id])
    render plain: "#{todo.pleasant_string}"
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
    )
    response_text = "New todo created, id : #{new_todo.id}"
    render plain: response_text
  end
end
