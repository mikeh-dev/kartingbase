require "test_helper"

class MicropostTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:michael)
    @micropost = @user.microposts.build(content: "this is a test")
  end
  
  test 'user should be valid' do
    assert @micropost.valid?
  end

  test 'user id should be present' do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test 'content should be present' do
    @micropost.content = nil
    assert_not @micropost.valid?
  end

  test 'content should be at most 140 chars' do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end

  test "micropost order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end

end
