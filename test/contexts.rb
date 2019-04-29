# frozen_string_literal: true

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
    create_generic_user
    create_parents
    create_generic_parent
    create_campers
    create_generic_camper
    create_counselors
    create_branches
    create_more_branches
    create_generic_branch
    create_locations
    create_more_locations
    create_generic_location
    create_camps
    create_generic_camps
    create_skills
    create_generic_skill
    create_badges
    create_generic_badges
    create_tasks
    create_generic_tasks
    create_camp_badges
    create_generic_camp_badges
    create_more_camp_badges
    create_camper_camp_badges
    create_generic_camper_camp_badges
    create_more_semi_generic_camper_camp_badges
    create_incomplete_camper_camp_badges
    create_camper_camp_badge_tasks
    create_counselor_camp_badges
  end

  def delete_all
    delete_counselor_camp_badges
    delete_camper_camp_badge_tasks
    delete_incomplete_camper_camp_badges
    delete_more_semi_generic_camper_camp_badges
    delete_generic_camper_camp_badges
    delete_camper_camp_badges
    delete_more_camp_badges
    delete_generic_camp_badges
    delete_camp_badges
    delete_generic_tasks
    delete_tasks
    delete_generic_badges
    delete_badges
    delete_generic_skill
    delete_skills
    delete_generic_camps
    delete_camps
    delete_generic_location
    delete_more_locations
    delete_locations
    delete_generic_branch
    delete_more_branches
    delete_branches
    delete_counselors
    delete_generic_camper
    delete_campers
    delete_generic_parent
    delete_parents
    delete_generic_user
    delete_users
  end
end
