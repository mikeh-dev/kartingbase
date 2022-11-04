class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  
  validates :user_id, presence: true
  validates :content, length: { minimum: 0, maximum: 140 }, presence: true
end
