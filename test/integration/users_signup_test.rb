require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
    post users_path, params: { user: { name: "",
                                       email: "user@invalid",
                                       password:             "wrong",
                                       password_confrmation: "still wrong" } }

    end
    assert_response :unprocessable_entity
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count' do
    post users_path, params: { user: { name: "Test User",
                                       email: "user@test.com",
                                       password:             "correct",
                                       password_confrmation: "correct" } }

    end
    follow_redirect!
    #assert_template 'users/show'
    #assert is_logged_in?
  end


end
