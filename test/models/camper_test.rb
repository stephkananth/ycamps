require 'test_helper'

class CamperTest < ActiveSupport::TestCase
  should belong_to(:parent)
  should have_many(:camper_camp_badges)
  should have_many(:camp_badges).through(:camper_camp_badges)
  should have_many(:camps).through(:camp_badges)

  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_numericality_of(:parent_id).only_integer.is_greater_than(0)

  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_numericality_of(:parent_id).only_integer.is_greater_than(0)
  should allow_value('Good').for(:first_name)
  should_not allow_value('').for(:first_name)
  should_not allow_value(nil).for(:first_name)
  should allow_value('Good').for(:last_name)
  should_not allow_value('').for(:last_name)
  should_not allow_value(nil).for(:last_name)
  should allow_value(1).for(:parent_id)
  should allow_value(100).for(:parent_id)
  should_not allow_value(0).for(:parent_id)
  should_not allow_value(-1).for(:parent_id)
  should_not allow_value(1.5).for(:parent_id)
  should_not allow_value('bad').for(:parent_id)

  
end
