require 'test_helper'

class CounselorTest < ActiveSupport::TestCase
  should belong_to(:user)
  should have_many(:counselor_camp_badges)
  should have_many(:camp_badges).through(:counselor_camp_badges)
  should have_many(:camps).through(:camp_badges)
end
