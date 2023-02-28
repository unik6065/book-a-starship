class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :starship
  has_many :reviews, dependent: :destroy
  validates :start_date, presence: true, format: {
    with: /\A\d{4}-\d{2}-\d{2}\z/, message: "must be in the format YYYY-MM-DD"
  }
  validates :end_date, presence: true, format: {
    with: /\A\d{4}-\d{2}-\d{2}\z/, message: "must be in the format YYYY-MM-DD"
  }
  validates :price, presence: true
end
