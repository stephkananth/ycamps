require 'test_helper'

class CamperCampBadgeTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @camper_camp_badge_task = camper_camp_badge_tasks(:one)
  end

  test "should get index" do
    get camper_camp_badge_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_camper_camp_badge_task_url
    assert_response :success
  end

  test "should create camper_camp_badge_task" do
    assert_difference('CamperCampBadgeTask.count') do
      post camper_camp_badge_tasks_url, params: { camper_camp_badge_task: { camper_camp_badge_id: @camper_camp_badge_task.camper_camp_badge_id, completed: @camper_camp_badge_task.completed, task_id: @camper_camp_badge_task.task_id } }
    end

    assert_redirected_to camper_camp_badge_task_url(CamperCampBadgeTask.last)
  end

  test "should show camper_camp_badge_task" do
    get camper_camp_badge_task_url(@camper_camp_badge_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_camper_camp_badge_task_url(@camper_camp_badge_task)
    assert_response :success
  end

  test "should update camper_camp_badge_task" do
    patch camper_camp_badge_task_url(@camper_camp_badge_task), params: { camper_camp_badge_task: { camper_camp_badge_id: @camper_camp_badge_task.camper_camp_badge_id, completed: @camper_camp_badge_task.completed, task_id: @camper_camp_badge_task.task_id } }
    assert_redirected_to camper_camp_badge_task_url(@camper_camp_badge_task)
  end

  test "should destroy camper_camp_badge_task" do
    assert_difference('CamperCampBadgeTask.count', -1) do
      delete camper_camp_badge_task_url(@camper_camp_badge_task)
    end

    assert_redirected_to camper_camp_badge_tasks_url
  end
end
