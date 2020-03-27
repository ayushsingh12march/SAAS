class TodosController < ApplicationController
  def index
    render plain: "#{Todo.order(:due_date).map { |todo| todo.pleasant_string }}"
  end

  def show
    todo = Todo.find(params[:id])
    render plain: "#{todo.pleasant_string}"
  end
end
