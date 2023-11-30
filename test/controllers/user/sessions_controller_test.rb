require "test_helper"

class User::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get user_sessions_login_url
    assert_response :success
  end
end
