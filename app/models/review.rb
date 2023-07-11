class Review < ApplicationRecord
  belongs_to :user
  attachment :review_image
end
