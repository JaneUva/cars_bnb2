class Car < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  validates :capacity, :brand, :kind, :price, :drive_train, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
