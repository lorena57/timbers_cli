class Timbers::CLI 
 
  def call 
    self.greeting
    Timbers::Scraper.player_info
    self.main_menu
    self.continue_message
  end 
    
  def greeting
    puts "----------------------------------------------"
    puts "\nWelcome to the Portland Timbers Home Page"
    puts "\n----------------------------------------------"
  end

  def main_menu
    puts "\nWould you like to see a list of the current players?"
    puts "You can enter yes, no, or menu to go back to the main menu"
    
    input = gets.strip.downcase
    if input == "yes"
      list_players
      choose_player
    elsif input == "no"
      greeting
    else
      puts "\nI don't understand your selection."
      main_menu
    end
  end

  def list_players
    Timbers::Players.all.sample(10).each_with_index{|p,i| puts "#{i + 1}. #{p.name}"}
  end

  def choose_player
    puts "\nEnter a player number you'd like to learn more about."
    index = gets.strip.to_i - 1
    info = Timbers::Players.all[index]
    Timbers::Scraper.player_bio(info)
      self.display_player_info(info)
  end

  def display_player_info(info)
    puts "-------------------------------------------------------Player Description------------------------------------------------------------"
    puts ""
    puts info.stat
  end

  def continue_message
    puts "\nWould you like to see read about another player?"
    puts "You can enter yes, no, or menu to go back to the main menu"
    puts "Enter exit to end this program\n\n"
      gets.strip.downcase
      input = gets.strip.downcase
    if input == "yes"
      list_players
      choose_player
    elsif input == "no"
      greeting
    elsif input =="menu"
      list_players
      choose_player  
    else
      puts "\nI don't understand your selection."
      main_menu
    end
  end
  








end
 
