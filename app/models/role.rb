class Role < ApplicationRecord
  has_and_belongs_to_many :permissions
  belongs_to :user

  validates :name, :is_deleted, presence: true
  validates :name, length: { maximum: 10 }
end
