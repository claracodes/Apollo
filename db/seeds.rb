# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Creating 10 new events'

10.times do |event|
  event = Event.new(name: Faker::Hipster.word, description: Faker::Hipster.sentence(10), category: Event::CATEGORY.sample, date: Faker::Date.forward(300), price: Faker::Commerce.price, venue_id: rand(1..5))
  event.save
end

puts 'Creating venues'
5.times do |venue|
  venue = Venue.new(name: Faker::Ancient.god, description: Faker::Hipster.sentence(10), phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.emai)
  venue.save
end

puts 'Creating users'
5.times do |user|
  user = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, host: false)
  user.save
end



