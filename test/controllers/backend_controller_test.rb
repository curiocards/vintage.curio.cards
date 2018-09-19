require 'test_helper'

class BackendControllerTest < ActionDispatch::IntegrationTest
  test "should get lookup" do
    get backend_lookup_url
    assert_response :success
  end

end
