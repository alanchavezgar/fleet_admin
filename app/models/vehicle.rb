class Vehicle < ApplicationRecord
  belongs_to :city

  validates :identifier, presence: true
end
