require "test_helper"

class TracksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tracks_path
    assert_response :success
  end
end
