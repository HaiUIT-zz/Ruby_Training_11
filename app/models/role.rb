class Role < ApplicationRecord
  has_and_belongs_to_many :permissions
  has_many :users

  validates :name, presence: true
  validates :is_deleted, inclusion: { in: [ true, false ] }
  validates :name, length: { maximum: 10 }
end
