class Timbers::Players

    attr_accessor :name, :position, :url, :stat, :jersey, :bio
    
  
    @@all = []
   
    def initialize(name, position, url, jersey)
        @name = name
        @position = position
        @url = url
        @stat = stat
        @jersey = jersey
        @@all << self
    end 
    
    def self.all
        return @@all
    end
  

end 