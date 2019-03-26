# require needed files

require './test/sets/users'
require './test/sets/branches'
require './test/sets/locations'

module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Users
  include Contexts::Branches
  include Contexts::Locations
  
  def create_all
    create_users
    create_branches
    create_locations
  end
  
end