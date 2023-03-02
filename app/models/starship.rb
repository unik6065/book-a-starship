require 'pry-byebug'
class Starship < ApplicationRecord
  belongs_to :loaner, class_name: 'User'
  has_many :rentals, dependent: :destroy
  has_many :renters, through: :rentals
  has_many :reviews, through: :rentals, dependent: :destroy
  has_many_attached :photos

  validates :name, presence: true
  validates :description, presence: true
  validates :price_per_day, numericality: { only_numeric: true }, presence: true


  def average_rate
    sum = 0
    rentals.each do |rental|
      sum += rental.review.rating
    end
    (sum.to_f / rentals.length).truncate(1)

  def attach_photos
    return if photos.blank?

    @starship.attach(photos)
    self.new_photos = []

  end
end
