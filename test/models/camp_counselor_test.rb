# frozen_string_literal: true

require 'test_helper'

class CampCounselorTest < ActiveSupport::TestCase
  should belong_to(:camp)
  should belong_to(:counselor)

  context 'within context' do
    setup do
    end

    teardown do
    end

    should 'show that duplicate camp counselor entities cannot be made' do
      create_generic_user
      create_users
      create_generic_parent
      create_parents
      create_generic_camper
      create_campers
      create_generic_skill
      create_generic_badges
      create_generic_tasks
      create_generic_branch
      create_more_branches
      create_generic_location
      create_more_locations
      create_generic_camps
      create_camps
      create_counselors

      camp_counselor1 = FactoryBot.create(:camp_counselor, camp: @first_term, counselor: @becca)
      camp_counselor2 = FactoryBot.build(:camp_counselor, camp: @first_term, counselor: @becca)

      deny camp_counselor2.valid?

      camp_counselor1.delete
      camp_counselor2.delete

      delete_counselors
      delete_camps
      delete_generic_camps
      delete_generic_location
      delete_more_locations
      delete_generic_branch
      delete_more_branches
      delete_generic_tasks
      delete_generic_badges
      delete_generic_skill
      delete_campers
      delete_generic_camper
      delete_parents
      delete_generic_parent
      delete_users
      delete_generic_user
    end

    should 'show that camp counselors cannot be assigned to more than one camp at the same time' do
      create_generic_user
      create_users
      create_generic_parent
      create_parents
      create_generic_camper
      create_campers
      create_generic_skill
      create_generic_badges
      create_generic_tasks
      create_generic_branch
      create_more_branches
      create_generic_location
      create_more_locations
      create_generic_camps
      create_camps
      create_counselors

      camp_counselor1 = FactoryBot.create(:camp_counselor, camp: @first_term, counselor: @becca)
      camp_counselor2 = FactoryBot.build(:camp_counselor, camp: @ldp_girls, counselor: @becca)

      deny camp_counselor2.valid?

      camp_counselor1.delete
      camp_counselor2.delete

      delete_counselors
      delete_camps
      delete_generic_camps
      delete_generic_location
      delete_more_locations
      delete_generic_branch
      delete_more_branches
      delete_generic_tasks
      delete_generic_badges
      delete_generic_skill
      delete_campers
      delete_generic_camper
      delete_parents
      delete_generic_parent
      delete_users
      delete_generic_user
    end
  end
end
