class Subject < ApplicationRecord
  has_and_belongs_to_many :books

  validates :title, :is_deleted, presence: true
  validates :title, length: { maximum: 50 }
end
