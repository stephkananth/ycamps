require 'test_helper'

class CamperCampBadgeTaskTest < ActiveSupport::TestCase
  include AssignMilestoneHelper

  should belong_to (:camper_camp_badge)
  should belong_to (:task)

  should validate_presence_of(:camper_camp_badge_id)
  should validate_presence_of(:task_id)

  context 'within context' do
    should 'verify scopes works' do
      create_generic_user
      create_users
      create_generic_parent
      create_parents
      create_generic_camper
      create_campers
      create_generic_skill
      create_generic_badges
      create_generic_tasks
      create_generic_branch
      create_more_branches
      create_generic_location
      create_more_locations
      create_generic_camps
      create_camps
      create_generic_camp_badges
      create_generic_camper_camp_badges
      create_camper_camp_badge_tasks
      assert_equal 3, CamperCampBadgeTask.completed.size
      assert_equal 1, CamperCampBadgeTask.incomplete.size
      delete_camper_camp_badge_tasks
      delete_generic_camper_camp_badges
      delete_generic_camp_badges
      delete_camps
      delete_generic_camps
      delete_generic_location
      delete_more_locations
      delete_generic_branch
      delete_more_branches
      delete_generic_tasks
      delete_generic_badges
      delete_generic_skill
      delete_campers
      delete_generic_camper
      delete_parents
      delete_generic_parent
      delete_users
      delete_generic_user
    end

    should 'verify mark as completed callback works' do
      create_generic_user
      create_users
      create_generic_parent
      create_parents
      create_generic_camper
      create_campers
      create_generic_skill
      create_generic_badges
      create_generic_tasks
      create_generic_branch
      create_more_branches
      create_generic_location
      create_more_locations
      create_generic_camps
      create_camps
      create_generic_camp_badges
      create_generic_camper_camp_badges
      create_camper_camp_badge_tasks

      deny @camper_camp_badge3.completed
      assert_equal 3, @camper_camp_badge3.tasks.completed.size
      @camper_task4.complete
      @camper_task4.save!
      assert_equal 4, @camper_camp_badge3.tasks.completed.size
      assert @camper_camp_badge3.completed

      delete_camper_camp_badge_tasks
      delete_generic_camper_camp_badges
      delete_generic_camp_badges
      delete_camps
      delete_generic_camps
      delete_generic_location
      delete_more_locations
      delete_generic_branch
      delete_more_branches
      delete_generic_tasks
      delete_generic_badges
      delete_generic_skill
      delete_campers
      delete_generic_camper
      delete_parents
      delete_generic_parent
      delete_users
      delete_generic_user
    end

    should 'verify assign milestone helper method works' do
      create_generic_user
      create_users
      create_generic_parent
      create_parents
      create_generic_camper
      create_campers
      create_generic_skill
      create_generic_badges
      create_generic_tasks
      create_generic_branch
      create_more_branches
      create_generic_location
      create_more_locations
      create_generic_camps
      create_camps
      create_generic_camp_badges
      create_generic_camper_camp_badges
      create_camper_camp_badge_tasks

      deny @camper_camp_badge3.completed
      assert_equal 3, @camper_camp_badge3.tasks.completed.size
      @camper_task4.complete
      assign_milestones_to_campers(@task4.id, @camp_badge3.id, [@camper])
      assert_equal 4, @camper_camp_badge3.tasks.completed.size
      assert @camper_camp_badge3.completed

      delete_camper_camp_badge_tasks
      delete_generic_camper_camp_badges
      delete_generic_camp_badges
      delete_camps
      delete_generic_camps
      delete_generic_location
      delete_more_locations
      delete_generic_branch
      delete_more_branches
      delete_generic_tasks
      delete_generic_badges
      delete_generic_skill
      delete_campers
      delete_generic_camper
      delete_parents
      delete_generic_parent
      delete_users
      delete_generic_user
    end

    should 'show that duplicates cannot be made' do
      create_generic_user
      create_users
      create_generic_parent
      create_parents
      create_generic_camper
      create_campers
      create_generic_skill
      create_generic_badges
      create_generic_tasks
      create_generic_branch
      create_more_branches
      create_generic_location
      create_more_locations
      create_generic_camps
      create_camps
      create_generic_camp_badges
      create_generic_camper_camp_badges
      create_camper_camp_badge_tasks

      bad = FactoryBot.build(:camper_camp_badge_task, camper_camp_badge: @camper_camp_badge3, task: @task1, completed: true)
      deny bad.valid?
      bad.delete

      delete_camper_camp_badge_tasks
      delete_generic_camper_camp_badges
      delete_generic_camp_badges
      delete_camps
      delete_generic_camps
      delete_generic_location
      delete_more_locations
      delete_generic_branch
      delete_more_branches
      delete_generic_tasks
      delete_generic_badges
      delete_generic_skill
      delete_campers
      delete_generic_camper
      delete_parents
      delete_generic_parent
      delete_users
      delete_generic_user
    end
  end
end
