class Timbers::CLI 
 
  def call 
    self.greeting
    Timbers::Scraper.player_info
    self.main_menu
  end 
    
   

  def greeting
    puts "\nWelcome to the Portland Timbers Home Page"
  end

  # def main_menu
  #   puts "\n\nWould you like to see a list of the current players?"
  #   input = gets.strip.downcase
  #   return input
  # end

  def main_menu
    puts "\nWould you like to see a list of the current players?"
    puts "Enter 'y' for yes and 'n' for no"
    puts "If you would to exit the program "
    input = gets.strip.downcase
    if input == "y"
      list_players
      choose_player
    elsif input == "no"
      greeting
    else
      puts "\nI don't understand your selection."
      greeting
      
  end
end

  def list_players
    Timbers::Players.all.each_with_index{|p,i| puts "#{i + 1}. #{p.name}"}
  end

  def choose_player
    puts "Chose a player you'd like to learn more about"
    index = gets.strip.to_i - 1
    info = Timbers::Players.all[index]
   
    Timbers::Scraper.player_bio(info)
      self.display_player_info(info)
  end

  def display_player_info(info)
    puts info.stat
   
  end






end
 
