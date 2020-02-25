class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car
  validates :start_date, :end_date, presence: true
  validate :start_date_cannot_be_in_the_past

  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "can't be in the past") if
      self.start_date < Date.today
  end
end
