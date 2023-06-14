require "test_helper"

class PostMentionedUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get post_mentioned_users_index_url
    assert_response :success
  end

  test "should get new" do
    get post_mentioned_users_new_url
    assert_response :success
  end

  test "should get create" do
    get post_mentioned_users_create_url
    assert_response :success
  end
end
