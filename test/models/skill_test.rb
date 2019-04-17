require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  should have_many(:badges)

  should validate_presence_of(:name)
  should validate_presence_of(:category)

  context 'within context' do
    setup do
    end

    teardown do
    end
  end

  should 'verify the alphabetical scope works' do
    create_skills
    create_generic_skill
    create_badges
    create_generic_badges
    assert_equal ["Archery", "First Aid", "Frisbee", "Skill"], Skill.all.alphabetical.map(&:name)
    delete_generic_badges
    delete_badges
    delete_generic_skill
    delete_skills
  end

  should 'verify that the number of badges method works' do
    create_skills
    create_generic_skill
    create_badges
    create_generic_badges
    assert_equal 2, @skill1.number_of_badges
    delete_generic_badges
    delete_badges
    delete_generic_skill
    delete_skills
  end
end
