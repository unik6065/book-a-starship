class Starship < ApplicationRecord
  # belongs_to :user, foreign_key: "loaner_id"
  # has_many :rentals, dependent: :destroy
  # has_many :reviews, through: :rentals, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :price_per_day, numericality: { only_numeric: true }, presence: true
end
