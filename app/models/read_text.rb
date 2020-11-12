class ReadText < ApplicationRecord
  belongs_to :user
  belongs_to :aws_text
  validates :user_id, uniqueness: {
                        scope: :aws_text_id,
                      }
end
