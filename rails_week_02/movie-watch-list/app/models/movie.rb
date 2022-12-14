class Movie < ApplicationRecord
  scope :not_in_list, ->(list) { where.not(id: list.movies) }
  scope :search_by_title, ->(title, list) { not_in_list(list).where("lower(title) LIKE ?", "%#{title.downcase}%") }

  has_many :bookmarks, dependent: :restrict_with_error
  has_many :reviews, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true, uniqueness: true
end
