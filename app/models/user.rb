class User < ApplicationRecord
  has_many :costumes
  has_many :bookings
  has_one_attached :avatar

  validates :user_name, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :description, length: { minimum: 6 }
  validates :address, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
