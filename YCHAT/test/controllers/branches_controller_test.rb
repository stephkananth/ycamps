require 'test_helper'

class BranchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @branch = branches(:one)
  end

  test "should get index" do
    get branches_url
    assert_response :success
  end

  test "should get new" do
    get new_branch_url
    assert_response :success
  end

  test "should create branch" do
    assert_difference('Branch.count') do
      post branches_url, params: { branch: { name: @branch.name } }
    end

    assert_redirected_to branch_url(Branch.last)
  end

  test "should show branch" do
    get branch_url(@branch)
    assert_response :success
  end

  test "should get edit" do
    get edit_branch_url(@branch)
    assert_response :success
  end

  test "should update branch" do
    patch branch_url(@branch), params: { branch: { name: @branch.name } }
    assert_redirected_to branch_url(@branch)
  end

  test "should destroy branch" do
    assert_difference('Branch.count', -1) do
      delete branch_url(@branch)
    end

    assert_redirected_to branches_url
  end
end
