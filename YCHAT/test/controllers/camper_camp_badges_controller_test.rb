require 'test_helper'

class CamperCampBadgesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @camper_camp_badge = camper_camp_badges(:one)
  end

  test "should get index" do
    get camper_camp_badges_url
    assert_response :success
  end

  test "should get new" do
    get new_camper_camp_badge_url
    assert_response :success
  end

  test "should create camper_camp_badge" do
    assert_difference('CamperCampBadge.count') do
      post camper_camp_badges_url, params: {camper_camp_badge: {camp_badge_id: @camper_camp_badge.camp_badge_id, camper_id: @camper_camp_badge.camper_id, completed: @camper_camp_badge.completed}}
    end

    assert_redirected_to camper_camp_badge_url(CamperCampBadge.last)
  end

  test "should show camper_camp_badge" do
    get camper_camp_badge_url(@camper_camp_badge)
    assert_response :success
  end

  test "should get edit" do
    get edit_camper_camp_badge_url(@camper_camp_badge)
    assert_response :success
  end

  test "should update camper_camp_badge" do
    patch camper_camp_badge_url(@camper_camp_badge), params: {camper_camp_badge: {camp_badge_id: @camper_camp_badge.camp_badge_id, camper_id: @camper_camp_badge.camper_id, completed: @camper_camp_badge.completed}}
    assert_redirected_to camper_camp_badge_url(@camper_camp_badge)
  end

  test "should destroy camper_camp_badge" do
    assert_difference('CamperCampBadge.count', -1) do
      delete camper_camp_badge_url(@camper_camp_badge)
    end

    assert_redirected_to camper_camp_badges_url
  end
end
