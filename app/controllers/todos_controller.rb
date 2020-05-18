class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # render plain: Todo.order(:due_date).map { |todo| todo.pleasant_string }.join("\n")
    render "index"
  end

  def show
    todo = Todo.find(params[:id])
    render plain: "#{todo.pleasant_string}"
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due][:date])
    new_todo = Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
    )
    response_text = "New todo created, id : #{new_todo.id}"
    redirect_to todos_path
  end

  def update
    id = params[:id]
    todo = Todo.find(id)
    todo.completed = !todo.completed
    todo.save!
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.find(id)
    todo.destroy
    redirect_to todos_path
  end
end
