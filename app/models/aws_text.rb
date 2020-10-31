class AwsText < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  validates :title, :content, presence: true

  def likes_by?(user)
    likes.find_by(user_id: user.id).present?
  end
end
