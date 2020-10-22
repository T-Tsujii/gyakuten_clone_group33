class Question < ApplicationRecord
    validates :title, presence: true, length: { maximum: 100}
    validates :content, presence: true, length: { maximum: 2000 }
end
