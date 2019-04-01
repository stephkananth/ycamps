require 'test_helper'

class CounselorCampBadgesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @counselor_camp_badge = counselor_camp_badges(:one)
  end

  test "should get index" do
    get counselor_camp_badges_url
    assert_response :success
  end

  test "should get new" do
    get new_counselor_camp_badge_url
    assert_response :success
  end

  test "should create counselor_camp_badge" do
    assert_difference('CounselorCampBadge.count') do
      post counselor_camp_badges_url, params: {counselor_camp_badge: {camp_badge_id: @counselor_camp_badge.camp_badge_id, counselor_id: @counselor_camp_badge.counselor_id}}
    end

    assert_redirected_to counselor_camp_badge_url(CounselorCampBadge.last)
  end

  test "should show counselor_camp_badge" do
    get counselor_camp_badge_url(@counselor_camp_badge)
    assert_response :success
  end

  test "should get edit" do
    get edit_counselor_camp_badge_url(@counselor_camp_badge)
    assert_response :success
  end

  test "should update counselor_camp_badge" do
    patch counselor_camp_badge_url(@counselor_camp_badge), params: {counselor_camp_badge: {camp_badge_id: @counselor_camp_badge.camp_badge_id, counselor_id: @counselor_camp_badge.counselor_id}}
    assert_redirected_to counselor_camp_badge_url(@counselor_camp_badge)
  end

  test "should destroy counselor_camp_badge" do
    assert_difference('CounselorCampBadge.count', -1) do
      delete counselor_camp_badge_url(@counselor_camp_badge)
    end

    assert_redirected_to counselor_camp_badges_url
  end
end
