class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string    :identifier, null: false, unique: true
      t.integer   :current_location
      t.float     :distance_traveled, default: 0.0
      t.float     :fuel_consumption
      t.float     :fuel_consumed
      t.boolean   :is_available

      t.timestamps

      t.belongs_to :cities
    end
  end
end
