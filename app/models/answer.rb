class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question  
  validates :content, presence: true, length: { maximum: 5000 }
  validates :user_id, uniqueness: {
    scope: :question_id,
    message: "は同じ質問に２以上の回答はできません"
  }
end
