require "test_helper"

describe CampCounselor do
  let(:camp_counselor) { CampCounselor.new }

  it "must be valid" do
    value(camp_counselor).must_be :valid?
  end
end
