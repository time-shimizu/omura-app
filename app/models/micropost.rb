class Micropost < ApplicationRecord
  validates :content, presence: true
  default_scope -> {order(created_at: :desc)}
end
