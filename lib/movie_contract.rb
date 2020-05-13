class MovieContract
  @@all = []
  attr_accessor :hours, :compensation, :insurance, :status, :contractor
  attr_reader :movie

  def initialize(movie, hours=0, compensation=0, insurance=false, status="pending")
    @movie = movie
    @contractor = nil
    @hours = hours
    @compensation = compensation
    @insurance = insurance
    @status = status
    MovieContract.all << self
  end

  def self.all
    @@all
  end

  def self.total_compensation
    MovieContract.all.map { |m| m.compensation }.sum
  end

  def self.total_num_hours
   MovieContract.all.map { |m| m.hours }.sum
  end

  def self.percentage_with_insurance
   percentage = MovieContract.all.select { |m| m.insurance == true }.count / MovieContract.all.count.to_f * 100
   puts "#{percentage.round(2)}%"
   percentage.round(2)
  end

   def self.average_contract_cost
       self.total_compensation / MovieContract.all.count
   end

   def sign_actor_contract
     self.contractor = self.movie.actor
     self.status = "Active"
   end

   def sign_director_contract
     self.contractor = self.movie.director
     self.status = "Active"
   end

  def cancel_contract
   self.contractor = nil
   self.status = "Closed"
  end

  def sign_contract(contractor)
    self.contractor = contractor
    self.status = "open"
  end

  def change_insurance_status
    if self.insurance
      self.insurance = false
    else
      self.insurance = true
    end
   end

end
