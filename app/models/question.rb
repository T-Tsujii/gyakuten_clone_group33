class Question < ApplicationRecord
    validates :title, presence: true, length: { maximum: 100}
    validates :detail, presence: true, length: { maximum: 5000 }
    belongs_to :user
    has_many :answers, dependent: :destroy
end
