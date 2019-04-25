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

    should 'show that duplicate tasks cannot be made' do
      bad_task = FactoryBot.build(:task, badge: @badge3a, name: 'Task 1', order: 1)
      deny bad_task.valid?
      bad_task.delete
    end
  end
end
