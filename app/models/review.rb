class Review < ApplicationRecord
  belongs_to :rental
  # belongs_to :user, through: :rental
  # belongs_to :starship, through: :rental
  validates :rating, presence: true, numericality: {
    only_integer: true, greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }
  validates :content, presence: true
end
