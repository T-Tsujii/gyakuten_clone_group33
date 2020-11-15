class User < ApplicationRecord
  has_many :read_texts, dependent: :destroy

  has_many :read_texted_movies, through: :read_texts, source: :movie
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
