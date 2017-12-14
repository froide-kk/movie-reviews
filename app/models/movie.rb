class Movie < ApplicationRecord
  validates :name, :rating, presence: true
  validates :name, uniqueness: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
