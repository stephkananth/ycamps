# frozen_string_literal: true

require 'test_helper'

class CamperCampBadgeTest < ActiveSupport::TestCase
  should belong_to(:camp_badge)
  should belong_to(:camper)
  should have_many(:camper_camp_badge_tasks)

  should validate_presence_of(:camp_badge_id)
  should validate_presence_of(:camper_id)

  context 'within context' do
    setup do
      create_users
      create_parents
      create_campers
      create_generic_skill
      create_generic_badges
      create_generic_branch
      create_generic_location
      create_generic_camps
      create_generic_camp_badges
      create_generic_user
      create_generic_parent
      create_generic_camper
      create_generic_camper_camp_badges
      create_more_semi_generic_camper_camp_badges
      create_incomplete_camper_camp_badges
    end

    teardown do
      delete_incomplete_camper_camp_badges
      delete_more_semi_generic_camper_camp_badges
      delete_generic_camper_camp_badges
      delete_generic_camper
      delete_generic_parent
      delete_generic_user
      delete_generic_camp_badges
      delete_generic_camps
      delete_generic_location
      delete_generic_branch
      delete_generic_badges
      delete_generic_skill
      delete_campers
      delete_parents
      delete_users
    end

    should 'show that completed scope works' do
      assert_equal 4, CamperCampBadge.completed.size
    end

    should 'show that incomplete scope works' do
      assert_equal 5, CamperCampBadge.incomplete.size
    end

    should 'show that completed method works' do
      create_generic_tasks
      deny @camper_camp_badge3.completed?
      @camper_task1 = FactoryBot.create(:camper_camp_badge_task, camper_camp_badge: @camper_camp_badge3, task: @task1, completed: true)
      deny @camper_camp_badge3.completed?
      @camper_task2 = FactoryBot.create(:camper_camp_badge_task, camper_camp_badge: @camper_camp_badge3, task: @task2, completed: true)
      deny @camper_camp_badge3.completed?
      @camper_task3 = FactoryBot.create(:camper_camp_badge_task, camper_camp_badge: @camper_camp_badge3, task: @task3, completed: true)
      deny @camper_camp_badge3.completed?
      @camper_task4 = FactoryBot.create(:camper_camp_badge_task, camper_camp_badge: @camper_camp_badge3, task: @task4, completed: true)
      assert @camper_camp_badge3.completed?
      @camper_camp_badge3.complete
      assert @camper_camp_badge3.completed?
      @camper_task1.delete
      @camper_task2.delete
      @camper_task3.delete
      @camper_task4.delete
      delete_generic_tasks
    end

    should 'show that duplicates cannot be made' do
      bad = FactoryBot.build(:camper_camp_badge, camp_badge: @camp_badge1, camper: @camper, completed: true)
      deny bad.valid?
      bad.delete
    end
  end
end
