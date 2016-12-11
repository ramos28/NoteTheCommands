require 'test_helper'

class TotalRestaurantsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get total_restaurants_index_url
    assert_response :success
  end

end
