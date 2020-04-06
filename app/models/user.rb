class User < ApplicationRecord
  validates :name, presence: true  #to confirm all params are enterd while creation
  validates :email, presence: true
  validates :password, presence: true

  def pleasant_string
    "#{id}. Name : #{name}, Email : #{email} "
  end
end
