class CamperRegistrationTest < ActiveSupport::TestCase
  should belong_to(:camp)
  should belong_to(:camper)
end