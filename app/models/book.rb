class Book < ApplicationRecord
  belongs_to :user
  belongs_to :collection
  has_many :translators

  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true
end
