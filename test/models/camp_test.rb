# frozen_string_literal: true

require 'test_helper'

class CampTest < ActiveSupport::TestCase
  should belong_to(:location)
  should have_one(:branch).through(:location)

  should have_many(:camp_badges)
  should have_many(:badges).through(:camp_badges)
  should have_many(:camper_camp_badges).through(:camp_badges)
  # should have_many(:campers).through(:camper_camp_badges)
  should have_many(:counselor_camp_badges).through(:camp_badges)
  # should have_many(:counselors).through(:counselor_camp_badges)

  should validate_presence_of(:location_id)
  should validate_presence_of(:name)
  should validate_presence_of(:program)
  should validate_presence_of(:start_date)
  should validate_presence_of(:end_date)

  should_not allow_value('bad').for(:start_date)
  should allow_value(Date.today).for(:start_date)
  should allow_value(1.day.from_now.to_date).for(:start_date)
  # should_not allow_value(1.day.ago.to_date).for(:start_date)
  should_not allow_value('bad').for(:start_date)
  should_not allow_value(2).for(:start_date)
  should_not allow_value(3.14159).for(:start_date)

  should_not allow_value('bad').for(:end_date)
  should_not allow_value(2).for(:end_date)
  should_not allow_value(3.14159).for(:end_date)
  should_not allow_value('bad').for(:end_date)

  context 'within context' do
    setup do
      create_more_branches
      create_more_locations
      create_camps
    end

    teardown do
      delete_camps
      delete_more_locations
      delete_more_branches
    end

    should 'show that active scope works' do
      assert_equal 6, Camp.active.size
      assert_equal ['First Term', 'Fourth Term', 'LDP at Brookwoods', 'LDP at Deer Run', 'Second Term', 'Third Term'], Camp.active.alphabetical.map(&:name)
    end

    should 'show that inactive scope works' do
      assert_equal 1, Camp.inactive.size
      assert_equal ['Inactive Term'], Camp.inactive.alphabetical.map(&:name)
    end

    should 'show that alphabetical scope works' do
      assert_equal ['First Term', 'Fourth Term', 'Inactive Term', 'LDP at Brookwoods', 'LDP at Deer Run', 'Second Term', 'Third Term'], Camp.alphabetical.map(&:name)
    end

    should 'show that chronological scope works' do
      assert_equal ['First Term', 'LDP at Deer Run', 'LDP at Brookwoods', 'Second Term', 'Third Term', 'Inactive Term', 'Fourth Term'], Camp.all.chronological.map(&:name)
    end

    should 'show that upcoming scope works' do
      create_generic_branch
      create_generic_location
      create_generic_camps
      assert_equal 7, Camp.upcoming.size
      assert_equal ['First Term', 'Fourth Term', 'Inactive Term', 'LDP at Brookwoods', 'LDP at Deer Run', 'Second Term', 'Third Term'], Camp.upcoming.alphabetical.map(&:name)
      delete_generic_camps
      delete_generic_location
      delete_generic_branch
    end

    should 'show that past scope works' do
      create_generic_branch
      create_generic_location
      create_generic_camps
      assert_equal ['Camp 1', 'Camp 2'], Camp.past.alphabetical.map(&:name)
      delete_generic_camps
      delete_generic_location
      delete_generic_branch
    end

    should 'show that current scope works' do
      create_generic_branch
      create_generic_location
      create_generic_camps
      # assert_equal 1, Camp.current.size
      assert_equal ['Camp 3'], Camp.current.alphabetical.map(&:name)
      delete_generic_camps
      delete_generic_location
      delete_generic_branch
    end

    should 'show that duplicate camps cannot be created' do
      @bad = FactoryBot.build(:camp, location: @deer_run, name: 'LDP at Deer Run', program: 'Leadership Development', start_date: Date.parse('2019-06-23'), end_date: Date.parse('2019-08-17'))
      deny @bad.valid?
    end

    should 'show that the campers method works' do
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
      assert_equal [@camper, @alex, @mark], @camp3.campers
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
  end
end
