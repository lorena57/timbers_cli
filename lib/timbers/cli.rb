class Timbers::CLI 
 
  def call 
    self.greeting
    Timbers::Scraper.player_info
    self.get_players
    self.list_players
    self.choose_player
    loop do
      puts "\nWould you like to view information on another player?"
      input = gets.strip.downcase
      if input == "y" || input == "yes"
        self.list_players
      elsif input == "n" || input == "no"
        puts "Thank you, see you later!"
        break
      else
        puts "That is not a valid response."
    end
  end
end
    
  def greeting
    puts Rainbow("\nWelcome to the Portland Timbers Home Page").blue
    puts "\nTo select a player please enter a number:"
  end

  def get_players
    @players = Timbers::Players.all.take(10)
  end

    #keep 7:23
  def list_players
    @players.each_with_index{|p,i| puts "#{i + 1}. #{p.name}\n"}
  end

  def choose_player


    input = gets.strip.to_i - 1
    info = Timbers::Players.all[input]
    Timbers::Scraper.player_bio(info)
    self.display_player_info(info)
      #binding.pry
  end

  def display_player_info(info)
    puts "-------------------------------------------------------Player Info-------------------------------------------------------------"
    puts Rainbow("\nName: #{info.name}").cyan
    puts Rainbow("\nPosition: #{info.position}").cyan
    puts Rainbow("\nJersey no.: #{info.jersey}").cyan
    puts "-------------------------------------------------------Player Bio------------------------------------------------------------\n"
    puts ""
    puts info.stat

    # puts info.bio.to_a.first
  end



end
 