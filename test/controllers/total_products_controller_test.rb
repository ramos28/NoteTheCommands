require 'test_helper'

class TotalProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get total_products_index_url
    assert_response :success
  end

end
