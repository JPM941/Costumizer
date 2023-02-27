class User < ApplicationRecord
  has_many :costumes
  has_many :bookings

  validates :user_name, presence: true, uniqueness: true
  validates :description, length: { minimum: 6 }
  validates :address, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
