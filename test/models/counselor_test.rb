require 'test_helper'

class CounselorTest < ActiveSupport::TestCase
  should belong_to(:user)
end
