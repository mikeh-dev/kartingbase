class Micropost < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, length: { minimum: 0, maximum: 140 }, presence: true
end
