class Book < ApplicationRecord
  has_and_belongs_to_many :subjects
  belong_to :user

  #validates :title, :author, 
end
