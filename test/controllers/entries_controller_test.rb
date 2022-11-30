require "test_helper"

class EntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get entries_path
    assert_response :success
  end
end
