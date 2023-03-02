class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :rentals
  has_many :reviews, through: :rentals
  has_many :starships
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  def owner?
    Starship.where(loaner: self).length >= 1
  end

  def owner_of?(starship)
    self == Starship.find(starship.id).loaner
  end
end
