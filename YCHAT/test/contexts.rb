require './test/sets/skills_contexts'
require './test/sets/badges_contexts'
require './test/sets/tasks_contexts'

module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::SkillsContexts
  include Contexts::BadgesContexts
  include Contexts::TasksContexts
end