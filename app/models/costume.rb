class Costume < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :image

  validates :name, presence: true, length: { minimum: 2 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { minimum: 6 }
end
