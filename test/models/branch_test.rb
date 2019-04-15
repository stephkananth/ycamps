# frozen_string_literal: true

require 'test_helper'

class BranchTest < ActiveSupport::TestCase
  should have_many(:locations)
  should have_many(:camps).through(:locations)
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name).case_insensitive

  context 'within context' do
    setup do
      create_branches
    end

    teardown do
      delete_branches
    end

    should 'list branches in alphabetical order' do
      assert_equal Branch.alphabetical.all.map(&:name), ['North Boroughs', 'Olympus', 'Thelma Lovette']
    end

    should 'not allow creating a duplicate (also testing case sensitivity) branch name' do
      bad_branch = FactoryBot.build(:branch, name: 'north boroughs')
      deny bad_branch.valid?
    end
  end
end
