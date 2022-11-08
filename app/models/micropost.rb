class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  has_one_attached :image do |attachable|
    attachable.variant :display, resize_to_limit: [500, 500]
  end
  validates :user_id, presence: true
  validates :content, length: { minimum: 0, maximum: 140 }, presence: true
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
    message: "must be a valid image format" },
size:         { less_than: 5.megabytes,
    message:   "should be less than 5MB" }

end
