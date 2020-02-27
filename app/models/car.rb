class Car < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many :reviews, dependent: :destroy
  validates :capacity, :brand, :kind, :price, :drive_train, presence: true
  geocoded_by :location
  validate :photo_validate
  after_validation :geocode, if: :will_save_change_to_location?

  def self.brands
    @cars = Car.all
    brands = @cars.map { |car| car.brand }
    return brands
  end

  def self.kinds
    @cars = Car.all
    kinds = @cars.map { |car| car.kind }
    return kinds
  end

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  def photo_validate
    if photo.attached? == false
      errors.add(:photo, 'is required')
    end
  end
end
