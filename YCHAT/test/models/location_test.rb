require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  should belong_to(:branch)
  should have_many(:camps)

  should validate_presence_of(:branch_id)
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name).case_insensitive

  context 'Within context' do
    setup do
      create_locations
    end

    teardown do
      delete_locations
    end

    should 'list locations in alphabetical order' do
      assert_equal Location.alphabetical.all.map(&:name), ['Avonworth Community Park', 'Olympus', 'Thelma Lovette YMCA']
    end

    # should 'not allowed creating a duplicate (also testing case sensitivity) branch name' do
    #   bad_location = FactoryBot.build(:location, name: 'avonworth community park')
    #   deny bad_location.valid?
    # end
  end
end
