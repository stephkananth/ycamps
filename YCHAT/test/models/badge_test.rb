require 'test_helper'

class BadgeTest < ActiveSupport::TestCase
	should belong_to(:skill)
	should have_many(:camp_badges)

	should validate_presence_of(:skill_id)
	should validate_presence_of(:name)
	should validate_uniqueness_of(:name).case_insensitive


end
