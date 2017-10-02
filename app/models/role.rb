class Role < ApplicationRecord
  has_and_belongs_to_many :permissions
  belongs_to :user

  validates :name, presence: true
  validates :is_deleted, inclusion: { in: [ true, false ] }
  validates :name, length: { maximum: 10 }
end
