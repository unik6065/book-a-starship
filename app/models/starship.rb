class Starship < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_many :renters, through: :rentals, source: :renter
  has_many :reviews, through: :rentals, dependent: :destroy
  has_many_attached :photos

  validates :name, presence: true
  validates :description, presence: true
  validates :price_per_day, numericality: { only_numeric: true }, presence: true
end
