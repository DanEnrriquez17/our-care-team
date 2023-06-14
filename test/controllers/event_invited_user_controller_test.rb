require "test_helper"

class EventInvitedUserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get event_invited_user_index_url
    assert_response :success
  end

  test "should get show" do
    get event_invited_user_show_url
    assert_response :success
  end

  test "should get new" do
    get event_invited_user_new_url
    assert_response :success
  end

  test "should get create" do
    get event_invited_user_create_url
    assert_response :success
  end

  test "should get edit" do
    get event_invited_user_edit_url
    assert_response :success
  end

  test "should get update" do
    get event_invited_user_update_url
    assert_response :success
  end

  test "should get destroy" do
    get event_invited_user_destroy_url
    assert_response :success
  end
end
