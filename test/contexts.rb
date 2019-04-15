require './test/sets/users_contexts'
require './test/sets/parents_contexts'
require './test/sets/campers_contexts'
require './test/sets/counselors_contexts'
require './test/sets/branches_contexts'
require './test/sets/locations_contexts'
require './test/sets/camps_contexts'
require './test/sets/skills_contexts'
require './test/sets/badges_contexts'
require './test/sets/tasks_contexts'
require './test/sets/camp_badges_contexts'
require './test/sets/camper_camp_badges_contexts'
require './test/sets/camper_camp_badge_tasks_contexts'
require './test/sets/counselor_camp_badges_contexts'


module Contexts
  # explicitly include all sets of contexts used for testing
  include Contexts::UsersContexts
  include Contexts::ParentsContexts
  include Contexts::CampersContexts
  include Contexts::CounselorsContexts
  include Contexts::BranchesContexts
  include Contexts::LocationsContexts
  include Contexts::CampsContexts
  include Contexts::SkillsContexts
  include Contexts::BadgesContexts
  include Contexts::TasksContexts
  include Contexts::CampBadgesContexts
  include Contexts::CamperCampBadgesContexts
  include Contexts::CamperCampBadgeTasksContexts
  include Contexts::CounselorCampBadgesContexts

  def create_all
    create_users
    create_parents
    create_campers
    create_counselors
    create_branches
    create_locations
    create_camps
    create_skills
    create_badges
    create_tasks
    create_camp_badges
    create_camper_camp_badges
    create_camper_camp_badge_tasks
    create_counselor_camp_badges
  end

  def delete_all
    delete_counselor_camp_badges
    delete_camper_camp_badge_tasks
    delete_camper_camp_badges
    delete_camp_badges
    delete_tasks
    delete_badges
    delete_skills
    delete_camps
    delete_locations
    delete_branches
    delete_counselors
    delete_campers
    delete_parents
    delete_users
  end
end