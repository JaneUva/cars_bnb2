class Car < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many :reviews, dependent: :destroy
  validates :capacity, :brand, :kind, :price, :drive_train, presence: true
end
