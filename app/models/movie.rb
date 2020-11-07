class Movie < ApplicationRecord
  has_many :likes, dependent: :destroy
  validates :title, :url, presence: true
end
