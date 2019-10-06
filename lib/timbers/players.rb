class Timbers::Players

    attr_accessor :name, :position, :url
  
    @@all = []
   
    def initialize(name, position, url)
        @name = name
        @position = position
        @url = url
        @@all << self
    end 
    
    def self.all
        return @@all
    end
  

end 