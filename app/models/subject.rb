class Subject < ApplicationRecord
  has_and_belongs_to_many :books

  validates :title, presence: true
  validates :is_deleted, inclusion: { in: [true, false] }
  validates :title, length: { maximum: 50 }
end
