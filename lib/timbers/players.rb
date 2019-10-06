class Timbers::Players

    attr_accessor :name, :position, :url, :stat
    
  
    @@all = []
   
    def initialize(name, position, url)
        @name = name
        @position = position
        @url = url
        @stat = stat
        @@all << self
    end 
    
    def self.all
        return @@all
    end
  

end 