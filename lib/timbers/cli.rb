class Timbers::CLI 
 
  def call 
    self.greeting
    Timbers::Scraper.player_info
    self.get_players
    self.list_players
    self.get_player
  end 
    
  def greeting
    puts "\nWelcome to the Portland Timbers Home Page"
    puts "\nTo select a player please select a number:"
    
  end

  def get_players
    @players = Timbers::Players.all.sample(10)
  end

  def list_players
    puts 'Choose a month to see events.'
    @players.each.with_index(1) do |player, index| 
    puts "#{index}. #{player.name}"
    end
  end

  def get_player
    chosen_player = gets.strip.to_i
    show_events_for(chosen_player) if valid_input(chosen_player, @players)
  end 

  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end 

    def show_events_for(chosen_player)
      person = @players[chosen_player - 1]
      #binding.pry
      # person.get_events
      puts "Here is the bio for #{person.name}"
    end
 
  #  def get_user_event(bio)
  #   puts "Choose an event to see more details."
  #   input = gets.strip
  #   event = month.events[input.to_i - 1]
  #   display_player_info(info)
  







  # def list_players
  #   Timbers::Players.all.sample(10).each_with_index{|p,i| puts "#{i + 1}. #{p.name}"}
  # end

  # def list_years(info)
  # return info from hash
  # list key (years)
  # have user select key (year)
  # upon selection of year, display value
  # end

  # def choose_player
  #   index = gets.strip.to_i - 1
  #   info = Timbers::Players.all[index]
  #   Timbers::Scraper.player_bio(info)
  #     self.display_player_info(info)
  # end

  # def display_player_info(info)
  #   puts "-------------------------------------------------------Player Info-------------------------------------------------------------"
  #   puts "\nName: #{info.name}\n"
  #   puts "\nPosition: #{info.position}"
  #   puts "\nJersey no.: #{info.jersey}\n"
  #   puts "-------------------------------------------------------Player Bio------------------------------------------------------------\n"
  #   puts ""
  #   #puts info.stat

  #   puts info.bio.to_a.first
  # end

  # def continue_message
  #   puts "Are you done? Type 'exit' to exit or enter any key to learn about another player.\n"
  #   @input = gets.strip
  # end

  # def good_day
  #   puts "Good day!"
  # end

end
 
