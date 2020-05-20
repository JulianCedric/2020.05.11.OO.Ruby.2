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

class SolarSystem 
    @@all = [] 
    attr_accessor :name
    def initialize(name)
        @name = name
        SolarSystem.all << self
    end
    def self.all
        @@all
    end
    def stars 
        Star.all.select do |star|
            star.solar_system == self 
        end
    end
    def galaxies
        stars.map do |star|
            star.galaxy 
        end
    end 
    def planets
        Planet.all.select do |planet|
            planet.solar_system == self 
        end
    end
end

class Star 
    @@all = [] 
    attr_accessor :name, :galaxy, :solar_system
    def initialize(name, galaxy, solar_system)
        @name = name
        @galaxy = galaxy
        @solar_system = solar_system
        Star.all << self
    end
    def self.all
        @@all
    end
    def planets
        ss = Star.all.map do |star|
            star.solar_system
        end
        ss.map do |ss|
            ss.planets
        end
    end
end

class Planet 
    @@all = [] 
    attr_accessor :name, :solar_system
    def initialize(name, solar_system)
        @name = name
        @solar_system = solar_system 
        Planet.all << self
    end
    def self.all
        @@all
    end
end

galaxy1 = Galaxy.new("Milky Way")
solar_system1 = SolarSystem.new("SolarSystem1")
star1 = Star.new("Sun", galaxy1, solar_system1)
planet1 = Planet.new("Earth", solar_system1)
planet2 = Planet.new("Mars", solar_system1)
planet3 = Planet.new("Venus", solar_system1)

puts star1.planets
