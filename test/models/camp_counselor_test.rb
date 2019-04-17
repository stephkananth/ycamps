require "test_helper"
class CampCounselorTest < ActiveSupport::TestCase
  should belong_to(:camp)
  should belong_to(:counselor)
end