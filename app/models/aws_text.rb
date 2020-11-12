class AwsText < ApplicationRecord
  has_many :liked_users, through: :likes, source: :user
  validates :title, :content, presence: true
end
