class Review < ApplicationRecord
  belongs_to :car
  validates :content, lenght: { minimum: 15 }
end
