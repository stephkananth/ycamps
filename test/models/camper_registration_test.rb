require "test_helper"

describe CamperRegistration do
  let(:camper_registration) { CamperRegistration.new }

  it "must be valid" do
    value(camper_registration).must_be :valid?
  end
end
