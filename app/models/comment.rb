class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :user
  validates :body, presence: true, length: { maximum: 50 }
end
