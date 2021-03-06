namespace :parse  do
  desc "Parsing of exhibition based on Berlin events"
  task :exhibition_creator => :environment do

30.times do |d|
@event = Nokogiri::HTML(open("https://www.museumsportal-berlin.de/en/exhibitions/?selected_date=2017-12-#{d + 1}"))
@date = Date.parse("Dec #{d + 1} 2017")
p @date

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
        p @venue_name
      end
    end
  end
  #byebug

  # @venue_phone = @event_url_nokogiri.xpath("//*[@id='collapse-location']/div/dl[1]/dd").empty? ? "" : @event_url_nokogiri.xpath("//*[@id='collapse-location']/div/dl[1]/dd").text
  # p @venue_phone

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
        category: "exhibition",
        tags: ["Dramatic", "Romantic", "Modern", "Funny"].sample,
        date: @date,
        price: @event_price,
        mood: ["Dramatic", "Romantic", "Glamorous", "Wild", "Nerdy"].sample,
        venue_id: Venue.find_by_name(@venue_name).id,
        city: 'Berlin',
        remote_photo_url: @picture_url,
        )
      p @event.xpath("//*[@id='container']/div/div[#{i}]/a/h3").text.strip
      # byebug
      #p @picture_url
    end
  end
  #byebug
  end
end
end

#([^\+]+).*/.match
