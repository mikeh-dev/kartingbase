require "test_helper"

class ChassisTest < ActiveSupport::TestCase
  def setup
    @stolenchassis = chassis(:gillard)
    @notstolenchassis = chassis(:kosmic)
  end

  test 'chassis should be valid' do
    assert @stolenchassis.valid?
  end
end
