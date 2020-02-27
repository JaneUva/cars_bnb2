class Review < ApplicationRecord
  belongs_to :car
  belongs_to :user
  validates :content, presence: true
  validates :content, length: { minimum: 15 }
end
