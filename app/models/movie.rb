class Movie < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  validates :title, :url, presence: true

  def liked_by?(user)
    likes.find_by(user_id: user.id).present?
  end
end
