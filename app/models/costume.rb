class Costume < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true, length: { minimum: 2 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { minimum: 6 }
end
