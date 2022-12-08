require "test_helper"

class EntryTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @entry = @user.entries.build(sessionnotes: "This is a test entry", run: 1)
  end
  
  test 'entry should be valid' do
    assert @entry.valid?
  end

  test 'user id should be present' do
    @entry.user_id = nil
    assert_not @entry.valid?
  end

  test 'content should be present' do
    @entry.sessionnotes = nil
    assert_not @entry.valid?
  end

end
