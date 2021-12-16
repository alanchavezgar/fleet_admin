class CreateJoinTableCityRoute < ActiveRecord::Migration[6.1]
  def change
    create_join_table :cities, :routes do |t|
      t.index [:city_id, :route_id], unique: true
    end
  end
end
