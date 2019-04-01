require 'test_helper'

class BranchTest < ActiveSupport::TestCase
	should have_many(:locations)
	should have_many(:camps).through(:locations)

	should validate_presence_of(:name)
	should validate_uniqueness_of(:name).case_insensitive
end
