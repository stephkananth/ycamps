# frozen_string_literal: true

require 'test_helper'

class CounselorTest < ActiveSupport::TestCase
  should belong_to(:user)
  should have_many(:counselor_camp_badges)
  should have_many(:camp_badges).through(:counselor_camp_badges)
  should have_many(:camps).through(:camp_badges)

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
      create_counselors
    end

    teardown do
      delete_counselors
      delete_users
    end

    should 'show that active scope works' do
      assert_equal(3, Counselor.active.size)
      assert_equal(%w[Steph Becca Matt], Counselor.active.alphabetical.map(&:first_name))
    end

    should 'show that inactive scope works' do
      assert_equal(1, Counselor.inactive.size)
      assert_equal(['Hannah'], Counselor.inactive.alphabetical.map(&:first_name))
    end

    should 'show that alphabetical scope works' do
      assert_equal(%w[Steph Becca Hannah Matt], Counselor.alphabetical.map(&:first_name))
    end

    should 'show that first name method works' do
      assert_equal(%w[Steph Becca Hannah Matt], Counselor.alphabetical.map(&:first_name))
    end

    should 'show that last name method works' do
      assert_equal(%w[Ananth Kern Kern Kern], Counselor.alphabetical.map(&:last_name))
    end

    should 'show that name method works' do
      assert_equal(['Ananth, Steph', 'Kern, Becca', 'Kern, Hannah', 'Kern, Matt'], Counselor.alphabetical.map(&:name))
    end

    should 'show that proper name method works' do
      assert_equal(['Steph Ananth', 'Becca Kern', 'Hannah Kern', 'Matt Kern'], Counselor.alphabetical.map(&:proper_name))
    end
  end
end
