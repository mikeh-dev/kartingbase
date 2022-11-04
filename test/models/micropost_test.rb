require "test_helper"

class MicropostTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:michael)
    @micropost = Micropost.new(content: "this is a test", user_id: @user.id)
  end
  
  test 'user should be valid' do
    assert @micropost.valid?
  end

  test 'user id should be present' do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end
end
