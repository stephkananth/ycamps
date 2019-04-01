require 'test_helper'

class CampBadgesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @camp_badge = camp_badges(:one)
  end

  test "should get index" do
    get camp_badges_url
    assert_response :success
  end

  test "should get new" do
    get new_camp_badge_url
    assert_response :success
  end

  test "should create camp_badge" do
    assert_difference('CampBadge.count') do
      post camp_badges_url, params: {camp_badge: {badge_id: @camp_badge.badge_id, camp_id: @camp_badge.camp_id}}
    end

    assert_redirected_to camp_badge_url(CampBadge.last)
  end

  test "should show camp_badge" do
    get camp_badge_url(@camp_badge)
    assert_response :success
  end

  test "should get edit" do
    get edit_camp_badge_url(@camp_badge)
    assert_response :success
  end

  test "should update camp_badge" do
    patch camp_badge_url(@camp_badge), params: {camp_badge: {badge_id: @camp_badge.badge_id, camp_id: @camp_badge.camp_id}}
    assert_redirected_to camp_badge_url(@camp_badge)
  end

  test "should destroy camp_badge" do
    assert_difference('CampBadge.count', -1) do
      delete camp_badge_url(@camp_badge)
    end

    assert_redirected_to camp_badges_url
  end
end
