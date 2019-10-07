class Timbers::Scraper 
  
    BASE_URL = "https://www.timbers.com/players"

    def self.player_info
      pg = open(BASE_URL)
      parsed_html = Nokogiri::HTML(pg)
      team = parsed_html.css("ul.player_list li.row")
      team.each do |indiv|
        name = indiv.css("a.name_link").text
        position = indiv.css("span.position").text
        url = indiv.css('a')[0].attr('href')
        Timbers::Players.new(name, position, url)
        # binding.pry
      end
    end 

    def self.player_bio(info)
      url = "https://www.timbers.com#{info.url}"
      html = Nokogiri::HTML(open(url))
      bio = html.css("div.bio p:nth-child(2)").text
      info.stat = bio
      #binding.pry
    end
  
  

end