require "test_helper"

describe CampCounselorsController do
  let(:camp_counselor) {camp_counselors :one}

  it "gets index" do
    get camp_counselors_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_camp_counselor_url
    value(response).must_be :success?
  end

  it "creates camp_counselor" do
    expect {
      post camp_counselors_url, params: {camp_counselor: {camp_id: camp_counselor.camp_id, counselor_id: camp_counselor.counselor_id}}
    }.must_change "CampCounselor.count"

    must_redirect_to camp_counselor_path(CampCounselor.last)
  end

  it "shows camp_counselor" do
    get camp_counselor_url(camp_counselor)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_camp_counselor_url(camp_counselor)
    value(response).must_be :success?
  end

  it "updates camp_counselor" do
    patch camp_counselor_url(camp_counselor), params: {camp_counselor: {camp_id: camp_counselor.camp_id, counselor_id: camp_counselor.counselor_id}}
    must_redirect_to camp_counselor_path(camp_counselor)
  end

  it "destroys camp_counselor" do
    expect {
      delete camp_counselor_url(camp_counselor)
    }.must_change "CampCounselor.count", -1

    must_redirect_to camp_counselors_path
  end
end
