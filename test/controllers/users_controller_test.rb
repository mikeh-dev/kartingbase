require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @another = users(:david)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test 'should redirect when not logged in' do
    get edit_user_path(@user)
    assert_redirected_to login_url
    assert_not flash.empty?
  end

  test 'should redirect update when not logged in' do
    patch user_path(@user), params: { user: { name:  @user.name,
      email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should redirect and process update when logged in' do
    log_in_as(@user)
    get edit_user_path(@user)
    patch user_path(@user), params: { user: { name:  @user.name,
      email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to user_path
  end

  test "should redirect edit when logged is as wrong user" do
    log_in_as(@user)
    get edit_user_path(@another)
    assert flash.empty?
    assert_redirected_to root_path
  end

  test "should redirect update when logged is as wrong user" do
    log_in_as(@user)
    patch user_path(@another), params: { user: { name:  @user.name,
      email: @user.email } }
    assert flash.empty?
    assert_redirected_to root_path
  end

  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_url
  end

  test "should not allow admin attr to be edited via web" do
    log_in_as(@another)
    assert_not @another.admin?
    patch user_path(@another), params: { user: { name:  @another.name,
      email: @another.email, admin: true } }
    assert_not @another.reload.admin?
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_response :see_other
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non admin" do
    log_in_as(@another)
    assert_no_difference 'User.count' do
      delete user_path(@user)
    end
    assert_response :see_other
    assert_redirected_to root_url
  end

  test "should redirect following when not logged in" do
    get following_user_path(@user)
    assert_redirected_to login_url
  end

  test "should redirect followers when not logged in" do
    get followers_user_path(@user)
    assert_redirected_to login_url
  end



end
