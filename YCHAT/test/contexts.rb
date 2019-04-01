require './test/sets/skills_contexts'
require './test/sets/badges_contexts'
require './test/sets/tasks_contexts'
require './test/sets/branches_contexts'
require './test/sets/camps_contexts'
require './test/sets/users'
require './test/sets/branches'
require './test/sets/locations'

module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::SkillsContexts
  include Contexts::BadgesContexts
  include Contexts::TasksContexts
  include Contexts::CampsContexts
  include Contexts::BranchesContexts
  include Contexts::Users
  include Contexts::Branches
  include Contexts::Locations

  def create_all
    create_users
    create_branches
    create_locations
  end
end