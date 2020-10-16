class AwsText < ApplicationRecord
  validates :title, :content, presence: true
end
