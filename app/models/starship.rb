class Starship < ApplicationRecord
  belongs_to :loaner, class_name: 'User'
  has_many :rentals, dependent: :destroy
  has_many :renters, through: :rentals
  has_many :reviews, through: :rentals, dependent: :destroy
  has_many_attached :photos

  validates :name, presence: true
  validates :description, presence: true
  validates :price_per_day, numericality: { only_numeric: true }, presence: true

  def attach_photos
    return if photos.blank?

    @starship.attach(photos)
    self.new_photos = []
  end
end
