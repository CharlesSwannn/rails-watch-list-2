class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :restrict_with_exception
  has_many :lists, through: :bookmarks
  validates :title, uniqueness: true
  validates :overview, uniqueness: true
end
