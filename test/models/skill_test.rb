require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  should have_many(:badges)

  should validate_presence_of(:name)
  should validate_presence_of(:category)

  context 'Within context' do
    setup do
      create_skills
      create_badges
    end
    teardown do
      delete_badges
      delete_skills
    end
  end

  # should 'verify the alphabetical scope works' do
  #   assert_equal 2, Skill.alphabetical.all.length
  # end
end
