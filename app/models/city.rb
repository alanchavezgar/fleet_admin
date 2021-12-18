class City < ApplicationRecord
  has_and_belongs_to_many :routes, inverse_of: :cities
  has_many :vehicles

  validates :name, presence: true
end
