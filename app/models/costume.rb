class Costume < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_many_attached :images
  has_many :reviews, dependent: :destroy, through: :bookings
  has_many :bookmarks, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true, length: { minimum: 2 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { minimum: 6 }

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: %i[name description],
    using: {
      tsearch: { prefix: true }
    }

  include CostumeConcern
end
