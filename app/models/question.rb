class Question < ApplicationRecord
    validates :title, presence: true, length: { maximum: 100}
    validates :detail, presence: true, length: { maximum: 5000 }
end
