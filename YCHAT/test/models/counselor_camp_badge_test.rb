require 'test_helper'

class CounselorCampBadgeTest < ActiveSupport::TestCase
	should belong_to(:camp_badge)
	should belong_to(:counselor)

	should validate_presence_of(:camp_badge_id)
	should validate_presence_of(:counselor_id)
end
