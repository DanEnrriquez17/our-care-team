require "test_helper"

class EventControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get event_index_url
    assert_response :success
  end

  test "should get show" do
    get event_show_url
    assert_response :success
  end

  test "should get new" do
    get event_new_url
    assert_response :success
  end

  test "should get create" do
    get event_create_url
    assert_response :success
  end

  test "should get edit" do
    get event_edit_url
    assert_response :success
  end

  test "should get update" do
    get event_update_url
    assert_response :success
  end

  test "should get destroy" do
    get event_destroy_url
    assert_response :success
  end
end
