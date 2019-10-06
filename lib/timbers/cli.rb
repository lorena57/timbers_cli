class Timbers::CLI 
 
  def call 
    greeting
    Timbers::Scraper.player_info
    list_players
  end 

  def greeting
    puts "Here"
  end

  def list_players
    Timbers::Players.all.each_with_index{|p,i| puts "#{i + 1}. #{p.name}"}
  end






end
 
