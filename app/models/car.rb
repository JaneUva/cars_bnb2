class Car < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  validates :capacity, :brand, :type, :price, :drive_train, presence: true
end
