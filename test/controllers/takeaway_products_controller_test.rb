require 'test_helper'

class TakeawayProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get takeaway_products_index_url
    assert_response :success
  end

end
