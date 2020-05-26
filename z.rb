class User
    @@all = []
    attr_accessor :name
    def initialize(name)
        @name = name
        User.all << self
    end
    def self.all
        @@all
    end
    def armors 
        # Returns all Armors belonging to the user
        Armor.all.select do |a|
            a.user == self
        end
    end
end
class Armor
    @@all = []
    attr_accessor :name, :user 
    def initialize(name, user)
        @name = name
        @user = user 
        Armor.all << self
    end
    def self.all
        @@all
    end
    def tech 
        Tech.all.select do |t|
        t.armor == self
        end 
    end
    def abilities 
        tech.map do |t|
            t.ability 
        end
    end
end
class Tech
    @@all = []
    attr_accessor :name, :armor, :ability 
    def initialize(name, armor, ability)
        @name = name
        @armor = armor
        @ability = ability 
        Tech.all << self
    end
    def self.all
        @@all
    end
end
class Ability
    @@all = []
    attr_accessor :name
    def initialize(name)
        @name = name
        Ability.all << self
    end
    def self.all
        @@all
    end
    def tech 
        Tech.all.select do |t|
        t.ability == self
        end 
    end
    def armors  
        tech.map do |t|
            t.armor  
        end
    end
    def avs 
        AbilityVillain.all.select do |av|
            av.ability == self  
        end
    end
    def villains 
        avs.map do |av|
            av.villain 
        end
    end
end
class AbilityVillain
    @@all = []
    attr_accessor :name, :ability, :villain
    def initialize(name, ability, villain)
        @name = name
        @ability = ability
        @villain = villain 
        AbilityVillain.all << self
    end
    def self.all
        @@all
    end
end
class Villain
    @@all = []
    attr_accessor :name
    def initialize(name)
        @name = name
        Villain.all << self
    end
    def self.all
        @@all
    end
    def avs 
        AbilityVillain.all.select do |av|
            av.villain == self  
        end
    end
    def abilities  
        avs.map do |av|
            av.ability  
        end
    end
end

user1 = User.new("Tony")
armor1 = Armor.new("SpaceArmor", user1) 
ability1 = Ability.new("SpaceFlight")
tech1 = Tech.new("SpaceTech", armor1, ability1)
villain1 = Villain.new("Thanos")
ability_villain1 = AbilityVillain.new("SharedAbility_SpaceFlight", ability1, villain1)

# User has many Armor
# Armor belongs to User

# Armor has many Tech
# Armor has many Ability through Tech
# Ability has many Tech
# Ability has many Armor through Tech
# Tech belongs to Armor
# Tech belongs to Ability

# Ability has many A_V
# Ability has many Villains through A_V
# Villain has many A_V
# Villain has many Ability through A_V
# A_V belongs to Ability
# A_V belongs to Villain 

def s 
    " \n \n \n "
end

puts user1 
puts user1.armors
puts s 
puts armor1
puts armor1.tech
puts armor1.abilities 
puts s 
puts ability1
puts ability1.tech 
puts ability1.armors
puts s 
puts ability1 
puts ability1.avs 
puts ability1.villains
puts s 
puts villain1
puts villain1.avs 
puts villain1.abilities  
puts s 
puts s 
puts s 
puts user1 
puts user1.armors  
puts user1.name 