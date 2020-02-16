class Micropost < ApplicationRecord
  validates :content, presence: true
end
