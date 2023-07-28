class Review < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  attachment :review_image
  
  validates :rate, numericality: {
    less_than_or_equal_to: 10,
    greater_than_or_equal_to: 1}, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { minimum: 10, maximum: 500 }
  validates :total_charge, presence: true
  validates :total_time, presence: true, length: { minimum: 1}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
