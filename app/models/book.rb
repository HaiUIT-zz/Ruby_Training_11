class Book < ApplicationRecord
  has_and_belongs_to_many :subjects
  belongs_to :user

  validates :title, :author, :first_published, :user_id, :created_on, presence: true
  validates :is_deleted, inclusion: { in: [true, false] }
  validates :title, :author, length: { maximum: 50 }
  validates :user_id, numericality: { only_integer: true }
  validates :first_published, :created_on, date: true

  def subjects_to_s
    subjects.collect(&:title).compact.reject(&:empty?).join(', ') if subjects
  end
end
