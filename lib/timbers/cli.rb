class Timbers::CLI 
 
  def call 
    self.greeting
    Timbers::Scraper.player_info
    self.get_players
    self.list_players
    self.choose_player
    loop do
      puts "\nWould you like to read about another player?"
      input = gets.strip.downcase
      if input == "y" || input == "yes"
        puts "To select a player please enter a number:"
        self.list_players
        self.choose_player
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

  def list_players
    @players.each_with_index{|p,i| puts "#{i + 1}. #{p.name}\n"}
  end

  def choose_player
    input = gets.strip.to_i
    while input < 1 || input > @players.length
      puts "Please enter a valid input, select a number 1-10"
    input = gets.strip.to_i 
  end
    info = Timbers::Players.all[input - 1]
    Timbers::Scraper.player_bio(info)
    self.display_player_info(info)
  
  end

  def display_player_info(info)
    puts "-------------------------------------------------------Player Info-------------------------------------------------------------"
    puts Rainbow("\nName: #{info.name}").cyan
    puts Rainbow("\nPosition: #{info.position}").cyan
    puts Rainbow("\nJersey no.: #{info.jersey}").cyan
    puts "-------------------------------------------------------Player Bio------------------------------------------------------------\n"
    puts ""
    puts info.stat
  end

  def get_user_month
    input = gets.strip.to_i
    choose_player(input) if valid_input(input, @players)
  end 
  
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end 




end
 