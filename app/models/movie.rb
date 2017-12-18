class Movie < ApplicationRecord
  has_many :movies_tags, dependent: :destroy
  has_many :tags, through: :movies_tags

  validates :name, :rating, presence: true
  validates :name, uniqueness: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  def tags_names
    tags.map(&:name).join(', ')
  end
end
