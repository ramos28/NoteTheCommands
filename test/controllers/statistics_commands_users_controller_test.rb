require 'test_helper'

class StatisticsCommandsUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get statistics_expenses_index_url
    assert_response :success
  end

end
