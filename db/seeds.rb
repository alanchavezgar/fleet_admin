# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


city_a = City.create(name: "A")
city_b = City.create(name: "B")
city_c = City.create(name: "C")

Route.create(name: "A - B", distance: 1.0, city_ids: [city_a.id, city_b.id])
Route.create(name: "A - C", distance: 2.0, city_ids: [city_a.id, city_c.id])
Route.create(name: "B - C", distance: 4.0, city_ids: [city_b.id, city_c.id])