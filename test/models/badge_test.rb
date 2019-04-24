require 'test_helper'

class BadgeTest < ActiveSupport::TestCase
  should belong_to(:skill)
  should have_many(:camp_badges)

  should validate_presence_of(:skill_id)
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name).case_insensitive

  context 'within context' do
    setup do
    end

    teardown do
    end

    should 'show that alphabetical scope works' do
      create_generic_skill
      create_generic_badges
      assert_equal ['Badge 1', 'Badge 2', 'Badge 3'], Badge.all.alphabetical.map(&:name)
      delete_generic_badges
      delete_generic_skill
    end

    should 'show that camps method works' do
      create_generic_branch
      create_more_branches
      create_generic_location
      create_more_locations
      create_generic_camps
      create_camps
      create_generic_skill
      create_skills
      create_generic_badges
      create_badges
      create_generic_camp_badges
      create_more_camp_badges
      assert_equal 3, @badge1.camps.size
      assert_equal 2, @badge2.camps.size
      delete_more_camp_badges
      delete_generic_camp_badges
      delete_badges
      delete_generic_badges
      delete_skills
      delete_generic_skill
      delete_camps
      delete_generic_camps
      delete_more_locations
      delete_generic_location
      delete_more_branches
      delete_generic_branch
    end

    should 'show that duplicate badges cannot be created' do
      create_generic_skill
      create_generic_badges

      @bad = FactoryBot.build(:badge, skill: @skill, name: 'Badge 1', level: 1)
      deny @bad.valid?

      delete_generic_badges
      delete_generic_skill
    end
  end
end
