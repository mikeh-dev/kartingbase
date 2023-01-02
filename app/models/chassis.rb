class Chassis < ApplicationRecord
  validates :make, :model, :year, :stolen, presence: true

end
