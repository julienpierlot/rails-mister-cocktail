class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_one_attached :photo

  validates :name, uniqueness: true, presence: true
  validates :photo, attached: true, content_type: { in: 'image/png', message: 'is not a PNG' }
end
