# frozen_string_literal: true

require 'test_helper'

class CamperTest < ActiveSupport::TestCase
  should belong_to(:parent)
  should have_many(:camper_camp_badges)
  should have_many(:camp_badges).through(:camper_camp_badges)
  should have_many(:camps).through(:camp_badges)

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

    # TODO: Show that you can get camps, currently enrolled camps, etc.

    should 'show that current badge method works' do
      @skill = FactoryBot.create(:skill, name: 'Skill', category: 'Category')
      @badge1 = FactoryBot.create(:badge, skill: @skill, name: 'Badge 1', level: 1)
      @badge2 = FactoryBot.create(:badge, skill: @skill, name: 'Badge 2', level: 2)
      @badge3 = FactoryBot.create(:badge, skill: @skill, name: 'Badge 3', level: 3)

      @branch = FactoryBot.create(:branch, name: 'Branch')
      @location = FactoryBot.create(:location, branch: @branch, name: 'Location')
      @camp1 = FactoryBot.create(:camp, location: @location, name: 'Camp 1', program: 'Camp 1', start_date: Date.parse('2001-02-03'), end_date: Date.parse('2002-02-03'), active: true)
      @camp2 = FactoryBot.create(:camp, location: @location, name: 'Camp 2', program: 'Camp 2', start_date: Date.parse('2019-04-10'), end_date: Date.yesterday, active: true)
      @camp3 = FactoryBot.create(:camp, location: @location, name: 'Camp 3', program: 'Camp 3', start_date: Date.today, end_date: Date.tomorrow, active: true)

      @camp_badge1 = FactoryBot.create(:camp_badge, badge: @badge1, camp: @camp1)
      @camp_badge2 = FactoryBot.create(:camp_badge, badge: @badge2, camp: @camp2)
      @camp_badge3 = FactoryBot.create(:camp_badge, badge: @badge3, camp: @camp3)

      @camper_camp_badge1 = FactoryBot.create(:camper_camp_badge, camp_badge: @camp_badge1, camper: @alex, completed: true)
      @camper_camp_badge2 = FactoryBot.create(:camper_camp_badge, camp_badge: @camp_badge2, camper: @alex, completed: true)
      @camper_camp_badge3 = FactoryBot.create(:camper_camp_badge, camp_badge: @camp_badge3, camper: @alex, completed: false)

      assert_equal @badge3, @alex.current_badge

      @camper_camp_badge1.delete
      @camper_camp_badge2.delete
      @camper_camp_badge3.delete

      @camp_badge1.delete
      @camp_badge2.delete
      @camp_badge3.delete

      @camp1.delete
      @camp2.delete
      @camp3.delete
      @location.delete
      @branch.delete

      @badge1.delete
      @badge2.delete
      @badge3.delete
      @skill.delete
    end
  end
end
