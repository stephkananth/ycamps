require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  should belong_to(:badge)
  should validate_presence_of(:badge_id)

  context 'within context' do
    setup do
      create_generic_skill
      create_generic_badges
      create_generic_tasks
    end

    teardown do
      delete_generic_tasks
      delete_generic_badges
      delete_generic_skill
    end

    should 'show that in alphabetical scope works' do
      assert_equal ['Task 1', 'Task 2', 'Task 3', 'Task 4'], Task.all.alphabetical.map(&:name)
    end

    should 'show that in order scope works' do
      assert_equal ['Task 1', 'Task 2', 'Task 3', 'Task 4'], Task.all.in_order.map(&:name)
    end
  end
end
