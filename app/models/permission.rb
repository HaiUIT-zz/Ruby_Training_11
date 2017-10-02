class Permission < ApplicationRecord
  has_and_belongs_to_many :roles

  validates :name, presence: true
  validates :is_deleted, inclusion: { in: [ true, false ] }
  validates :name, length: { maximum: 20 }
end
