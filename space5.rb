class Galaxy 
    @@all = [] 
    attr_accessor :name

    def initialize(name)
        @name = name
        Galaxy.all << self
    end
    
    def self.all
        @@all
    end
    
    def stars
        Star.all.select do |star|
            star.galaxy == self
        end
    end
    def solar_systems 
        stars.map do |star|
            star.solar_system 
        end
    end
    def planets
        solar_systems.map do |solar_system|
            solar_system.planets 
        end 
    end
end

galaxy1 = Galaxy.new("Milky Way")

star1 = Star.new("Sun")

planet1 = Planet.new("Earth")  

# Defining a class to a 


class Planet 
    attr_accessor :name, :star

    @@all = [] 
    # @@all is what we call a 'class variable', which we assign the value of an empty array. 

    def initialize(name)
        # The 'initialize method' is invoked during the creation of every new instance (e.g. planet1 = Planet.new("Earth") and the variable '(name)' being passed into this method means that each new instance needs to have a name.'  
        @name = name
        @@all << self
        # Here, we take the @@all class variable from above and store each newly-created instance (self) into the array. By doing this, we now have a way to keep track of every single planet (instance) we decide to create. 
    end

end

planet1 = Planet.new("Earth")

class Star
    attr_accessor :name, :galaxy 
    @@all = [] 

    def initialize(name)
        @name = name 
        @@all << self
    end

end

star1 = Star.new("Sun")

