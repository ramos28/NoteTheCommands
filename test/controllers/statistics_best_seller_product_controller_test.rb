require 'test_helper'

class StatisticsBestSellerProductControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get statistics_best_seller_product_index_url
    assert_response :success
  end

end
