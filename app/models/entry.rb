class Entry < ApplicationRecord
  belongs_to :user
  
  validates :sessionnotes, :run, presence: true
end
