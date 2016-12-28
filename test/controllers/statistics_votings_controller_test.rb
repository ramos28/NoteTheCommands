require 'test_helper'

class StatisticsVotingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get statistics_votings_index_url
    assert_response :success
  end

end
