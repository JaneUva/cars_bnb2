class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car
  validates :start_date, :end_date, presence: true
  validate :start_date_cannot_be_in_the_past
  validate :end_date_must_be_after_start_date

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "can't be in the past") if
      self.start_date < Date.today
  end

  def end_date_must_be_after_start_date
    errors.add(:end_date, "must be after start date") if
    self.end_date < self.start_date
  end

  def rental_days
    (self.end_date-self.start_date).to_i
  end

end
