require 'test_helper'

class FacebookAppControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

end
