class User < ApplicationRecord
  def pleasant_string
    "#{id}. Name : #{name}, Email : #{email} "
  end
end
