require "test_helper"

describe CamperRegistrationsController do
  let(:camper_registration) {camper_registrations :one}

  it "gets index" do
    get camper_registrations_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_camper_registration_url
    value(response).must_be :success?
  end

  it "creates camper_registration" do
    expect {
      post camper_registrations_url, params: {camper_registration: {camp_id: camper_registration.camp_id, camper_id: camper_registration.camper_id}}
    }.must_change "CamperRegistration.count"

    must_redirect_to camper_registration_path(CamperRegistration.last)
  end

  it "shows camper_registration" do
    get camper_registration_url(camper_registration)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_camper_registration_url(camper_registration)
    value(response).must_be :success?
  end

  it "updates camper_registration" do
    patch camper_registration_url(camper_registration), params: {camper_registration: {camp_id: camper_registration.camp_id, camper_id: camper_registration.camper_id}}
    must_redirect_to camper_registration_path(camper_registration)
  end

  it "destroys camper_registration" do
    expect {
      delete camper_registration_url(camper_registration)
    }.must_change "CamperRegistration.count", -1

    must_redirect_to camper_registrations_path
  end
end
