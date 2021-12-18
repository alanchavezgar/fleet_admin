class Vehicle < ApplicationRecord
  validates :identifier, presence: true
  validates :fuel_consumption, presence: true

  # Sends the vehicle to a route
  # route - Route object
  def send_to_route(route_id)
    if self.is_available == true
      begin
        Route.find(route_id)
        self.route_id = route_id
        self.is_available = false
        self.save
      rescue e
        puts e
      end
    end
  end

  # If the vehicle is on route, simulates that the vehicle completed the route
  def finish_route
    @route = self.route_id ? Route.find(self.route_id) : nil
    if @route
      self.distance_traveled += @route.distance
      self.fuel_consumed += @route.distance * self.fuel_consumption
      self.is_available = true
      self.route_id = nil
      self.save
    end
  end
end
