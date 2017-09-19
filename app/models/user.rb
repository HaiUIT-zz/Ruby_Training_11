class User < ApplicationRecord
  has_one :role
  has_many :books

  validates :user_id, :password, :name, :email, :role_id, :is_deleted, presence: true
  validates :user_id, length: { maximum: 20 }
  validates :password, length: { is: 60 }
  validates :name, :email, length: { maximum: 50 }
  validates :role_id, numericality: { only_integer: true }
  validates :email, email_format: true
end
