class Movie < ApplicationRecord
  has_many :read_texts, dependent: :destroy
  has_many :read_texted_users, through: :likes, source: :user
  validates :title, :url, presence: true

  def read_text_by?(user)
    read_texts.find_by(user_id: user.id).present?
  end
end
