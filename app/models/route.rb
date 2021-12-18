class Route < ApplicationRecord
  has_and_belongs_to_many :cities, inverse_of: :routes

  validates :name, presence: true
  validates :distance, presence: true
  validates :cities, presence: true
end
