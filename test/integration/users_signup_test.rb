require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  get signup_path
  assert_no_difference 'User.count' do
    post users_path, params: { user: { name: "",
                                       email: "user@invalid",
                                       password:             "wrong"
                                       password_confrmation: "still wrong" } }

  end
end
