require 'test_helper'

class CampTest < ActiveSupport::TestCase
  should belong_to(:location)
  should have_many(:camp_badges)

  should validate_presence_of(:location_id)
  should validate_presence_of(:name)
  should validate_presence_of(:program)
  should validate_presence_of(:start_date)
  should validate_presence_of(:end_date)

  should_not allow_value("bad").for(:start_date)
  should_not allow_value("bad").for(:end_date)
end
