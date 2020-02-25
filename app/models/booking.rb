class Booking < ApplicationRecord
  before_save :check_date_availability
  belongs_to :user
  belongs_to :car
  validates :start_date, :end_date, presence: true
  validate :start_date_cannot_be_in_the_past
  validate :end_date_is_after_start_date

  def check_date_availability
    errors.add(:start_date, "date already booked")
    bookings = Booking.where('start_date <= ? AND end_date >= ?', self.start_date, self.end_date)
    return bookings.empty?
  end

  def end_date_must_be_after_start_date
    errors.add(:end_date, "must be after start date") if
    self.end_date < self.start_date
  end
end
