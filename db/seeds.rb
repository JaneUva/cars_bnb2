# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "creating cars"

people = [2, 3, 4, 5]
price = (0..100)
15.times do
  Car.create(
    capacity: people.sample,
    type: Faker::Vehicle.car_type,
    brand: Faker::Vehicle.make_and_model,
    online: true,
    drive_train: Faker::Vehicle.transmission,
    price: price.sample # or price: rand(1..100)
    )
end

