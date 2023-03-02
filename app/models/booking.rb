class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :costume
  has_one :review

  validates :start_date, :end_date, presence: true, if: :correct_date?
  validates :status, presence: true

  def correct_date?
    errors.add :end_date, "must be after start date" if end_date < start_date
  end
end
