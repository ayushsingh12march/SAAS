class User < ApplicationRecord
  validates :name, :email, :password, presence: true  #to confirm all params are enterd while creation

  def pleasant_string
    "#{id}. Name : #{name}, Email : #{email} "
  end
end
