class Book < ApplicationRecord
  belongs_to :collection
  has_many :translators

  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true
  validates :file, presence: true

  has_one_attached :file
end
