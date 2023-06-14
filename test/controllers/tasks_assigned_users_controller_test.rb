require "test_helper"

class TasksAssignedUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tasks_assigned_users_index_url
    assert_response :success
  end

  test "should get new" do
    get tasks_assigned_users_new_url
    assert_response :success
  end

  test "should get create" do
    get tasks_assigned_users_create_url
    assert_response :success
  end

  test "should get edit" do
    get tasks_assigned_users_edit_url
    assert_response :success
  end

  test "should get show" do
    get tasks_assigned_users_show_url
    assert_response :success
  end

  test "should get update" do
    get tasks_assigned_users_update_url
    assert_response :success
  end

  test "should get destroy" do
    get tasks_assigned_users_destroy_url
    assert_response :success
  end
end
