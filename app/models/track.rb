class Track < ApplicationRecord
  has_many :entries
  has_one_attached :image

  
end
