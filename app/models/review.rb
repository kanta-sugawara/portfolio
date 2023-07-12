class Review < ApplicationRecord
  belongs_to :user
  attachment :review_image
  validates :rate, numericality: {
    less_than_or_equal_to: 100,
    greater_than_or_equal_to: 1}, presence: true
end
