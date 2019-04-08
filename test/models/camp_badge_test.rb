require 'test_helper'

class CampBadgeTest < ActiveSupport::TestCase
  should belong_to(:badge)
  should belong_to(:camp)

  should validate_presence_of(:badge_id)
  should validate_presence_of(:camp_id)
end
