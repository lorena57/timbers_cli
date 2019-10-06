class Timbers::Scraper 
  

    # def self.player_info
    #   doc = Nokogiri::HTML(open("https://www.timbers.com/players"))
    #   player_info = doc.css("ul.player_list li") 
    #   player_info.each do |player|
    #     name = player.css('a.name_link').text
    #     position = player.css('span.position').text
    #     url = player.css('a')[0].attr('href')
    #     Timbers::Players.new(name, url)
    #   end 
    # end

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
        binding.pry
      end
    end 

    def player_bio(history)
      
    end
  
  

end