require 'test_helper'

class BranchTest < ActiveSupport::TestCase
	should have_many(:locations)
  	should have_many(:camps).through(:locations)
  	should validate_uniqueness_of(:name).case_insensitive

  	context "Within context" do
		setup do
		  create_branches
		end

		teardown do
		  delete_branches
		end

		should "list branch in alphabetical order" do
	      assert_equal Branch.alphabetical.all.map(&:name), ["North Boroughs", "Olympus",  "Thelma Lovette"]
	    end

	    should "not allowed creating a duplicate (also testing case sensitivity) branch name" do
	    	bad_branch = FactoryBot.build(:branch, name: "north boroughs")
	    	deny bad_branch.valid?
	    end
	end
end
