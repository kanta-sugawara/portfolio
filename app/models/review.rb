class Review < ApplicationRecord
  belongs_to :user
  attachment :review_image
  validates :rate, numericality: {
    less_than_or_equal_to: 100,
    greater_than_or_equal_to: 1}, presence: true
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
