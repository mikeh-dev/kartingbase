class Chassis < ApplicationRecord
  validates :make, :model, :year, :number, presence: true
  belongs_to :user
end
