require 'test_helper'

class ControllernameControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get controllername_new_url
    assert_response :success
  end

  test "should get users" do
    get controllername_users_url
    assert_response :success
  end

end
