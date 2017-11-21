# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Deleting all records from Database"
Booking.destroy_all
Event.destroy_all
Venue.destroy_all
User.destroy_all


puts 'Creating 15 new venues'
15.times do |venue|
  venue = Venue.new(name: Faker::Ancient.god, description: Faker::Lorem.sentences(5),
                    phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email,
                    remote_photo_url: "https://source.unsplash.com/random/800x600")
  venue.save!
end

puts 'Creating 40 new events'
40.times do |event|
  event = Event.new(name: Faker::Hipster.word, description: Faker::Lorem.sentences(5),
                    category: Event::CATEGORY.sample, date: Faker::Date.forward(300),
                    price: Faker::Commerce.price, venue_id: Venue.all.ids.sample,
                    city: Faker::Address.city,
                    remote_photo_url: "https://source.unsplash.com/random/800x600")
  event.save!
end

puts 'Creating 25 new users'
25.times do |user|
  user = User.new(first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  email: Faker::Internet.email,
                  password: "password")
  user.save!
end

puts 'Creating 40 new bookings'
60.times do |booking|
  @event = Event.all.sample
  @user = User.all.sample
  booking = Booking.new(event: @event, user: @user)
  booking.save!
end
