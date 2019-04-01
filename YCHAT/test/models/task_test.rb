require 'test_helper'

class TaskTest < ActiveSupport::TestCase
	should belong_to(:badge)

	should validate_presence_of(:badge_id)
end
