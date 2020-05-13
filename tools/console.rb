# The below is copied & pasted from example.

require_relative '../config/environment.rb'
#
# # test code goes here
#
#
# # Movie instances(3):
#
# ironman1 = Movie.new("Iron Man", "Superhero")
# ironman2 = Movie.new("Iron Man 2", "Superhero")
# spiderman1 = Movie.new("Spiderman", "Superhero")
#
# # Actor instances(2):
#
# robert = Actor.new("Robert Downey", 45)
# tom = Actor.new("Tom Holland", 20)
#
# # Role instances (2):
#
# role1 = Role.new(ironman1, robert)
# role2 = Role.new(ironman2, robert)
# role3 = Role.new(spiderman1, tom)
#
# # Viewer instances (2):
#
# adam = Viewer.new("Adam", 25)
# belle = Viewer.new("Belle", 30)
#
# # Screen instances (2):
#
# screen1 = Screen.new(ironman1, adam)
# screen2 = Screen.new(spiderman1, belle)
#
# # Award instances (2):
#
# award1 = Award.new("Golden Globes", robert)
# award2 = Award.new("Oscars", robert)
#
# # Director instances (2):
#
# jonf = Director.new("Jon Favreau", ironman1)
# jonf = Director.new("Jon Favreau", ironman2)
# jonw = Director.new("Jon Watts", spiderman1)

actor1 = Actor.new("Actor1", 76)
director1 = Director.new("Director1")
movie1 = Movie.new("Title1", "Drama", director1, actor1)
movie_contract1 = MovieContract.new(movie1, 40, 5000)

actor2 = Actor.new("Actor2", 45)
director2 = Director.new("Director2")
movie2 = Movie.new("Title2", "Sci-fi", director2, actor2)
movie_contract2 = MovieContract.new(movie2, 60, 9000, true)

actor3 = Actor.new("Actor3", 45)
director3 = Director.new("Director3")
movie3 = Movie.new("Title3", "Sci-fi", director3, actor3)
movie_contract3 = MovieContract.new(movie2, 55, 7000, true)




binding.pry

c

# # #

# puts ironman1

# puts role1.team

#

# 1. Make your Role model more robust (add in attributes that make sense)
# 2. A movie should have many viewers
# 3. Viewers can watch many movies
# 4. A Movie can have many awards
# 5. An Actor can have many awards
# 6. A Movie belongs to a Director
# 7. An Actor has many Directors through Movie
