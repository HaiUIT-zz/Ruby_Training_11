class Permission < ApplicationRecord
  has_and_belongs_to_many :roles

  validates :name, :is_deleted, presence: true
  validates :name, length: { maximum: 20 }
end
