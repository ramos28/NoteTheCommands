require 'test_helper'

class RestaurantsUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get restaurants_users_index_url
    assert_response :success
  end

end
