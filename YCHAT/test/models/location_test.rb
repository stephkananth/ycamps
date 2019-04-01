require 'test_helper'

class LocationTest < ActiveSupport::TestCase
	should belong_to(:branch)
	should have_many(:camps)

	should validate_presence_of(:branch_id)
	should validate_presence_of(:name)
end
