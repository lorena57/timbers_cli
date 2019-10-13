class Timbers::Players

    attr_accessor :name, :position, :url, :stat, :jersey

     attr_writer :bio
     
    @@all = []
   
    def initialize(name, position, url, jersey)
        @name = name
        @position = position
        @url = url
        @stat = stat
        @jersey = jersey
        @@all << self
        @bio = []
    end 
    
    def self.all
        @@all
    end

    def bio
        # binding.pry
        Timbers::Scraper.player_bio(self) if @bio.empty?
    end
  

end 