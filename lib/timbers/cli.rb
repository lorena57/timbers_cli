class Timbers::CLI 
 
  def call 
    self.greeting
    Timbers::Scraper.player_info
    loop do
      user_input = main_menu
      if user_input == "exit" || user_input.include?("n")
        return
      else
        self.list_players
        self.choose_player
      end
      end
    end 
    
   

  def greeting
    puts "Here"
  end

  def main_menu
    puts "Would you like to see current players?"
    input = gets.strip.downcase
    return input
  end

  def list_players
    Timbers::Players.all.each_with_index{|p,i| puts "#{i + 1}. #{p.name}"}
  end

  def choose_player
    puts "Chose a player you'd like to learn more about"
    index = gets.strip.to_i - 1
    info = Timbers::Players.all[index]
    binding.pry
    Timbers::Scraper.player_bio(info)
      self.display_player_info(info)
  end

  def display_player_info(info)
    puts info.stat
   
  end






end
 
