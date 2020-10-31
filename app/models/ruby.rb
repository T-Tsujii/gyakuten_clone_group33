class Ruby < ApplicationRecord
  validates :title, :content, presence: true
end
