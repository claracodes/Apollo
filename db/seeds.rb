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


puts 'Creating 2 hosts'
  host1 = User.new(host: true, first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  email: "host1@web.de", password: "password")
  host1.save
  host2 = User.new(host: true, first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  email: "host2@web.de", password: "password")
  host2.save

puts 'Creating 5 new venues'
5.times do |venue|
  venue = Venue.new(name: Faker::Ancient.god, description: Faker::Lorem.sentences(5),
                    phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email,
                    remote_photo_url: "https://source.unsplash.com/random/800x600")
  venue.save!
end

puts 'Creating 10 new events'
10.times do |event|
  event = Event.new(name: Faker::Hipster.word, description: Faker::Lorem.sentences(5),
                    category: Event::CATEGORY.sample, date: Faker::Date.forward(300),
                    price: Faker::Commerce.price, venue_id: Venue.all.ids.sample,
                    city: ['Berlin', 'Paris'].sample
                    remote_photo_url: "https://source.unsplash.com/random/800x600")
  event.save!
end

puts 'Creating 10 new users'
10.times do |user|
  user = User.new(first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  email: Faker::Internet.email,
                  password: "password")
  user.save!
end

puts 'Creating 10 new bookings'
10.times do |booking|
  @event = Event.all.sample
  @user = User.all.sample
  booking = Booking.new(event: @event, user: @user)
  booking.save!
end
