# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
puts "Destroying Users & Spaces..."

User.destroy_all
Space.destroy_all
puts "Creating Users & 5 Spaces each..."
5.times do
  user = User.create(email:Faker::Internet.email, password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  5.times do
    Space.create(name: Faker::Address.city, location: Faker::Address.street_address, hourly_rate: rand(300..350), user: user )
  end

end
puts "Seeding done!"
