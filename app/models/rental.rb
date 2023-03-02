class Rental < ApplicationRecord
  belongs_to :renter, class_name: 'User'
  belongs_to :starship
  has_one :review, dependent: :destroy
  validates :start_date, presence: true, format: {
    with: /\A\d{4}-\d{2}-\d{2}\z/, message: "must be in the format YYYY-MM-DD"
  }
  validates :end_date, presence: true, format: {
    with: /\A\d{4}-\d{2}-\d{2}\z/, message: "must be in the format YYYY-MM-DD"
  }
  validates :price, presence: true
  validates :status, presence: true

  # status is an enum that can be either pending, accepted or declined,
  # it is set to pending by default in the database
  enum status: { pending: 0, accepted: 1, declined: 2 }
end
