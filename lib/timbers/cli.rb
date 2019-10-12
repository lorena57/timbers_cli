class Timbers::CLI 
 
  def call 
    self.greeting
    Timbers::Scraper.player_info
    #self.main_menu
    self.list_players
    self.choose_player
    self.continue_message
  end 
    
  def greeting
    puts "-------------------------------------------------------------------------------------------------------------------------------------"
    puts "\nWelcome to the Portland Timbers Home Page"
    puts "\n-------------------------------------------------------------------------------------------------------------------------------------"
    puts "To select a player please select a number"
    
  end

  # def main_menu
  #   puts "\nWould you like to see a list of the current players?"
  #   #puts "You can enter yes, no, or menu to go back to the main menu"
  #   puts "Enter 'yes' or 'no'\n"
   
  #   input = gets.strip.downcase
  #   if input == "yes"
  #     list_players
  #     choose_player
  #   elsif input == "no"
  #     "Thank you for visiting the Portland Timbers home page"
  #   else
  #     puts "\nI don't understand your selection."
  #     main_menu
  #   end
  # end

  def list_players
    Timbers::Players.all.sample(10).each_with_index{|p,i| puts "#{i + 1}. #{p.name}"}
  end

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
    puts info.stat
  end

  def continue_message
    puts "\nWould you like to see read about another player?"
    puts "You can enter yes, no, or menu to go back to the main menu"
      input = gets.strip.downcase
    if input == "yes"
      list_players
      choose_player
    elsif input == "no"
      "Thank you for visiting the Portland Timbers home page"
    elsif input =="menu"
      list_players
      choose_player  
    else
      puts "\nI don't understand your selection."
      main_menu
    end
  end
  








end
 
