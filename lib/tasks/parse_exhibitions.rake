namespace :parse  do
  desc "Parsing of exhibition based on Berlin events"
  task :exhibition_creator => :environment do

    @exhibition = Nokogiri::HTML(open("https://www.museumsportal-berlin.de/en/exhibitions/?selected_date=2017-12-04"))
#    @count_exhibition = 1 if @count_exhibition == 20

# Venue Creator

20.times do |i|
  # checks if the accessed container is empty
  if @exhibition.xpath("//*[@id='container']/div/div[#{i}]/a/h3").empty?
  else
  # creates url of event outside of index page
  @exhibition_url = "https://www.museumsportal-berlin.de/#{@exhibition.xpath("//*[@id='container']/div/div[#{i}]/a").attr('href').text.strip}"
  # creates Nokogiri variable with Event-URL
  @exhibition_url_nokogiri = Nokogiri::HTML(open("#{@exhibition_url}"))

  r = Venue.create!(
    name: @venue_name = @exhibition_url_nokogiri.xpath("//*[@id='collapse-location']/div/p/b/a").text,
    city: "Berlin",
    address: @exhibition_url_nokogiri.xpath("//*[@id='wdgt_to']").text.split.join(" "),
    # description = opening hours
    description: @exhibition_url_nokogiri.xpath("//*[@id='collapse-opening-times']/div/div[1]").text.split.join(" "),
    # phone: ,
    # email: ,
    # user_id: host1.id,
    # remote_photo_url: ,
  )
  p Venue.name
  end
end
#byebug

# @venue_phone = @exhibition_url_nokogiri.xpath("//*[@id='collapse-location']/div/dl[1]/dd").empty? ? "" : @exhibition_url_nokogiri.xpath("//*[@id='collapse-location']/div/dl[1]/dd").text
# p @venue_phone

# Event Creator

20.times do |i|
  puts "this is event #{i}"
  # checks if the accessed container is empty
  if @exhibition.xpath("//*[@id='container']/div/div[#{i}]/a/h3").empty?
    p "empty"
  else
    p "not empty"
    # creates url of event outside of index page
    @exhibition_url = "https://www.museumsportal-berlin.de/#{@exhibition.xpath("//*[@id='container']/div/div[#{i}]/a").attr('href').text.strip}"
    # creates Nokogiri variable with Event-URL
    @exhibition_url_nokogiri = Nokogiri::HTML(open("#{@exhibition_url}"))
    # stores price and picture of Event from Event-URL
    @event_price = @exhibition_url_nokogiri.xpath("//*[@id='collapse-prices']/div/dl[1]/dd").empty? ? "Free Admission" : @exhibition_url_nokogiri.xpath("//*[@id='collapse-prices']/div/dl[1]/dd").text.strip
    @picture_url = @exhibition_url_nokogiri.xpath("//*[@id='cover_img']/a[1]/img").empty? ? "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/200px-No_image_available.svg.png" : "https://www.museumsportal-berlin.de/#{@exhibition_url_nokogiri.xpath("//*[@id='cover_img']/a[1]/img").attr("data-original").value}"
    # p @event_price
    @venue_name = @exhibition_url_nokogiri.xpath("//*[@id='collapse-location']/div/p/b/a").text
    r = Event.create!(
      name: @exhibition.xpath("//*[@id='container']/div/div[#{i}]/a/h3").text.strip,
      description: @exhibition_url_nokogiri.xpath("//*[@id='exhibition']/div/div/div[1]/article/div[5]/p[1]").text.strip,
      category: "exhibition",
      tags: ["Dramatic", "Romantic", "Modern", "Funny"].sample,
      date: Faker::Date.forward(1),
      price: @event_price,
      mood: ["Dramatic", "Romantic", "Glamorous", "Wild", "Nerdy"].sample,
      venue_id: Venue.find_by_name(@venue_name).id,
      city: 'Berlin',
      remote_photo_url: @picture_url,
      )
    # byebug
    #p @picture_url
    end
   end
#byebug
 end
end

#([^\+]+).*/.match
