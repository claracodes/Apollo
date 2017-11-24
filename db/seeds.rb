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
  venuegorki = Venue.new(name: "Gorki theater", city: "Berlin", address: "Am Festungsgraben 2, 10117 Berlin",
                     description: "The Maxim Gorki Theatre is a theatre in Berlin-Mitte
                     named after the Soviet writer, Maxim Gorky. In 2012, the Mayor of Berlin Klaus
                     Wowereit named Şermin Langhoff artist director of the theatre.",
                     phone: "030 202210", email: "ticket@gorki.de", user_id: host1.id,
                     remote_photo_url: "http://res.cloudinary.com/daqyyyytv/image/upload/v1511361809/gorki_s2kmxi.jpg")
  venuegorki.save

  venuekulturbrauerei = Venue.new(name: "Kulturbrauerei", city: "Berlin",
                    address: "Schönhauser Allee 36, 10435 Berlin",
                    description: "History brewery now an arts & entertainment complex with rock
                    concerts, shows & open-air events.", phone: "030 44352614",
                    email: "info@kulturbrauerei.de", user_id: host2.id,
                    remote_photo_url: "http://res.cloudinary.com/daqyyyytv/image/upload/v1511362463/photo-1494380147893-cab0a83aecbe_sgxpxm.jpg")
  venuekulturbrauerei.save

  venue3 = Venue.new(name: "Volksbühne", city: "Berlin", address: "Linienstraße 227,
                    10178 Berlin", description: "Die Volksbühne Berlin (vormals Volksbühne
                    am Rosa-Luxemburg-Platz) entstand 1890 während einer Gründungsversammlung des
                    Vereins Freie Volksbühne.", phone: "030 59303050",
                    email: "info@volksbuehne.de", user_id: host2.id,
                    remote_photo_url: "http://res.cloudinary.com/daqyyyytv/image/upload/v1511362463/photo-1494380147893-cab0a83aecbe_sgxpxm.jpg")
  venue3.save

  museum1 = Venue.new(name: "Bode Museum", city: "Berlin", address: "Am Kupfergraben, 10117 Berlin",
                    description: "Das Bode-Museum, 1904 als Kaiser-Friedrich-Museum eröffnet,
                    gehört zum Ensemble der Museumsinsel in Berlin und damit zum Weltkulturerbe der UNESCO.",
                    phone: "030 0599393",
                    email: "info@bodemuseum.de", user_id: host1.id,
                    remote_photo_url: "http://res.cloudinary.com/daqyyyytv/image/upload/v1511362463/photo-1494380147893-cab0a83aecbe_sgxpxm.jpg")
  museum1.save

  museum2 = Venue.new(name: "Historisches Museum", city: "Berlin", address: "Unter den Linden 2, 10117 Berlin",
                    description: 'The German Historical Museum, known by the acronym DHM, is a museum in Berlin, Germany devoted to German history. It describes itself as a place of "enlightenment and understanding of the shared history of Germans and Europeans', phone: "030 203040", email: "info@histomuseum.de", user_id: host2.id, remote_photo_url: "http://res.cloudinary.com/daqyyyytv/image/upload/v1511529978/hsitomuseum_gw85k7.jpg")
  museum2.save

  museum3 = Venue.new(name: "DDR Museum", city: "BerlKarl-Liebknecht-Str. 1, 10178 Berlin",
                    description: 'The DDR Museum is a museum in the centre of Berlin. The museum is located in the former governmental district of East Germany, right on the river Spree, opposite the Berlin Cathedral. The museum is the 11th most visited museum in Berlin.', phone: "030 003040", email: "info@ddrmuseum.de", user_id: host1.id, remote_photo_url: "http://res.cloudinary.com/daqyyyytv/image/upload/v1511530183/berlin-DDR-museum-Berlin1500x850_fibecx.jpg")
  museum3.save

  museum4 = Venue.new(name: "Neues Museum", city: "Bodestraße 1-3, 10178 Berlin",
                    description: 'The Neues Museum is a museum in Berlin, Germany, located to the north of the Altes Museum on Museum Island. It was built between 1843 and 1855 according to plans by Friedrich August Stüler, a student of Karl Friedrich Schinkel.', phone: "033 003040", email: "info@yesmuseum.de", user_id: host2.id, remote_photo_url: "http://res.cloudinary.com/daqyyyytv/image/upload/v1511530354/reference-neues-museum-berlin_onlikr.jpg")
  museum4.save

  museum5 = Venue.new(name: "People Museum", city: "Panoramastraße 1A, 10178 Berlin",
                    description: 'The People Museum is a museum in Berlin, Germany, located to the north of the Yepayepa Museum on Museum Island. It was built between 1843 and 1855 according to plans by Friedrich August Stüler, a student of Karl Friedrich Schinkel.', phone: "033 003040", email: "info@yesmuseum.de", user_id: host3.id, remote_photo_url: "")
  museum5.save



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
