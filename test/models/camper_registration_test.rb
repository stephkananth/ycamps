require 'test_helper'

class CamperRegistrationTest < ActiveSupport::TestCase
  should belong_to(:camp)
  should belong_to(:camper)

  context 'within context' do
    setup do
    end

    teardown do
    end

    should 'show that duplicate registrations cannot be created' do
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

      registration1 = FactoryBot.create(:camper_registration, camp: @first_term, camper: @alex)
      deny FactoryBot.create(:camper_registration, camp: @first_term, camper: @alex).valid?

      deny registration2.valid?

      registration1.delete
      registration2.delete

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