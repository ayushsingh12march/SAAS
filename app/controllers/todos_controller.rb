class TodosController < ApplicationController
  def index
    render plain: "Hello, this is #{DateTime.now.to_s(:short)}"
  end
end
