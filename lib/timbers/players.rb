class Timbers::Players

    attr_accessor :name, :position, :url, :stat, :age
    
  
    @@all = []
   
    def initialize(name, position, url, birthplace)
        @name = name
        @position = position
        @url = url
        @stat = stat
        @age = age
        @@all << self
    end 
    
    def self.all
        return @@all
    end
  

end 