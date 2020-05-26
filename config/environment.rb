# require 'pry'
# require_relative '../lib/movie.rb'
# require_relative '../lib/actor.rb'
# require_relative '../lib/role.rb'
# require_relative '../lib/viewer.rb'
# require_relative '../lib/screen.rb'
# require_relative '../lib/award.rb'
# require_relative '../lib/director.rb'
# require_relative '../lib/movie_contract.rb'
require_relative '..space2.rb'

require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: "db/development.sqlite3"
)

ActiveRecord::Base.logger = Logger.new(STDOUT)

require_all 'app'

X = <<-end





end

# 