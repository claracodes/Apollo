# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'nokogiri'
require 'open-uri'

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

puts 'Creating 3 theater and 7 museums real venues'
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

museum3 = Venue.new(name: "DDR Museum", city: "Berlin", address: "BerlKarl-Liebknecht-Str. 1, 10178 Berlin",
  description: 'The DDR Museum is a museum in the centre of Berlin. The museum is located in the former governmental district of East Germany, right on the river Spree, opposite the Berlin Cathedral. The museum is the 11th most visited museum in Berlin.', phone: "030 003040", email: "info@ddrmuseum.de", user_id: host1.id, remote_photo_url: "http://res.cloudinary.com/daqyyyytv/image/upload/v1511530183/berlin-DDR-museum-Berlin1500x850_fibecx.jpg")
museum3.save

museum4 = Venue.new(name: "Neues Museum", city: "Berlin", address: "Bodestraße 1-3, 10178 Berlin",
  description: 'The Neues Museum is a museum in Berlin, Germany, located to the north of the Altes Museum on Museum Island. It was built between 1843 and 1855 according to plans by Friedrich August Stüler, a student of Karl Friedrich Schinkel.', phone: "033 003040", email: "info@yesmuseum.de", user_id: host2.id, remote_photo_url: "http://res.cloudinary.com/daqyyyytv/image/upload/v1511530354/reference-neues-museum-berlin_onlikr.jpg")
museum4.save

museum5 = Venue.new(name: "People Museum", city: "Berlin", address: "Panoramastraße 1A, 10178 Berlin",
  description: 'The People Museum is a museum in Berlin, Germany, located to the north of the Yepayepa Museum on Museum Island. It was built between 1843 and 1855 according to plans by Friedrich August Stüler, a student of Karl Friedrich Schinkel.', phone: "033 003040", email: "info@yesmuseum.de", user_id: host1.id)
museum5.save

museum6 = Venue.new(name: "City Museum Berlin", city: "Berlin", address: "Bodestraße 1-3, 10178 Berlin",
  description: 'The City Museum is located in the former governmental district of East Germany, right on the river Spree, opposite the Berlin Cathedral. The museum is the 11th most visited museum in Berlin.', phone: "033 003040", email: "info@yesmuseum.de", user_id: host2.id)
museum6.save

museum7 = Venue.new(name: "Pergamon Museum", city: "Berlin", address: "Panoramastraße 1A, 10178 Berlin",
  description: 'The Pergamon Museum is situated on the Museum Island in Berlin. The building was designed by Alfred Messel and Ludwig Hoffmann and was constructed over a period of twenty years, from 1910 to 1930.', phone: "033 008040", email: "info@ymuseum.de", user_id: host1.id)
museum7.save



puts 'Creating 4 theater and 8 exhibitions (events) (2 for each real venue)'
event1 = Event.new(name: "LalouLand", description: "The most flawless event in town is presented by the best theater company",
  category: "theater", date: Faker::Date.forward(30),
  price: 22, mood: "Romantic", venue_id: venuegorki.id, city: 'Berlin',
  remote_photo_url: 'https://images.unsplash.com/photo-1468866576576-de8a9bf61f92?auto=format&fit=crop&w=1863&q=60&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D')
event1.save
event2 = Event.new(name: "Gorki Supershow", description: "You can only enjoy this masterpiece by eating as much as possible",
  category: "theater", date: Faker::Date.forward(30),
  price: 25, mood: "Wild", venue_id: venuegorki.id, city: 'Berlin',
  remote_photo_url: 'https://images.unsplash.com/photo-1505823212735-223f81435f4e?auto=format&fit=crop&w=2211&q=60&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D')
event2.save
event3 = Event.new(name: "Clare Livecode", description: "Dance, street art and comedy: the best recipe for an enjoyable night",
  category: "theater", date: Faker::Date.forward(30),
  price: 45, mood: "Nerdy", venue_id: venuekulturbrauerei.id, city: 'Berlin',
  remote_photo_url: 'https://images.unsplash.com/photo-1477281765962-ef34e8bb0967?auto=format&fit=crop&w=1864&q=60&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D')
event3.save
event4 = Event.new(name: "Waltz with Bashir", description: "Nobody can ride the stage as this comedian performer, highly recommended",
  category: "theater", date: Faker::Date.forward(30),
  price: 12, mood: "Dramatic", venue_id: venuekulturbrauerei.id, city: 'Berlin',
  remote_photo_url: 'https://images.unsplash.com/photo-1499720843949-d9e6f318dca0?auto=format&fit=crop&w=2250&q=60&ixid=dW5zcGxhc2guY29tOzs7Ozs%3D')
event4.save



exhibition1 = Event.new(name: "The Old Collection", description: "A really rare collection of historical objects",
  category: "exhibition", tags: "Traditional", date: Faker::Date.forward(1),
  price: 9, mood: "Nerdy", venue_id: museum1.id, city: 'Berlin',
  remote_photo_url: 'http://res.cloudinary.com/daqyyyytv/image/upload/v1511534724/giammarco-boscaro-380907_umoxcn.jpg')
exhibition1.save

exhibition2 = Event.new(name: "Repressed Memory", description: "The exhibition presents examples demonstrating the difficulties of establishing monuments and memorial sites for the Nazi crimes in West Berlin",
  category: "exhibition", tags: "Dramatic", date: Faker::Date.forward(1),
  price: 5, mood: "Glamorous", venue_id: museum2.id, city: 'Berlin',
  remote_photo_url: 'http://res.cloudinary.com/daqyyyytv/image/upload/v1511534720/fabrizio-verrecchia-180315_vm4bsx.jpg')
exhibition2.save

exhibition3 = Event.new(name: "Lucy Skaer", description: "In autumn 2017, KW Institute for Contemporary Art presents the first solo exhibition by British artist Lucy Skaer in Berlin. Comprising of a large body",
  category: "exhibition", tags: "Humor", date: Faker::Date.forward(1),
  price: 17, mood: "Glamorous", venue_id: museum3.id, city: 'Berlin',
  remote_photo_url: 'http://res.cloudinary.com/daqyyyytv/image/upload/v1511534723/russn_fckr-66974_dfqm37.jpg')
exhibition3.save

exhibition4 = Event.new(name: "Tristan", description: "Tyrannosaurus rex is the superstar among dinosaurs. Between 1902 and today, around 50 specimens have been discovered in North America, none of them complete. ",
  category: "exhibition", tags: "Romantic", date: Faker::Date.forward(1),
  price: 33, mood: "Romantic", venue_id: museum4.id, city: 'Berlin',
  remote_photo_url: 'http://res.cloudinary.com/daqyyyytv/image/upload/v1511534725/stacy-wyss-702_yico7j.jpg')
exhibition4.save

exhibition5 = Event.new(name: "Craving for New Pictures", description: "The exhibition on the history of popular graphic news media presents three business models for the production.",
  category: "exhibition", tags: "Modern", date: Faker::Date.forward(1),
  price: 45, mood: "Wild", venue_id: museum5.id, city: 'Berlin',
  remote_photo_url: 'http://res.cloudinary.com/daqyyyytv/image/upload/v1511534706/arturo-castaneyra-396441_cowiwc.jpg')
exhibition5.save

exhibition6 = Event.new(name: "Die Nacht", description: "Today, Karl Blossfeldt’s plant photographs are internationally renowned. What is not widely known though is that the history of their production represents an integral chapter in the history of Berlin’s Kunstgewerbemuseum. ",
  category: "exhibition", tags: "Modern", date: Faker::Date.forward(1),
  price: 15, mood: "Dramatic", venue_id: museum6.id, city: 'Berlin',
  remote_photo_url: 'http://res.cloudinary.com/daqyyyytv/image/upload/v1511534713/ari-he-317209_naeghh.jpg')
exhibition6.save

exhibition7 = Event.new(name: "New Homeland", description: "From June 30th 2017 to June 17th 2018 Kunsthaus Dahlem presents the group exhibition New/Old Homeland. Artist’s R/emigration after 1945 with appr. 50 works by 15 artists. ",
  category: "exhibition", tags: "Modern", date: Faker::Date.forward(1),
  price: 18, mood: "Wild", venue_id: museum7.id, city: 'Berlin',
  remote_photo_url: 'http://res.cloudinary.com/daqyyyytv/image/upload/v1511534714/daniel-posthuma-255479_ccmpuq.jpg')
exhibition7.save

exhibition8 = Event.new(name: "New Walls", description: "Unspectacular landscapes, motifs found in passing, were now the subject of interest. Among the artists of the Berlin Secession, this was pursued most consistently by Walter Leistikow and Karl Hagemeister.",
  category: "exhibition", tags: "Modern", date: Faker::Date.forward(1),
  price: 23, mood: "Romantic", venue_id: museum1.id, city: 'Berlin',
  remote_photo_url: 'http://res.cloudinary.com/daqyyyytv/image/upload/v1511534723/scott-webb-102177_mrab0f.jpg')
exhibition8.save


# puts 'Creating 5 new venues'
# 5.times do |venue|
#   venue = Venue.new(name: Faker::Ancient.god, description: Faker::Lorem.sentences(5),
#                     phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email,
#                     remote_photo_url: "https://source.unsplash.com/random/800x600")
#   venue.save!
# end

# puts 'Creating 10 new events'
# 10.times do |event|
#   event = Event.new(name: Faker::Hipster.word, description: Faker::Lorem.sentences(5),
#                     category: Event::CATEGORY.sample, date: Faker::Date.forward(300),
#                     price: Faker::Commerce.price, venue_id: Venue.all.ids.sample,
#                     city: ['Berlin', 'Paris'].sample,
#                     remote_photo_url: "https://source.unsplash.com/random/800x60")
#   event.save!
# end

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


# Scraper for Category Exhibition

#@exhibition = Nokogiri::HTML(open("https://www.visitberlin.de/en/event-calendar-berlin?cat%5B%5D=9315&keys=&date_between%5Bmin%5D=2017-12-04&date_between%5Bmax%5D=2017-12-04&district=All&page=0"))

#20.times do
#  r = Event.create!(
#  name: @exhibition.xpath("//*[@id="main-content"]/div[2]/ul/li[1]/article/div[2]/h3/a").text.strip
#  description: ",
#  category: "exhibition",
#  tags: "",
#  date: Faker::Date.forward(1),
#  price: 15,
#  mood: "Dramatic",
#  venue_id: museum6.id,
#  city: 'Berlin',
#  remote_photo_url: 'http://res.cloudinary.com/daqyyyytv/image/upload/v1511534713/ari-he-317209_naeghh.jpg')
# )


