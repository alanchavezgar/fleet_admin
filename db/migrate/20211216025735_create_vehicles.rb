class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string    :identifier, null: false, unique: true
      t.integer   :current_location, default: 0
      t.float     :distance_traveled, default: 0.0
      t.float     :fuel_consumption, default: 0.0
      t.float     :fuel_consumed, default: 0.0
      t.boolean   :is_available, default: false
      t.references :city, name: :current_city
      t.references :route

      t.timestamps
    end
  end
end
