require 'test_helper'

class ParentTest < ActiveSupport::TestCase
 	should belong_to(:user)
	should have_many(:campers)
end
