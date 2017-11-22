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

puts 'Creating 2 real venues'
  venuegorki = Venue.new(name: "Gorki theater", city: "Berlin", address: "Am Festungsgraben 2, 10117 Berlin", description: "The Maxim Gorki Theatre is a theatre in Berlin-Mitte named after the Soviet writer, Maxim Gorky. In 2012, the Mayor of Berlin Klaus Wowereit named Şermin Langhoff artist director of the theatre.", phone: "030 202210", email: "ticket@gorki.de", user_id: host1.id, remote_photo_url: "http://res.cloudinary.com/daqyyyytv/image/upload/v1511361809/gorki_s2kmxi.jpg")
  venuegorki.save
  venuekulturbrauerei = Venue.new(name: "kulturbrauerei", city: "Berlin", address: "Schönhauser Allee 36, 10435 Berlin", description: "History brewery now an arts & entertainment complex with rock concerts, shows & open-air events.", phone: "030 44352614", email: "info@kulturbrauerei.de", user_id: host2.id, remote_photo_url: "http://res.cloudinary.com/daqyyyytv/image/upload/v1511362463/photo-1494380147893-cab0a83aecbe_sgxpxm.jpg")
  venuekulturbrauerei.save

puts 'Creating 4 events (2 for each real venue)'
  event1 = Event.new(name: "LalouLand", description: Faker::Lorem.sentences(5),
    category: "theater", date: Faker::Date.forward(30),
    price: 22, venue_id: venuegorki.id, city: 'Berlin',
    remote_photo_url: 'https://images.unsplash.com/photo-1468866576576-de8a9bf61f92?auto=format&fit=crop&w=1863&q=60&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D')
  event1.save
  event2 = Event.new(name: "Gorki Supershow", description: Faker::Lorem.sentences(5),
    category: "theater", date: Faker::Date.forward(30),
    price: 25, venue_id: venuegorki.id, city: 'Berlin',
    remote_photo_url: 'https://images.unsplash.com/photo-1505823212735-223f81435f4e?auto=format&fit=crop&w=2211&q=60&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D')
  event2.save
  event3 = Event.new(name: "Clare Livecode", description: Faker::Lorem.sentences(5),
    category: "theater", date: Faker::Date.forward(30),
    price: 45, venue_id: venuekulturbrauerei.id, city: 'Berlin',
    remote_photo_url: 'https://images.unsplash.com/photo-1477281765962-ef34e8bb0967?auto=format&fit=crop&w=1864&q=60&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D')
  event3.save
  event4 = Event.new(name: "Waltz with Bashir", description: Faker::Lorem.sentences(5),
    category: "theater", date: Faker::Date.forward(30),
    price: 12, venue_id: venuekulturbrauerei.id, city: 'Berlin',
    remote_photo_url: 'https://images.unsplash.com/photo-1499720843949-d9e6f318dca0?auto=format&fit=crop&w=2250&q=60&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D')
  event4.save


# puts 'Creating 5 new venues'
# 5.times do |venue|
#   venue = Venue.new(name: Faker::Ancient.god, description: Faker::Lorem.sentences(5),
#                     phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email,
#                     remote_photo_url: "https://source.unsplash.com/random/800x600")
#   venue.save!
# end

puts 'Creating 10 new events'
10.times do |event|
  event = Event.new(name: Faker::Hipster.word, description: Faker::Lorem.sentences(5),
                    category: Event::CATEGORY.sample, date: Faker::Date.forward(300),
                    price: Faker::Commerce.price, venue_id: Venue.all.ids.sample,
                    city: ['Berlin', 'Paris'].sample,
                    remote_photo_url: "https://source.unsplash.com/random/800x60")
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
