class City < ApplicationRecord
  has_and_belongs_to_many :routes
  has_many :vehicles
end
