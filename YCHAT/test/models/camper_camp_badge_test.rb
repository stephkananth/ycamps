require 'test_helper'

class CamperCampBadgeTest < ActiveSupport::TestCase
  should belong_to(:camp_badge)
  should belong_to(:camper)
  should have_many(:camper_camp_badge_tasks)

  should validate_presence_of(:camp_badge_id)
  should validate_presence_of(:camper_id)
end
