# frozen_string_literal: true

require 'test_helper'

class CampTest < ActiveSupport::TestCase
  should belong_to(:location)
  should have_one(:branch).through(:location)

  should have_many(:camp_badges)
  should have_many(:badges).through(:camp_badges)
  should have_many(:camper_camp_badges).through(:camp_badges)
  should have_many(:campers).through(:camper_camp_badges)
  should have_many(:counselor_camp_badges).through(:camp_badges)
  should have_many(:counselors).through(:counselor_camp_badges)

  should validate_presence_of(:location_id)
  should validate_presence_of(:name)
  should validate_presence_of(:program)
  should validate_presence_of(:start_date)
  should validate_presence_of(:end_date)

  should_not allow_value('bad').for(:start_date)
  should allow_value(Date.today).for(:start_date)
  should allow_value(1.day.from_now.to_date).for(:start_date)
  should_not allow_value(1.day.ago.to_date).for(:start_date)
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

    # should 'show that active scope works' do
    #   assert_equal 6, Camp.active.size
    # end
  end
end
