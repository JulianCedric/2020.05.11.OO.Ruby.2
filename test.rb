# CRUD AR APP:  MyFlatironNotesApp
# CREATOR:      Julian Pormentilla
# CREATE:       Users should be able to create their own notes. 
# READ:         Users should be able to search all their notes (as well as by mod, title, and date).
# UPDATE:       Users should be able to make changes to their notes (as well as update a note's mod, title, or date). 
# DELETE:       Users should be able to delete their notes (all of them or only specific ones by mod, title, or date).  

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
 
# CREATE: Users should be able to create their own notes. 

    def create_new_note(mod, title, date)
        # Creates a new note.
        Note.new(self, mod, title, date)
        # Optional: 
            # puts "You've just created a new note! \nWould you like to add info about the main topics of the mod you're currently at?"
        # Prompt user response. 
        # Capture YES / NO response. 
        # Create conditional for subsequent app actions. (under construction)
    end

# READ: Users should be able to search all their notes (as well as by mod, title, and date).

    def notes
        # Returns all notes that belong to a particular user. 
        Note.all.select do |note|
            note.user == self 
        end
    end

    def search_my_notes_by_mod(mod)
        # Returns all of a user's notes by mod. 
        my_notes_by_mod = notes.map do |note|
            note.mod
        end
        my_notes_by_mod  
    end  

    def search_my_notes_by_title(title)
        # Returns all of a user's notes by title. 
        my_notes_by_title = notes.map do |note|
            note.title
        end
        my_notes_by_title  
    end

    def search_my_notes_by_date(mod)
        # Returns all of a user's notes by date. 
        my_notes_by_date = notes.map do |note|
            note.date
        end
        my_notes_by_date   
    end

# UPDATE: Users should be able to make changes to their notes (as well as update a note's mod, title, or date). 

    def change_mod(current_mod, updated_mod)
        note_to_update = notes.find do |note|
            note.mod == note.current_mod 
        end
        note_to_update.mod = "#{updated_mod}"
        puts "You've just updated your note's mod to #{updated_title}"
    end

    def change_title(current_title, updated_title)
        note_to_update = notes.find do |note|
            note.title == current_title
        end 
        note_to_update.title = "#{updated_title}"
        puts "You've just updated your note's title to #{updated_title}"
    end

    def change_date(current_date, updated_date)
        note_to_update = notes.find do |note|
            notes.date == current_date
        end 
        note_to_update.date = "#{updated_date}"
        puts "You've just updated your note's title to #{updated_date}"
    end

# DELETE: Users should be able to delete their notes (all of them or only specific ones by mod, title, or date).  

    def delete_all_my_notes
        puts "Are you sure you want to delete all your notes? \nThat's ALL of them. \nForever."
        # Prompt user's response of either Yes / No. 
        # Create conditional for subsequent actions depending on their response of either Yes / No. 
            # If we capture a Yes response, then..  
        notes.delete_if do |note|
            note.user == self
        end
        puts "You've just deleted all your notes.. ALL of them.. Forever."
    end

    def find_and_delete_note_by_mod(mod)
        notes.delete_if do |note|
            note.mod == mod 
        end
    end 

    def find_and_delete_note_by_title(title)
        notes.delete_if do |title|
            note.title == mod 
        end
    end
    
    def find_and_delete_note_by_date(date)
        notes.delete_if do |note|
            note.date == date 
        end
    end

end

class Mod 
    @@all = []
    attr_accessor :number 

    def initialize(number)
        @number = number 
        Mod.all << self 
    end

    def self.all
        @@all
    end

    def main_topics(number)
        # Returns the main topics of a particular mod by user's entering in a mod's number. (e.g. Enter 1 to return Mod 1 main topics.)
        if number == 1 
            puts "Module 1: Programming Fundamentals \n(weeks 1-3) \nAfter diving into the fundamentals of programming, students get comfortable with object-oriented programming and storing databases using SQL and Object Relational Mappers."
        elsif number == 2
            puts "Module 2: Web Frameworks \n(weeks 4-6) \nStudents learn two key Ruby frameworks, first mastering the fundamentals of web programming with Sinatra before experiencing how quickly they can build incredible apps with Rails."
        elsif number == 3
            puts "Module 3: JavaScript \n(weeks 7-9) \nStudents gain a thorough understanding of Javascript – crucial for front-end developers."
        elsif number == 4 
            puts "Module 4: Front-end Frameworks \n(weeks 10-12) \nStudents learn to build productive, scalable front-ends with React and Redux, creating slick, functional, reactive code with Redux as a state manager and Rails as the back-end JSON API."
        elsif number == 5
            puts "Solo Projects \n(weeks 13-15) \nAfter completing four curriculum modules focused on group projects, students work with instructors to come up with solo project concepts and spend three full weeks building truly sophisticated applications on their own. Students receive plenty of instructor feedback along the way while diving deep into various advanced technologies needed to bring their concepts to life."
        else 
            puts "You've entered an invalid number. Please enter numbers 1 - 5 only. Thanks!" 
        end
    end
end 

class Note 
    # The Joiner Model.  
    @@all = [] 
    attr_reader :user, :mod  
    attr_accessor :title, :date

    def initialize(user, mod, title, date)
        @user = user
        @mod = mod
        @title = title
        @date = date
        @enter_notes_here
        Note.all << self 
    end

    def self.all
        @@all
    end

    def enter_notes_here
        "You can write your notes here: \n \n \n \n \n \n \n"
        # How do I capture users' input (their notes) here? 
    end

end

# # # 

puts "'User' tests"
puts " " 
puts " " 
puts " "
user1 = User.new("Adam")
puts user1.create_new_note("1", "Today", "May 15, 2020")
puts user1.search_my_notes_by_title("Today")
puts user1.notes 
puts user1.delete_all_my_notes
user2 = User.new("Belle")
puts user2.name 
user3 = User.new("Chris")
puts user3.name 
puts " " 
puts " " 
puts " " 
puts "'Mod' tests"
puts " " 
puts " " 
puts " "
mod1 = Mod.new("Module 1")
puts mod1
puts mod1.main_topics(3)
puts " " 
puts " " 
puts " " 
puts "'Note' tests" 
puts " " 
puts " " 
puts " "
note1 = Note.new(user1, mod1, "Test Title", "Sample Date")
puts note1 
puts note1.user  
puts note1.user.name 
puts note1.mod.number 
note2 = Note.new(user2, mod1, "Test Title", "Sample Date")
puts note2 
puts note2.enter_notes_here

# # # 

# 