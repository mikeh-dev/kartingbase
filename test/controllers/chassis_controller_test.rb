require "test_helper"

class ChassisControllerTest < ActionDispatch::IntegrationTest

  def setup
    @chassis = chassis(:kosmic)
  end
  
  test "should get index" do
    get chassis_index_url
    assert_response :success
  end

  test "should get new" do
    get new_chassis_path
    assert_response :success
  end

  test "should create chassis" do
    get new_chassis_path
  end

  test "should show chassis" do
    get chassis_path(@chassis)
  end

  test "should be able to edit chassis" do
    get edit_chassis_path(@chassis)
    patch chassis_path(@chassis), params: { chassis: { make:  @chassis.make, model: @chassis.model, year: @chassis.year, stolen: @chassis.stolen } }
  end

end
