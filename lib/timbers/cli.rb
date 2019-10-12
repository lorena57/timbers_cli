class Timbers::CLI 
 
  def call 
    self.greeting
    Timbers::Scraper.player_info
    
    @input = ""
    until @input == "exit"
    self.list_players
    self.choose_player
    self.continue_message
    end
    good_day
  end 
    
  def greeting
    puts "---------------------------------------------------------------------------------------------------------------------------------------"
    puts "\nWelcome to the Portland Timbers Home Page"
    puts "\n-------------------------------------------------------------------------------------------------------------------------------------"
    puts "To select a player please select a number"
    
  end

  def list_players
    Timbers::Players.all.sample(10).each_with_index{|p,i| puts "#{i + 1}. #{p.name}"}
  end

  # def list_years(info)
  # return info from hash
  # list key (years)
  # have user select key (year)
  # upon selection of year, display value
  # end

  def choose_player
    index = gets.strip.to_i - 1
    info = Timbers::Players.all[index]
    Timbers::Scraper.player_bio(info)
      self.display_player_info(info)
  end

  def display_player_info(info)
    puts "-------------------------------------------------------Player Info-------------------------------------------------------------"
    puts "\nName: #{info.name}\n"
    puts "\nPosition: #{info.position}"
    puts "\nJersey no.: #{info.jersey}\n"
    puts "-------------------------------------------------------Player Bio------------------------------------------------------------\n"
    puts ""
    #puts info.stat

    puts info.bio.to_a.first
  end

  def continue_message
    puts "Are you done? Type 'exit' to exit or hit any key to see more events.\n"
    @input = gets.strip
  end

  def good_day
    puts "Good day!"
  end

  # def continue_message
  #   puts "\nWould you like to see read about another player?"
  #   puts "You can enter yes, no, or menu to go back to the main menu"
  #     input = gets.strip.downcase
  #   if input == "yes"
  #     list_players
  #     choose_player
  #   elsif input == "no"
  #     "Thank you for visiting the Portland Timbers home page"
  #   elsif input =="menu"
  #     list_players
  #     choose_player  
  #   else
  #     puts "\nI don't understand your selection."
  #     main_menu
  #   end
  # end
  
end
 
