class Question < ApplicationRecord
    validates :title, presence: true, length: { maximum: 100}
    validates :detail, presence: true, length: { maximum: 5000 }
    belongs_to :user
    has_many :answers, dependent: :destroy
    has_many :answered_users, through: :answers, source: :user
    def answered_by?(user)
    answers.find_by(user_id: user.id).present?
  end
end
