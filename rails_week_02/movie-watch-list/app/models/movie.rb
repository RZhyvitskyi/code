class Movie < ApplicationRecord
  scope :not_in_list, ->(list) { where.not(id: list.movies) }
  scope :search_by_title, ->(title) { where("lower(title) LIKE ?", "%#{title.downcase}%") }

  has_many :bookmarks, dependent: :restrict_with_error

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true, uniqueness: true
end
