class Car < ApplicationRecord
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many :reviews, dependent: :destroy
  validates :capacity, :brand, :kind, :price, :drive_train, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def self.brands
    @cars = Car.all
    brands = @cars.map { |car| car.brand }
    return brands
  end

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
