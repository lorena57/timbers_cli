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
        jersey = indiv.css("span.jersey").text
        Timbers::Players.new(name, position, url, jersey)
        #binding.pry
      end
    end 

    def self.player_bio(info)
      url = "https://www.timbers.com#{info.url}"
      html = Nokogiri::HTML(open(url)) 
      # bio = html.css("div.bio p:nth-child(2)").text
      # info.stat = bio

      # first_p = html.css("div.bio p").first
      # if !first_p.text.include?("2019: ")
      #   bio = first_p.next_element.text
      # else
      #   bio = "2019:#{first_p.text.split(/2019:/)[1]}"
      # end
      
      # info.stat = bio  


p_tags = html.css("div.bio p")

bio_hash = {}

p_tags.each do |p|
  strongs = p.css("strong")
  strongs.each do |s|
    if s.text.include?("20")
      header = s.text.gsub(":", "")
      body = s.next_sibling
      #body = s.next_sibling.text (text removed due to error when 10 input)
      bio_hash[header] = body
    end
  end
  
end

info.bio = bio_hash

end
end