class User < ApplicationRecord
  has_many :liked_movies, through: :likes, source: :movie
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
