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

puts 'Creating 10 new users'
10.times do |user|
  user = User.new(first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password")
  user.save!
end

#Scraper for Exhibitions

10.times do |d|
@event = Nokogiri::HTML(open("https://www.museumsportal-berlin.de/en/exhibitions/?selected_date=2017-12-#{d + 1}"))
@date = Date.parse("Dec #{d + 1} 2017")
p "Category: Exhibitions --> Date: #{@date}"

  # Venue Creator
  20.times do |i|
    # checks if the accessed container is empty
    if @event.xpath("//*[@id='container']/div/div[#{i}]/a/h3").empty?
    else
    # creates url of event outside of index page
    @event_url = "https://www.museumsportal-berlin.de/#{@event.xpath("//*[@id='container']/div/div[#{i}]/a").attr('href').text.strip}"
    # creates Nokogiri variable with Event-URL
    @event_url_nokogiri = Nokogiri::HTML(open("#{@event_url}"))
    #checks if venue already exists and skips if yes
      if Venue.find_by_name(@event_url_nokogiri.xpath("//*[@id='collapse-location']/div/p/b/a").text)
      else
        r = Venue.create!(
          name: @venue_name = @event_url_nokogiri.xpath("//*[@id='collapse-location']/div/p/b/a").text,
          city: "Berlin",
          address: @event_url_nokogiri.xpath("//*[@id='wdgt_to']").text.split.join(" "),
        # description = opening hours
        description: @event_url_nokogiri.xpath("//*[@id='collapse-opening-times']/div/div[1]").text.split.join(" "),
        # phone: ,
        # email: ,
        # user_id: host1.id,
        # remote_photo_url: ,
        )
        p "> Venue: #{@venue_name}"
      end
    end
  end
sleep 3

  # Event Creator

  20.times do |i|
#    puts "this is event #{i}"
    # checks if the accessed container is empty
    if @event.xpath("//*[@id='container']/div/div[#{i}]/a/h3").empty?
#      p "empty"
    else
#      p "not empty"
      # creates url of event outside of index page
      @event_url = "https://www.museumsportal-berlin.de/#{@event.xpath("//*[@id='container']/div/div[#{i}]/a").attr('href').text.strip}"
      # creates Nokogiri variable with Event-URL
      @event_url_nokogiri = Nokogiri::HTML(open("#{@event_url}"))
      # stores price and picture of Event from Event-URL
      @event_price = @event_url_nokogiri.xpath("//*[@id='collapse-prices']/div/dl[1]/dd").empty? ? "Free Admission" : @event_url_nokogiri.xpath("//*[@id='collapse-prices']/div/dl[1]/dd").text.strip
      @picture_url = @event_url_nokogiri.xpath("//*[@id='cover_img']/a[1]/img").empty? ? "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/200px-No_image_available.svg.png" : "https://www.museumsportal-berlin.de/#{@event_url_nokogiri.xpath("//*[@id='cover_img']/a[1]/img").attr("data-original").value}"
      # p @event_price
      @venue_name = @event_url_nokogiri.xpath("//*[@id='collapse-location']/div/p/b/a").text
      r = Event.create!(
        name: @event.xpath("//*[@id='container']/div/div[#{i}]/a/h3").text.strip,
        description: "#{@event_url_nokogiri.xpath("//*[@id='exhibition']/div/div/div[1]/article/div[5]/p[1]").text.strip} #{@event_url_nokogiri.xpath("//*[@id='exhibition']/div/div/div[1]/article/div[4]/p[1]").text.strip} #{@event_url_nokogiri.xpath("//*[@id='exhibition']/div/div/div[1]/article/div[3]/p[1]").text.strip}",
        category: "Exhibition",
        tags: ["Dramatic", "Romantic", "Modern", "Funny"].sample,
        date: @date,
        price_cents: @event_price.to_i * 100,
        mood: ["Dramatic", "Romantic", "Glamorous", "Wild", "Nerdy"].sample,
        venue_id: Venue.find_by_name(@venue_name).id,
        city: 'Berlin',
        remote_photo_url: @picture_url,
        )
      p "> Event: #{@event.xpath("//*[@id='container']/div/div[#{i}]/a/h3").text.strip}"
    end
  end
 end
sleep 3

# price_cents:

# Scraper for Categories Film, Theater and Concert

available_categories = {Theater: "theaterperformance", Concert: "konzert", Movie: "film"}
available_categories.each do |cat|

10.times do |d|
@event = Nokogiri::HTML(open("https://www.museumsportal-berlin.de/de/veranstaltungen/?selected_date=2017-12-#{d + 1}&category=#{cat[1]}"))
@date = Date.parse("Dec #{d + 1} 2017")
p "Category: #{cat[0].capitalize} --> Date: #{@date}"

  # Venue Creator
  20.times do |i|
    # checks if the accessed container is empty
    if @event.xpath("//*[@id='container']/div/div[#{i}]/a/h3").empty?
    else
    # creates url of event outside of index page
    @event_url = "https://www.museumsportal-berlin.de/#{@event.xpath("//*[@id='container']/div/div[#{i}]/a").attr('href').text.strip}"
    # creates Nokogiri variable with Event-URL
    @event_url_nokogiri = Nokogiri::HTML(open("#{@event_url}"))
    #checks if venue already exists and skips if yes
      if Venue.find_by_name(@event_url_nokogiri.xpath("//*[@id='collapse-location']/div/p/b/a").text)
      else
        r = Venue.create!(
          name: @venue_name = @event_url_nokogiri.xpath("//*[@id='collapse-location']/div/p/b/a").text,
          city: "Berlin",
          address: @event_url_nokogiri.xpath("//*[@id='wdgt_to']").text.split.join(" "),
        # description = opening hours
        description: @event_url_nokogiri.xpath("//*[@id='collapse-opening-times']/div/div[1]").text.split.join(" "),
        # phone: ,
        # email: ,
        # user_id: host1.id,
        # remote_photo_url: ,
        )
        p "> Venue: #{@venue_name}"
      end
    end
  end
sleep 3
  #byebug

  # Event Creator

  20.times do |i|
#    puts "this is event #{i}"
    # checks if the accessed container is empty
    if @event.xpath("//*[@id='container']/div/div[#{i}]/a/h3").empty?
#      p "empty"
    else
#      p "not empty"
      # creates url of event outside of index page
      @event_url = "https://www.museumsportal-berlin.de/#{@event.xpath("//*[@id='container']/div/div[#{i}]/a").attr('href').text.strip}"
      # creates Nokogiri variable with Event-URL
      @event_url_nokogiri = Nokogiri::HTML(open("#{@event_url}"))
      # stores price and picture of Event from Event-URL
      @event_price = @event_url_nokogiri.xpath("//*[@id='collapse-prices']/div/dl[1]/dd").empty? ? "Free Admission" : @event_url_nokogiri.xpath("//*[@id='collapse-prices']/div/dl[1]/dd").text.strip
      @picture_url = @event_url_nokogiri.xpath("//*[@id='cover_img']/a[1]/img").empty? ? "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/200px-No_image_available.svg.png" : "https://www.museumsportal-berlin.de/#{@event_url_nokogiri.xpath("//*[@id='cover_img']/a[1]/img").attr("data-original").value}"
      # p @event_price
      @venue_name = @event_url_nokogiri.xpath("//*[@id='collapse-location']/div/p/b/a").text
      r = Event.create!(
        name: @event.xpath("//*[@id='container']/div/div[#{i}]/a/h3").text.strip,
        description: "#{@event_url_nokogiri.xpath("//*[@id='exhibition']/div/div/div[1]/article/div[5]/p[1]").text.strip} #{@event_url_nokogiri.xpath("//*[@id='exhibition']/div/div/div[1]/article/div[4]/p[1]").text.strip} #{@event_url_nokogiri.xpath("//*[@id='exhibition']/div/div/div[1]/article/div[3]/p[1]").text.strip}",
        category: cat[0],
        tags: ["Dramatic", "Romantic", "Modern", "Funny"].sample,
        date: @date,
        price_cents: @event_price.to_i * 100,
        mood: ["Dramatic", "Romantic", "Glamorous", "Wild", "Nerdy"].sample,
        venue_id: Venue.find_by_name(@venue_name).id,
        city: 'Berlin',
        remote_photo_url: @picture_url,
        )
      p "> Event: #{@event.xpath("//*[@id='container']/div/div[#{i}]/a/h3").text.strip}"
    end
  end
  end
sleep 3
end

#puts 'Creating 10 new bookings'
#10.times do |booking|
#  @event = Event.all.sample
#  @user = User.all.sample
#  booking = Booking.new(event: @event, user: @user)
#  booking.save!
#end
