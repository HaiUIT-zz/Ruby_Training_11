class User < ApplicationRecord
  has_one :role
  has_many :books
end
