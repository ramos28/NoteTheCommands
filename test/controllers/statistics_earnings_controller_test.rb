require 'test_helper'

class StatisticsEarningsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get statistics_earnings_index_url
    assert_response :success
  end

end
