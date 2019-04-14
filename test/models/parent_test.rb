# frozen_string_literal: true

require 'test_helper'

class ParentTest < ActiveSupport::TestCase
  should belong_to(:user)
  should have_many(:campers)

  should validate_numericality_of(:user_id).only_integer.is_greater_than(0)
  should allow_value(1).for(:user_id)
  should allow_value(100).for(:user_id)
  should_not allow_value(0).for(:user_id)
  should_not allow_value(-1).for(:user_id)
  should_not allow_value(1.5).for(:user_id)
  should_not allow_value(nil).for(:user_id)
  should_not allow_value('bad').for(:user_id)

  context 'within context' do
    setup do
      create_users
      create_parents
    end

    teardown do
      delete_parents
      delete_users
    end

    should 'show that active scope works' do
      assert_equal(3, Parent.active.size)
      assert_equal(%w[Ananth Heimann Tables], Parent.active.alphabetical.map(&:last_name))
    end

    should 'show that inactive scope works' do
      assert_equal(1, Parent.inactive.size)
      assert_equal(%w[Inactive], Parent.inactive.alphabetical.map(&:last_name))
    end

    should 'show that alphabetical scope works' do
      assert_equal(%w[Ananth Heimann Inactive Tables], Parent.all.alphabetical.map(&:last_name))
    end

    should 'show that name method works' do
      assert_equal(['Ananth, Aneena', 'Heimann, Larry', 'Inactive, Parent', 'Tables, Lisa'], Parent.all.alphabetical.map(&:name))
    end

    should 'show that proper name method works' do
      assert_equal(['Aneena Ananth', 'Larry Heimann', 'Parent Inactive', 'Lisa Tables'], Parent.all.alphabetical.map(&:proper_name))
    end

    should 'show that first name method works' do
      assert_equal(['Aneena', 'Larry', 'Parent', 'Lisa'], Parent.all.alphabetical.map(&:first_name))
    end

    should 'show that last name method works' do
      assert_equal(['Ananth', 'Heimann', 'Inactive', 'Tables'], Parent.all.alphabetical.map(&:last_name))
    end
  end
end
