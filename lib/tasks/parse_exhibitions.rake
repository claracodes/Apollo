namespace :parse  do
  desc "Parsing of exhibition based on Berlin events"
  task :exhibition_creator => :environment do

    @exhibition = Nokogiri::HTML(open("https://www.museumsportal-berlin.de/en/exhibitions/?selected_date=2017-12-04"))
    @count_exhibition = 1 if @count_exhibition == 20

    20.times do |i|
      puts "this is event #{i}"
     if @exhibition.xpath("//*[@id='container']/div/div[#{i}]/a/h3").empty?
      p "empty"
    #  byebug
     else
      p "not empty"
      @exhibition_url = "https://www.museumsportal-berlin.de/#{@exhibition.xpath("//*[@id='container']/div/div[#{i}]/a").attr('href').text.strip}"
      @exhibition_url_nokogiri = Nokogiri::HTML(open("#{@exhibition_url}"))
      @event_price = @exhibition_url_nokogiri.xpath("//*[@id='collapse-prices']/div/dl[1]/dd").empty? ? "Free Admission" : @exhibition_url_nokogiri.xpath("//*[@id='collapse-prices']/div/dl[1]/dd").text.strip
      @picture_url = @exhibition_url_nokogiri.xpath("//*[@id='cover_img']/a[1]/img").empty? ? "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/200px-No_image_available.svg.png" : "https://www.museumsportal-berlin.de/#{@exhibition_url_nokogiri.xpath("//*[@id='cover_img']/a[1]/img").attr("data-original").value}"
#      p @event_price
      r = Event.create!(
        name: @exhibition.xpath("//*[@id='container']/div/div[#{i}]/a/h3").text.strip,
        description: @exhibition_url_nokogiri.xpath("//*[@id='exhibition']/div/div/div[1]/article/div[5]/p[1]").text.strip,
        category: "exhibition",
        tags: "Dramatic",
        date: Faker::Date.forward(1),
        price: @event_price,
        mood: "Dramatic",
        venue_id: Venue.find_by_name("City Museum Berlin").id,
        city: 'Berlin',
        remote_photo_url: @picture_url,
      )
#      byebug
      p @picture_url
     end
    end
    byebug
  end
end

#([^\+]+).*/.match
