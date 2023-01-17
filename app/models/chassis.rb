class Chassis < ApplicationRecord
  validates :make, :model, :year, :stolen, presence: true
  belongs_to :user
end
