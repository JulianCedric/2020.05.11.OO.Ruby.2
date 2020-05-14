class Actor < ActiveRecord::Base
    attr_accessor :name, :age
    @@all = []

    def initialize(name, age) 
        @name = name 
        @age = age 
        Actor.all << self 
    end

    def self.all 
        @@all 
    end

    def roles
        Role.all.select do |role|
            role.actor == self 
        end
    end

    def movies
        roles.map do |role|
            role.movie 
        end
    end

    def new_role(movie)
        Role.new(movie, self)
    end

    # def directors
    #     Movie.all.select do |movie|
    #         movie.director ==
    # end
    
end

Actor.column_names