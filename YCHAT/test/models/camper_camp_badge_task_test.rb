require 'test_helper'

class CamperCampBadgeTaskTest < ActiveSupport::TestCase
	should belong_to (:camper_camp_badge)
	should belong_to (:task)

	should validate_presence_of(:camper_camp_badge_id)
	should validate_presence_of(:task_id)
end
