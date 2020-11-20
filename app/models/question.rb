class Question < ApplicationRecord
    validates :title, presence: true, length: { maximum: 100}
    validates :detail, presence: true, length: { maximum: 5000 }
    belongs_to :user
    has_many :answers, dependent: :destroy

    # 質問にuserが回答している時は[true]、回答していない時は[false]
    def answerd_by?(user)
        answers.find_by(user_id: user.id).present?
    end
end
