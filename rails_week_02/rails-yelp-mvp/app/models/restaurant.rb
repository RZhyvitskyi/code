class Restaurant < ApplicationRecord
  AVAILABLE_CATEGORY = ["chinese", "italian", "japanese", "french", "belgian"]

  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: AVAILABLE_CATEGORY }
end
