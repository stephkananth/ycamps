# frozen_string_literal: true

require 'test_helper'

class CamperTest < ActiveSupport::TestCase
  should belong_to(:parent)
  should have_many(:camper_registrations)
  should have_many(:camps).through(:camper_registrations)
  should have_many(:camper_camp_badges)
  should have_many(:camp_badges).through(:camper_camp_badges)

  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_numericality_of(:parent_id).only_integer.is_greater_than(0)

  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_numericality_of(:parent_id).only_integer.is_greater_than(0)
  should allow_value('Good').for(:first_name)
  should_not allow_value('').for(:first_name)
  should_not allow_value(nil).for(:first_name)
  should allow_value('Good').for(:last_name)
  should_not allow_value('').for(:last_name)
  should_not allow_value(nil).for(:last_name)
  should allow_value(1).for(:parent_id)
  should allow_value(100).for(:parent_id)
  should_not allow_value(0).for(:parent_id)
  should_not allow_value(-1).for(:parent_id)
  should_not allow_value(1.5).for(:parent_id)
  should_not allow_value('bad').for(:parent_id)

  context 'within context' do
    setup do
      create_users
      create_parents
      create_campers
    end

    teardown do
      delete_campers
      delete_parents
      delete_users
    end

    should 'show that active scope works' do
      assert_equal(2, Camper.active.size)
      assert_equal(%w[Alex Mark], Camper.active.alphabetical.map(&:first_name))
    end

    should 'show that inactive scope works' do
      assert_equal(1, Camper.inactive.size)
      assert_equal(['Rachel'], Camper.inactive.alphabetical.map(&:first_name))
    end

    should 'show that alphabetical scope works' do
      assert_equal(%w[Alex Mark Rachel], Camper.all.alphabetical.map(&:first_name))
    end

    should 'show that name method works' do
      assert_equal(['Heimann, Alex', 'Heimann, Mark', 'Heimann, Rachel'], Camper.all.alphabetical.map(&:name))
    end

    should 'show that proper name method works' do
      assert_equal(['Alex Heimann', 'Mark Heimann', 'Rachel Heimann'], Camper.all.alphabetical.map(&:proper_name))
    end

    should 'show that current badge method works' do
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
      assert_equal @badge3a, @camper.current_badge
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
    end

    should 'show that current camp badge method works' do
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
      assert_equal @camp_badge3, @camper.current_camp_badge
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
    end

    should 'show that current tasks method works' do
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
      create_generic_tasks
      create_camper_camp_badge_tasks
      assert_equal 4, @camper.current_tasks.size
      delete_camper_camp_badge_tasks
      delete_generic_tasks
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
    end

    should 'show that duplicates cannot be made' do
      bad = FactoryBot.build(:camper, parent: @profh, first_name: 'Alex', last_name: 'Heimann')
      deny bad.valid?
      bad.delete
    end
  end
end
