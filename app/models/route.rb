class Route < ApplicationRecord
  has_and_belongs_to_many :cities

  validates :name, presence: true
  validates :distance, presence: true
end
