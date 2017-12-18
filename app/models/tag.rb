class Tag < ApplicationRecord
  has_many :movies_tags, dependent: :destroy
  has_many :movies, through: :movies_tags

  validates :name, presence: true
  validates :name, uniqueness: true
end
