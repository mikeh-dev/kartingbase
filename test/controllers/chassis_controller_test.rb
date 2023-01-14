require "test_helper"

class ChassisControllerTest < ActionDispatch::IntegrationTest
  
  test "should get index" do
    get chassis_index_url
    assert_response :success
  end

  

  test "should get new" do
    get chassis_new_path
    assert_response :success
  end

end
